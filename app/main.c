#include "board_api.h"

int main(void)
{
    board_init();

    while (1)
    {
        remote_motor();
    }
}