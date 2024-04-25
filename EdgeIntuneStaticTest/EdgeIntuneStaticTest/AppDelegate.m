//
//  AppDelegate.m
//  EdgeIntuneStaticTest
//
//  Created by vincent on 2024/4/24.
//

#import "AppDelegate.h"
#import "IntuneMAM.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(UIWindow*)getFirstKeyWindow {
  UIApplication* app = [UIApplication sharedApplication];
  UIWindowScene* windowScene = nil;
  for (UIScene* scene in app.connectedScenes) {
    if ([scene isKindOfClass:UIWindowScene.class]) {
      windowScene = (UIWindowScene*)scene;
    }
  }
  for (UIWindow* window in windowScene.windows) {
    if (window.isKeyWindow) {
      return window;
    }
  }
  return windowScene.windows.firstObject;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [IntuneMAMPolicyManager.instance
     setUIPolicyIdentity:@"xiaoweigao@edgemobile.onmicrosoft.com"
                  forWindow:[self getFirstKeyWindow]
          completionHandler:nil];
    
    [IntuneMAMDiagnosticConsole displayDiagnosticConsole];
    return YES;
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
