#if PERF
#include "papi.h"



int papi_init(int *event_set) {
  int events[3] = {PAPI_L1_DCM, PAPI_L2_DCM, PAPI_L3_TCM}, ret;

  cpu_set_t cpuset;
  CPU_ZERO(&cpuset);       //clears the cpuset
  CPU_SET(0, &cpuset);     //initialize cpuset to 0x0
  sched_setaffinity(0, sizeof(cpuset), &cpuset); //initialize main thread to P0

  ret = PAPI_library_init(PAPI_VER_CURRENT);
  if (ret != PAPI_VER_CURRENT && ret > 0) {
    fprintf(stderr,"PAPI library version mismatch!\n");
    exit(1);
  }
  if (ret < 0) {
    fprintf(stderr, "Initialization error!\n");
    exit(1);
  }

  ret = PAPI_create_eventset(event_set);
  if(ret != PAPI_OK){
    fprintf(stderr, "create event set error\n");
    exit(1);
  }
  ret = PAPI_add_events(*event_set, events, 3);
  if(ret != PAPI_OK){
    fprintf(stderr, "hi add event error\n");
    fprintf(stderr, "%d %s\n", ret, PAPI_strerror(ret));
    exit(1);
  }

  return ret;
}
#endif
