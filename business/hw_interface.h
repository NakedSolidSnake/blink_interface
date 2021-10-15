#ifndef HW_INTERFACE_H
#define HW_INTERFACE_H

#include <stdbool.h>

typedef enum 
{
    state_off,
    state_on
} state_t;

typedef struct 
{
    bool (*init)(void *object);
    bool (*set)(void *object, state_t state);
    void (*delay)(int seconds);
} hw_interface;

#endif /* HW_INTERFACE_H */
