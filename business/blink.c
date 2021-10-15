#include "blink.h"

bool blink_run(void *object, hw_interface *hw)
{
    bool status = true;

    if(hw->init(object) == false)
        status = false;

    while(status)
    {
        hw->set(object, state_on);
        hw->delay(ONE_SECOND);
        hw->set(object, state_off);
        hw->delay(ONE_SECOND);
    }

    return status;
}