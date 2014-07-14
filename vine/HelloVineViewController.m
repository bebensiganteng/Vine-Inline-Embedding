//
//  HelloVineViewController.m
//  vine
//
//  Created by Rahmat Hidayat on 2014/06/23.
//  Copyright (c) 2014年 Rahmat Hidayat. All rights reserved.
//

#import "HelloVineViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface HelloVineViewController ()


@end

@implementation HelloVineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self startWebView];
}

// WebView
- (void) startWebView
{
    webView                 = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    webView.delegate        = self;
    
    NSString* urlString     = @"https://vine.co/v/MjBBFuXXhvp";
    NSURL* url              = [NSURL URLWithString:urlString];
    NSURLRequest* request   = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)wView
{
    // TODO: don't use class name
    // scape the HTML and extract the mp4 path
    NSString* src = [webView stringByEvaluatingJavaScriptFromString: @"document.getElementsByClassName('invisible preload')[0].childNodes[0].src;"];
    
    [self mpplayer:src];
}

// inject it to MPMovie
- (void) mpplayer:(NSString*) path
{
    NSURL* url = [NSURL URLWithString:path];
    
    MPMoviePlayerController* mp = [[MPMoviePlayerController alloc] initWithContentURL:url];
    //    [[NSNotificationCenter defaultCenter] addObserver:self
    //                                             selector:@selector(movieEventFullscreenHandler:)
    //                                                 name:MPmpDidEnterFullscreenNotification
    //                                               object:nil];
    //
    mp.movieSourceType          = MPMovieSourceTypeStreaming;
    mp.controlStyle             = MPMovieControlStyleEmbedded;
    
    [mp.view setFrame:CGRectMake((320-180) * 0.5, (480-180) * 0.5, 180, 180)];
    [self.view addSubview:mp.view];
    
    [mp setFullscreen:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
