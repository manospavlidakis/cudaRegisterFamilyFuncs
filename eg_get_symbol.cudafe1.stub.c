#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-function"
#pragma GCC diagnostic ignored "-Wcast-qual"
#define __NV_CUBIN_HANDLE_STORAGE__ static
#if !defined(__CUDA_INCLUDE_COMPILER_INTERNAL_HEADERS__)
#define __CUDA_INCLUDE_COMPILER_INTERNAL_HEADERS__
#endif
#include "crt/host_runtime.h"
#include "eg_get_symbol.fatbin.c"
extern void __device_stub__Z6kernelv(void);
static void __nv_cudaEntityRegisterCallback(void **);
static void __sti____cudaRegisterAll(void) __attribute__((__constructor__));
void __device_stub__Z6kernelv(void){__cudaLaunchPrologue(1);__cudaLaunch(((char *)((void ( *)(void))kernel)));}
# 10 "eg_get_symbol.cu"
void kernel(void)
# 11 "eg_get_symbol.cu"
{__device_stub__Z6kernelv();


}
# 1 "eg_get_symbol.cudafe1.stub.c"
static void __nv_cudaEntityRegisterCallback( void **__T1) {  __nv_dummy_param_ref(__T1); __nv_save_fatbinhandle_for_managed_rt(__T1); __cudaRegisterEntry(__T1, ((void ( *)(void))kernel), _Z6kernelv, (-1)); __cudaRegisterVariable(__T1, __shadow_var(device_int,::device_int), 0, 4UL, 0, 0); __cudaRegisterVariable(__T1, __shadow_var(device_int2,::device_int2), 0, 4UL, 1, 0); }
static void __sti____cudaRegisterAll(void) {  __cudaRegisterBinary(__nv_cudaEntityRegisterCallback);  }

#pragma GCC diagnostic pop
