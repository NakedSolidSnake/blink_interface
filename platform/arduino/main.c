#include <Arduino.h>
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

static arduino_context arduino_ctx = 
{
    .hw = 
    {
        .init = arduino_init,
        .set = arduino_set,
        .delay = arduino_delay
    },
    .arduino = 
    {
        .pin = 13
    }
};

void setup(void)
{

}

void loop(void)
{
    blink_run(&arduino_ctx.arduino, &arduino_ctx.hw);
}

static bool arduino_init(void *object)
{
    arduino_object_t *arduino_object = (arduino_object_t *)object;
    pinMode(arduino_object->pin, OUTPUT);
    return true;
}

static bool arduino_set(void *object, state_t state)
{
    arduino_object_t *arduino_object = (arduino_object_t *)object;
    digitalWrite(arduino_object->pin, state);
    return true;
}

static void arduino_delay(int seconds)
{
    delay(seconds * 1000);
}