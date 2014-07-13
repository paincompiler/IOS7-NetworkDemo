//
//  HTTPPoster.h
//  login
//
//  Created by Leoc O'Cear on 14-7-13.
//  Copyright (c) 2014年 Leoc O'Cear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPPoster : NSObject<NSURLConnectionDataDelegate>
{
    NSMutableData *resultData;
    void (^finishCallbackBlock)(NSString *);
    
}
@property NSMutableData *resultData;
@property(strong) void (^finishCallbackBlock)(NSString *);

+ (void)postExecuteWithUrlStr:(NSString *)urlStr Paramters:(NSString *)params FinishCallbackBlock:(void (^)(NSString *))block;

@end