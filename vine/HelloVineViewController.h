//
//  HelloVineViewController.h
//  vine
//
//  Created by Rahmat Hidayat on 2014/06/23.
//  Copyright (c) 2014年 Rahmat Hidayat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloVineViewController : UIViewController <UIWebViewDelegate>
{
    NSURLConnection *connection;
    NSMutableData   *receivedData;
    UIWebView       *webView;

}

@end
