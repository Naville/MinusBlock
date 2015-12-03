/*%group GoogleAD
#include "Hooks/SDKSpecific/GoogleAdMob.xm"
%end*/
extern "C" void init_GoogleAdMob_hook();
%ctor {
init_GoogleAdMob_hook();
}