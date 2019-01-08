#include "data.h"
#include "math.h"

#ifdef ARRAY_OF_STRUCTS
double 
distance(particle_t *p, int n) {
    int i;
    double dist = 0;
    for(i=0;i<n;i++){
        p[i].dist=p[i].x*p[i].x+p[i].y*p[i].z+p[i].y*p[i].z;
        
    }
    for(i=0;i<n;i++){
        p[i].dist= sqrt(p[i].dist);
        dist += p[i].dist;
    }
    return dist;
}
#else
double 
distance(particle_t p, int n) {
    int i;
    double dist = 0;
    for(i=0;i<n;i++){
        p.dist[i]=p.x[i]*p.x[i]+p.y[i]*p.y[i]+p.z[i]*p.z[i];
    }
    }
    for(i=0;i<n;i++){
        p[i].dist= sqrt(p.dist[i]);
        dist += p.dist[i];
    }
    return dist;
}
#endif
