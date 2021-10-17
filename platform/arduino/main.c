#define __DELAY_BACKWARD_COMPATIBLE__

#include <avr/io.h>
#include <util/delay.h>
#include "blink.h"

typedef struct 
{
    int pin;
} arduino_object_t;

static bool arduino_init(void *object);
static bool arduino_set(void *object, state_t state);
static void arduino_delay(int seconds);


typedef struct 
{
    hw_interface hw;
    arduino_object_t arduino;
} arduino_context;

int main(void)
{

    arduino_context arduino_ctx = 
    {
        .hw = 
        {
            .init = arduino_init,
            .set = arduino_set,
            .delay = arduino_delay
        },
        .arduino = 
        {
            .pin = 5
        }
    };

    blink_run(&arduino_ctx.arduino, &arduino_ctx.hw);
}

static bool arduino_init(void *object)
{
    arduino_object_t *arduino_object = (arduino_object_t *)object;
    DDRB |= _BV(arduino_object->pin);
    return true;
}

static bool arduino_set(void *object, state_t state)
{
    arduino_object_t *arduino_object = (arduino_object_t *)object;
    if(state)
        PORTB |= _BV(arduino_object->pin);
    else 
        PORTB &= ~_BV(arduino_object->pin);
    return true;
}

static void arduino_delay(int seconds)
{
    _delay_ms(seconds * 1000);
}