#include <stdio.h>

__global__ void sayHelloWorld() { printf("HELLO WORLD from a Kernel"); }

__host__ int main() {
  /*
    The CUDA programming model is a heterogeneous model in which both the CPU and GPU are used.
    In CUDA :

      (1) the host refers to the CPU and its memory (RAM).

      (2) while the device refers to the GPU and its memory (vRAM).

    Code run on the host (CPU) can manage memory on both the host and device, and also launches
    kernels which are functions executed on the device (GPU). These kernels are executed by many
    GPU threads in parallel.

    Given the heterogeneous nature of the CUDA programming model, a typical sequence of operations
    for a CUDA C program is:

      (1) Declare and allocate host and device memory.
      (2) Initialize host data.
      (3) Transfer data from the host to the device.
      (4) Execute one or more kernels.
      (5) Transfer results from the device to the host.
  */

  /*
    <<<1, 1>>> is called the execution configuration, which dictates how many device threads
    execute the kernel in parallel.

    Configuration arguments :

      (1) Number of thread blocks

        A thread block is a programming abstraction that represents a group of threads that can be
        executed in parallel. For better process and data mapping, threads are grouped into thread
        blocks.

      (2) Number of threads per thread block
  */
  sayHelloWorld<<<1, 1>>>();

  return 0;
}
