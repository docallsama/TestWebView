//
//  JSBridgeModel.m
//  TestWebView
//
//  Created by oliver on 2017/12/3.
//  Copyright © 2017年 悠哉旅游网. All rights reserved.
//

#import "JSBridgeModel.h"

@implementation JSBridgeModel

- (void)setting {
    NSLog(@"go to setting");
    
    JSValue *jsFunc = self.jsContext[@"jsFunc"];
    [jsFunc callWithArguments:nil];
}

@end
