#include <blink.h>
#include <stdio.h>
#include <unistd.h>

typedef struct 
{
    int pin;
} pc_object_t;

static bool pc_init(void *object);
static bool pc_set(void *object, state_t state);
static void pc_delay(int seconds);


typedef struct 
{
    hw_interface hw;
    pc_object_t pc;
} pc_context;

int main(void)
{
    pc_context pc_ctx = 
    {
        .hw = 
        {
            .init = pc_init,
            .set = pc_set,
            .delay = pc_delay
        },
        .pc = 
        {
            .pin = 0
        }
    };

    blink_run(&pc_ctx.pc, &pc_ctx.hw);

    return 0;
}

static bool pc_init(void *object)
{
    (void)object;
    printf("PC Init\n");
    return true;
}

static bool pc_set(void *object, state_t state)
{
    (void)object;
    printf("State: %s\n", state ? "ON" : "OFF");
    return true;
}

static void pc_delay(int seconds)
{
    sleep(seconds);
}