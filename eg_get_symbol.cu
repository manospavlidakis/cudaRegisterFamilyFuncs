#include <iostream>
#include <cassert>
#include <iostream>
#include <iomanip>
#include <cstddef>
#include <vector>
#include <tuple>
using namespace std;

extern cudaError_t cudaGetExportTable(const void ** ppExportTable, const cudaUUID_t * pExportTableId);
__device__ long long device_int;
__device__ int device_int2;


__global__ void kernel(long long *a)
{
    device_int= device_int2+1000;
    *a = (long long)&device_int;
    //device_int2 = (int)&device_int;
    //printf("%p:\n",&device_int);

}
void uuid_print(cudaUUID_t a){
  std::cout << "GPU";
  std::vector<std::tuple<int, int> > r = {{0,4}, {4,6}, {6,8}, {8,10}, {10,16}};
  for (auto t : r){
    std::cout << "-";
    for (int i = std::get<0>(t); i < std::get<1>(t); i++)
      std::cout << std::hex << std::setfill('0') << std::setw(2) << (unsigned)(unsigned char)a.bytes[i];
  }
  std::cout << std::endl;
}
int main()
{
  const int * ppExportTable[1024]={0};
  printf("ppExportTable: %p\n", &ppExportTable[0]);
  //char exportTable[1024*1024*1024]; 
  const cudaUUID_t desired_UUID = {
    (char)0xafU, 
    (char)0x3dU, 
    (char)0xd3U, //
    (char)0x92U, 
    (char)0x2aU, 
    (char)0x88U, 
    (char)0x00U, 
    (char)0x32U, 
    (char)0xcbU, 
    (char)0xccU, 
    (char)0x80U, 
    (char)0x3dU, 
    (char)0x29U, 
    (char)0x7eU, 
    (char)0x5fU, 
    (char)0xa2U};
  cudaGetExportTable(((const void**)&ppExportTable), &desired_UUID);

  uuid_print(desired_UUID);
  printf("ppExportTable: %p\n", &ppExportTable[0]);
  printf("ppExportTable[0]: %p\n", ppExportTable[0]);
  for (int i = 0; i<1024; i++){
    printf("ppExportTable[%d]: %p\n", i,ppExportTable[i]);
  }
#if 0
    long long *d_A, h_A;    
    cudaMalloc(&d_A, sizeof(long long));	
    kernel<<<1, 1>>>(d_A);
    assert(cudaGetLastError() == cudaSuccess);

    int *host_pointer_to_device_int;
    /* Get a pointer to device_int. After this, I won't be able to access it,
     * but I'm going to copy its value with cudaMemcpy */
    cudaError_t err = cudaGetSymbolAddress((void **)&host_pointer_to_device_int, "device_int");
    std::cerr<<"ptr: "<<host_pointer_to_device_int<<std::endl;
    std::cerr<<"Error: "<<cudaGetErrorString(err)<<std::endl;
    assert(cudaGetLastError() == cudaSuccess); // The above operation executed successfully
    //__cudaRegisterVar(0, 0, 0 ,0, 0, 0 ,0, 0 );
    int host_int;
    // Copy the device_int's value
    cudaMemcpy(&h_A, d_A,
            sizeof(long long), cudaMemcpyDeviceToHost);
    assert(cudaGetLastError() == cudaSuccess); // The above operation executed successfully
//    printf("host int: %lu\n",host_int );
    cout <<"A: "<<std::hex<< h_A << endl; // Everything's fine!
#endif
}
