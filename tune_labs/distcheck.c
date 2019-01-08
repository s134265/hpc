#include "data.h"


#ifdef ARRAY_OF_STRUCTS
double 
distcheck(particle_t *p, int n) {

    int i;
    double dist = 0;
    for(i=0;i<n;i++){
        dist+=p[i].dist;
    }
    return dist;
}
#else
double 
distcheck(particle_t p, int n) {
    int i;
    double dist = 0;
    for(i=0;i<n;i++){
        dist+=p.dist[i];
    }
    return dist;
}
#endif
