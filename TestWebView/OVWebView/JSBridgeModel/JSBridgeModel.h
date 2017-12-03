//
//  JSBridgeModel.h
//  TestWebView
//
//  Created by oliver on 2017/12/3.
//  Copyright © 2017年 悠哉旅游网. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JSBridgeDelegate <JSExport>

- (void)setting;

@end

@interface JSBridgeModel : NSObject <JSBridgeDelegate>

@property (nonatomic, weak) JSContext *jsContext;
@property (nonatomic, weak) UIWebView *webView;

@end
