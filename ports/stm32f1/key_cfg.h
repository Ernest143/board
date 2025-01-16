#ifndef KEY_CFG_H
#define KEY_CFG_H

#include "key_press.h"

typedef struct {
    uint32_t num;
    key_configure_typedef *list;
} key_cfg_list_typedef;

extern key_cfg_list_typedef g_key_list;

#endif