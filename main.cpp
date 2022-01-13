#include <iostream>
#include <thread>
#include <mutex>
#include <vector>
#include <omp.h>
#include <atomic>

#define  STEPS 100000000
#define CACHE_LINE 64u
#define MIN 1
#define MAX 300
#define SEED 100

using namespace std;

typedef double (*randomize_function) (unsigned, unsigned*, size_t, unsigned, unsigned);

typedef double (*R_t)(unsigned*, size_t);
typedef struct experiment_result {
    double result;
    double time_ms;
} experiment_result;

experiment_result run_experiment_random(R_t R) {
    size_t len = 100000;
    unsigned arr[len];
    unsigned seed = SEED;
    double t0 = omp_get_wtime();
    double Res = R((unsigned *)&arr, len);
    double t1 = omp_get_wtime();
    return {
            Res,
            t1 - t0
    };
}

unsigned num_threads = std::thread::hardware_concurrency();

void set_num_threads(unsigned T) {
    omp_set_num_threads(T);
    num_threads = T;
}
unsigned get_num_threads()
{
    return num_threads;
}

double RandomizeArraySingle(unsigned seed, unsigned* V, size_t n, unsigned min, unsigned max)
{
    uint64_t A = 6364136223846793005;
    unsigned B = 1;

    uint64_t prev = seed;
    uint64_t Sum = 0;

    for(unsigned int i = 0; i < n; i++)
    {
        uint64_t next = A*prev + B;
        V[i] = (next % (max - min + 1)) + min;
        prev = next;
        Sum += V[i];
        std::cout<<V[i]<<" ";
    }

    return (double)Sum/(double)n;
}

uint64_t pow(uint64_t base, uint64_t exp)
{
    uint64_t res = 1;
    for (unsigned i = 0; i < exp; i++)
    {
        res *= base;
    }
    return res;
}

uint64_t getB(unsigned exp, uint64_t A, uint64_t B)
{
    uint64_t sum = 0;
    for (unsigned i = 0; i <= exp; i++)
    {
        sum += pow(A, i);
    }

    if (sum == 0) {
        return B;
    } else {
        return B*sum;
    }
}

double RandomizeArrayShared(unsigned seed, unsigned* V, size_t n, unsigned min, unsigned max)
{
    uint64_t A = 6364136223846793005;
    uint64_t B = 1;
    unsigned T;
    uint64_t findA, findB;
    uint64_t Sum = 0;

#pragma omp parallel shared(T, V, findA, findB)
    {
        unsigned t = (unsigned) omp_get_thread_num();
#pragma omp single
        {
            T = (unsigned) omp_get_num_threads();
            findA = pow(A, T);
            findB = getB(T - 1, A, B);
        }
        uint64_t prev = seed;
        uint64_t elem;
        for (unsigned i = t; i < n; i += T)
        {
            if (i == t)
            {
                elem = pow(A, i + 1) * prev + getB(i, A, B);
            } else
            {
                elem = findA * prev + findB;
            }
            V[i] = (elem % (max - min + 1)) + min;
            prev = elem;
        }
    }

    for (unsigned i = 0; i < n; i++)
    {
        Sum += V[i];
    }

    return (double)Sum/(double)n;
}

experiment_result RandomizerExperiment (randomize_function f) {
    size_t ArrayLength = 500000;
    unsigned Array[ArrayLength];
    unsigned seed = 20;

    double t0, t1, result;

    t0 = omp_get_wtime();
    result = f(seed, (unsigned *) &Array, ArrayLength, 1, 255);
    t1 = omp_get_wtime();

    return {result, t1 - t0};
}
void ShowExperimentResultRand(randomize_function f)
{
    double T1;
    printf("%10s. %10s %10sms %10s\n", "Threads", "Result", "Time", "Acceleration");
    for(unsigned T = 1; T <=omp_get_num_procs(); T++)
    {
        experiment_result Experiment;
        set_num_threads(T);
        Experiment = RandomizerExperiment(f);
        if (T == 1) {
            T1 = Experiment.time_ms;
        }
        printf("%10d. %10g %10gms %10g\n", T, Experiment.result, Experiment.time_ms, T1/Experiment.time_ms);
    }
    printf("\n");
}

int main() {
    ShowExperimentResultRand(RandomizeArrayShared);
}