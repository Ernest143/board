#include "board_api.h"

int main(void)
{
    board_init();
    printf(" app start...\r\n");

    while (1)
    {
        remote_motor();
    }
}