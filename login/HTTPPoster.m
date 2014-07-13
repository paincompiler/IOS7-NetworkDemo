//
//  HTTPPoster.m
//  login
//
//  Created by Leoc O'Cear on 14-7-13.
//  Copyright (c) 2014年 Leoc O'Cear. All rights reserved.
//

#import "HTTPPoster.h"

@implementation HTTPPoster
@synthesize resultData, finishCallbackBlock;

+ (void)postExecuteWithUrlStr:(NSString *)urlStr Paramters:(NSString *)params FinishCallbackBlock:(void (^)(NSString *))block
{
    HTTPPoster *executorDelegate = [[HTTPPoster alloc] init];
    executorDelegate.finishCallbackBlock = block;
    
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:executorDelegate];
    
    NSLog(conn ? @"Connect success" : @"Failed to connect");
    
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *resp = (NSHTTPURLResponse *)response;
    if(!resultData){
        resultData = [[NSMutableData alloc] init];
    }else{
        [resultData setLength:0];
    }
    
    if ([response respondsToSelector:@selector(allHeaderFields)]) {
        
        NSDictionary *dictionary = [resp allHeaderFields];
        
        NSLog(@"[network]allHeaderFields:%@",[dictionary description]);
    }
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [resultData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *resultStr = [[NSString alloc] initWithData:[self resultData] encoding:NSUTF8StringEncoding];
    
    if (finishCallbackBlock) {
        finishCallbackBlock(resultStr);
    }
    
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"network error: %@", [error localizedDescription]);
    
    if (finishCallbackBlock) {
        finishCallbackBlock(nil);
    }
    
    
}

@end
