#include "AppDelegate.h"
#include "SceneManage.h"
#include "Base.h"
#include "MobClickCpp.h"

USING_NS_CC;

AppDelegate::AppDelegate() {

}

AppDelegate::~AppDelegate() 
{
}

//if you want a different context,just modify the value of glContextAttrs
//it will takes effect on all platforms
void AppDelegate::initGLContextAttrs()
{
    //set OpenGL context attributions,now can only set six attributions:
    //red,green,blue,alpha,depth,stencil
    GLContextAttrs glContextAttrs = {8, 8, 8, 8, 24, 8};

    GLView::setGLContextAttrs(glContextAttrs);
}

bool AppDelegate::applicationDidFinishLaunching() {
    // initialize director
    auto director = Director::getInstance();
    auto glview = director->getOpenGLView();
    if(!glview) {
        glview = GLViewImpl::create("My Game");
        director->setOpenGLView(glview);
    }

    // turn on display FPS
    //director->setDisplayStats(true);

    // set FPS. the default value is 1.0/60 if you don't call this
    director->setAnimationInterval(GAME_TIME_LEN);
    
#ifdef USE_UMENG_Anlaysis
    MOBCLICKCPP_START_WITH_APPKEY_AND_CHANNEL(UMENG_APP_KEY, "ios_appstore");
#endif
    
    //-------------------------------------------------------
    // 设置资源的搜索路径
    auto fileUtils = FileUtils::getInstance();
    std::vector<std::string> searchPaths;
    
    searchPaths.push_back("res_game/armature");
    searchPaths.push_back("res_game/data");
    searchPaths.push_back("res_game/map");
    searchPaths.push_back("res_game/music");
    searchPaths.push_back("res_game/npc");
    searchPaths.push_back("res_game/script");
    searchPaths.push_back("res_game/ui");
    searchPaths.push_back("res_game");
    
    fileUtils->setSearchPaths(searchPaths);
    
    std::vector<std::string> searchPaths1 = CCFileUtils::getInstance()->getSearchPaths();
    for (std::vector<std::string>::const_iterator iter = searchPaths1.begin(); iter != searchPaths1.end(); ++iter)
    {
        CCLOG("AppDelegate, searchPaths1--xxx : %s", iter->data());
    }
    //-------------------------------------------------------

    
    BaseInit();
    SceneManage::RunWithScene();    // 运行第一个场景

    return true;
}

// This function will be called when the app is inactive. When comes a phone call,it's be invoked too
void AppDelegate::applicationDidEnterBackground() {
    Director::getInstance()->stopAnimation();
    
#ifdef USE_UMENG_Anlaysis
    umeng::MobClickCpp::applicationDidEnterBackground();
#endif
    

    // if you use SimpleAudioEngine, it must be pause
    // SimpleAudioEngine::getInstance()->pauseBackgroundMusic();
}

// this function will be called when the app is active again
void AppDelegate::applicationWillEnterForeground() {
    Director::getInstance()->startAnimation();
    
#ifdef USE_UMENG_Anlaysis
    umeng::MobClickCpp::applicationWillEnterForeground();
#endif
    

    // if you use SimpleAudioEngine, it must resume here
    // SimpleAudioEngine::getInstance()->resumeBackgroundMusic();
}
