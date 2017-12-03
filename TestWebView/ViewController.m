//
//  ViewController.m
//  TestWebView
//
//  Created by 谢艺欣 on 16/9/23.
//  Copyright © 2016年 谢艺欣. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import "JSBridgeModel.h"
@import JavaScriptCore;

@interface ViewController () <UIWebViewDelegate>

@property (nonatomic,retain)JSContext *mainContext;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"web/html/index" ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [ibWebView loadHTMLString:htmlString baseURL:[[NSBundle mainBundle] bundleURL]];
    NSLog(@"file path -> %@",htmlFile);
    
//    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
//    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:requestString]]];
//    webView.navigationDelegate = self;
//    [self.view addSubview:webView];
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *requestString = [[request URL] absoluteString];//获取请求的绝对路径.
    requestString = [requestString stringByRemovingPercentEncoding];
    NSLog(@"uiwebview request -> %@",requestString);
    
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.mainContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    JSBridgeModel *model = [[JSBridgeModel alloc] init];
    self.mainContext[@"OCModel"] = model;
    model.jsContext = self.mainContext;
    model.webView = ibWebView;
    
    self.mainContext.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        NSLog(@"exception -> %@",exception);
    };
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    if ([webView.request.URL.absoluteString hasPrefix:@"action.invoke"]) {
        return;
    }
    NSLog(@"wrong url -> %@",webView.request.URL.absoluteString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
