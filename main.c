#include <nusys.h>

static void vsyncCallback(int pendingTaskCount);

void mainproc(void *dummy)
{
  nuGfxInit();
  nuGfxFuncSet((NUGfxFunc)vsyncCallback);
  nuGfxDisplayOn();

  while (1)
    ;
}

void vsyncCallback(int pendingTaskCount)
{
}
