#ifndef N64_CONFIG_H
#define N64_CONFIG_H

#define SCREEN_WD 320
#define SCREEN_HT 240

#define NTSC 0
#define PAL 1
#define MPAL 2 // Brazilian TV’s.

#define TV_TYPE PAL

#define GLIST_LENGTH 2048

Gfx *glistp;
Gfx glist[GLIST_LENGTH];
void RCPInit(Gfx *glistp);

#endif
