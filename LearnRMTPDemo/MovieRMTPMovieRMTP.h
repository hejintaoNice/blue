//
//  MovieRMTPMovieRMTP.h
//
//  Created by Heige  on 16/6/18
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MovieRMTPMovieRMTP : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double expireTime;
@property (nonatomic, strong) NSArray *lives;
@property (nonatomic, assign) int dmError;
@property (nonatomic, strong) NSString *errorMsg;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
