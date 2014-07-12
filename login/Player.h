//
//  Player.h
//  login
//
//  Created by Leoc O'Cear on 14-7-8.
//  Copyright (c) 2014年 Leoc O'Cear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *game;
@property (nonatomic, assign) int rating;

@end

