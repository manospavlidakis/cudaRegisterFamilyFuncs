#include <cuda_runtime.h> //Runtime API
#include <cuda.h> //Driver API
#include <cublas_v2.h>
#include <stdio.h>
#include <unistd.h>
#include <dlfcn.h>
#include <string>
#include <iostream>
#include <cstring>
#include <unordered_map>
#include <streambuf>
#include <chrono>
#include "rapidjson/document.h"
#include <iostream>
#include <string>
#include <map>
#include <vector>
#include <fstream>
#include <sstream>
#include <time.h>
extern "C"
{
    typedef cudaError_t (*cudaRegisterVar_t)(void **, const char *, const char *, const char *, size_t, int, int, int);
    static cudaRegisterVar_t cudaRegisterVar_original = NULL;
    cudaError_t __cudaRegisterVar(void **fatCubinHandle, const char *hostVar, const char *deviceAddress, const char *deviceName, size_t ext, int v, int e, int f)
    {
        printf("Intercept __cudaRegisterVar: %p %p %s\n", hostVar, deviceAddress, deviceName);
        cudaRegisterVar_original = (cudaRegisterVar_t)dlsym(RTLD_NEXT, "__cudaRegisterVar");
        // Modify or perform any desired operations before calling the original function
        return cudaRegisterVar_original(fatCubinHandle, hostVar, deviceAddress, deviceName, ext, v, e, f);
    }
}

