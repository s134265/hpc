#include "data.h"

#ifdef ARRAY_OF_STRUCTS
double 
distance(particle_t *p, int n) {
    int i;
    double dist = 0;
    for(i=0;i<n;i++){
        dist+=pow(pow(p[i].x,2)+pow(p[i].y,2)+pow(p[i].z,2),0.5);
    }
    return dist;
}
#else
double 
distance(particle_t p, int n) {
    int i;
    double dist = 0;
    for(i=0;i<n;i++){
        dist+=pow(pow(p.x[i],2)+pow(p.y[i],2)+pow(p.z[i],2),0.5);
    }
    return dist;
}
#endif
