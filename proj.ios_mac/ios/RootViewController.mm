/****************************************************************************
 Copyright (c) 2013      cocos2d-x.org
 Copyright (c) 2013-2014 Chukong Technologies Inc.

 http://www.cocos2d-x.org

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ****************************************************************************/

#import "RootViewController.h"
#import "cocos2d.h"
#import "platform/ios/CCEAGLView-ios.h"

#import "Base.h"

@implementation RootViewController
@synthesize adView;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

*/
// Override to allow orientations other than the default portrait orientation.
// This method is deprecated on ios6
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsLandscape( interfaceOrientation );
}

// For ios6, use supportedInterfaceOrientations & shouldAutorotate instead
- (NSUInteger) supportedInterfaceOrientations{
#ifdef __IPHONE_6_0
    return UIInterfaceOrientationMaskAllButUpsideDown;
#endif
}

- (BOOL) shouldAutorotate {
    return YES;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];

    auto glview = cocos2d::Director::getInstance()->getOpenGLView();

    if (glview)
    {
        CCEAGLView *eaglview = (CCEAGLView*) glview->getEAGLView();

        if (eaglview)
        {
            CGSize s = CGSizeMake([eaglview getWidth], [eaglview getHeight]);
            cocos2d::Application::getInstance()->applicationScreenSizeChanged((int) s.width, (int) s.height);
        }
    }
}

//fix not hide status on ios7
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}




// ***************** 广告部分 **************************************

#pragma mark -
#pragma mark AdMoGo

- (void)initAdView:(CCEAGLView *) gameView
{
#ifdef USE_AdMoGo
    
    printf("initAdView ...\n");
    
    //    typedef enum {
    //        AdViewTypeUnknown = 0,          //error
    //        AdViewTypeNormalBanner = 1,     //e.g. 320 * 50 ; 320 * 48  iphone banner
    //        AdViewTypeLargeBanner = 2,      //e.g. 728 * 90 ; 768 * 110 ipad only
    //        AdViewTypeMediumBanner = 3,     //e.g. 468 * 60 ; 508 * 80  ipad only
    //        AdViewTypeRectangle = 4,        //e.g. 300 * 250; 320 * 270 ipad only
    //        AdViewTypeSky = 5,              //Don't support
    //        AdViewTypeFullScreen = 6,       //iphone full screen ad
    //        AdViewTypeVideo = 7,            //Don't support
    //        AdViewTypeiPadNormalBanner = 8, //ipad use iphone banner
    //    } AdViewType;
    
    
   
    if(DISP_IPAD == gDisplayMode)
    {
        adView = [[AdMoGoView alloc] initWithAppKey:@AdMoGo_KEY_Ipad
                                             adType:AdViewTypeLargeBanner
                                 adMoGoViewDelegate:self];
    }
    else
    {
        adView = [[AdMoGoView alloc] initWithAppKey:@AdMoGo_KEY
                                             adType:AdViewTypeNormalBanner
                                 adMoGoViewDelegate:self];
    }
    
    
    adView.adWebBrowswerDelegate = self;
    
    
    adView.frame = CGRectZero;
    [self.view addSubview:adView];
    [adView release];
    
#endif
}

- (void)setAdViewHidden:(BOOL) isHidden
{
#ifdef USE_AdMoGo
    self.adView.hidden = isHidden;
    
    CGSize adSize = adView.frame.size;
    CGRect newFrame = adView.frame;
    newFrame.origin.x = (self.view.bounds.size.width - adSize.width)/2; // 居中
    //newFrame.origin.y = 0;  // 顶部显示
    newFrame.origin.y = self.view.bounds.size.height - adSize.height;   // 底部显示
    newFrame.size = adSize;
    
    if(isHidden)
    {
        newFrame.origin.y = -SCREEN_H; // 屏幕外边
    }
    
    adView.frame = newFrame;
    
#endif
}

#pragma mark -
#pragma mark AdMoGoDelegate delegate
/*
 返回广告rootViewController
 */
- (UIViewController *)viewControllerForPresentingModalView{
    return self;
}

/**
 * 广告开始请求回调
 */
- (void)adMoGoDidStartAd:(AdMoGoView *)adMoGoView{
    NSLog(@"广告开始请求回调");
}

- (void)adMoGoDidReceiveAd:(AdMoGoView *)adMoGoView
{
    printf("adMoGoDidReceiveAd ...\n");
    
    // 第一次刷新广告显示的时候
    if(gAdCanShow)
    {
        [self setAdViewHidden:NO];
    }
    else
    {
        [self setAdViewHidden:YES];
    }
}
/**
 * 广告接收失败回调
 */
- (void)adMoGoDidFailToReceiveAd:(AdMoGoView *)adMoGoView didFailWithError:(NSError *)error{
    NSLog(@"广告接收失败回调");
}

/**
 * 点击广告回调
 */
- (void)adMoGoClickAd:(AdMoGoView *)adMoGoView{
    NSLog(@"点击广告回调");
}
/**
 *You can get notified when the user delete the ad
 广告关闭回调
 */
- (void)adMoGoDeleteAd:(AdMoGoView *)adMoGoView{
    NSLog(@"广告关闭回调");
}

/**
 *You can get notified when the user delete the ad
 返回 YES 表示由开发者处理关闭广告事件
 返回 NO 表示由sdk处理关闭广告事件
 */
- (BOOL)adMoGoDealCloseAd:(AdMoGoView *)adMoGoView
{
    return NO;
}

/**
 *Ad Init Finish
 *You can use this delegate method request a ad in manualrefresh status
 *广告初始化完成
 */
- (void)adMoGoInitFinish:(AdMoGoView *)adMoGoView
{
    
}


#pragma mark -
#pragma mark AdMoGoWebBrowserControllerUserDelegate delegate

/*
 浏览器将要展示
 */
- (void)webBrowserWillAppear{
    NSLog(@"浏览器将要展示");
}

/*
 浏览器已经展示
 */
- (void)webBrowserDidAppear{
    NSLog(@"浏览器已经展示");
}

/*
 浏览器将要关闭
 */
- (void)webBrowserWillClosed{
    NSLog(@"浏览器将要关闭");
}

/*
 浏览器已经关闭
 */
- (void)webBrowserDidClosed{
    NSLog(@"浏览器已经关闭");
}


// ***************** 广告--end ******************************




@end
