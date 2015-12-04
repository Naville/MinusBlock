#ifdef AdView
extern "C" void init_AdView_hook();
init_AdView_hook();
#endif
#ifdef AdViewVideoDelegate
extern "C" void init_AdViewVideoDelegate_hook();
init_AdViewVideoDelegate_hook();
#endif
#ifdef GoogleAdMob
extern "C" void init_GoogleAdMob_hook();
init_GoogleAdMob_hook();
#endif
#ifdef InMobi
extern "C" void init_InMobi_hook();
init_InMobi_hook();
#endif
extern "C" void init_NSURLConnection_hook();
#ifdef NSURLConnection
init_NSURLConnection_hook();
#endif
extern "C" void init_TapJoy_hook();
#ifdef TapJoy
init_TapJoy_hook();
#endif
