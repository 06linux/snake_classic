#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppController : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property(nonatomic, readonly) RootViewController* viewController;

@end

//*************************************************************************
//  C 语言代码部分

typedef struct
{
    AppController*          appDelegate;
    RootViewController*     gameViewConTronller;
//    EAGLView*				gGlView;
//    UIWindow*				gWindow;
    
}SysController;
extern SysController gSysCtl;

//*************************************************************************
