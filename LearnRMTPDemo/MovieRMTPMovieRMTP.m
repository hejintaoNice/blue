//
//  MovieRMTPMovieRMTP.m
//
//  Created by Heige  on 16/6/18
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MovieRMTPMovieRMTP.h"
#import "MovieRMTPLives.h"


NSString *const kMovieRMTPMovieRMTPExpireTime = @"expire_time";
NSString *const kMovieRMTPMovieRMTPLives = @"lives";
NSString *const kMovieRMTPMovieRMTPDmError = @"dm_error";
NSString *const kMovieRMTPMovieRMTPErrorMsg = @"error_msg";


@interface MovieRMTPMovieRMTP ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MovieRMTPMovieRMTP

@synthesize expireTime = _expireTime;
@synthesize lives = _lives;
@synthesize dmError = _dmError;
@synthesize errorMsg = _errorMsg;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.expireTime = [[self objectOrNilForKey:kMovieRMTPMovieRMTPExpireTime fromDictionary:dict] doubleValue];
    NSObject *receivedMovieRMTPLives = [dict objectForKey:kMovieRMTPMovieRMTPLives];
    NSMutableArray *parsedMovieRMTPLives = [NSMutableArray array];
    if ([receivedMovieRMTPLives isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMovieRMTPLives) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMovieRMTPLives addObject:[MovieRMTPLives modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMovieRMTPLives isKindOfClass:[NSDictionary class]]) {
       [parsedMovieRMTPLives addObject:[MovieRMTPLives modelObjectWithDictionary:(NSDictionary *)receivedMovieRMTPLives]];
    }

    self.lives = [NSArray arrayWithArray:parsedMovieRMTPLives];
            self.dmError = [[self objectOrNilForKey:kMovieRMTPMovieRMTPDmError fromDictionary:dict] doubleValue];
            self.errorMsg = [self objectOrNilForKey:kMovieRMTPMovieRMTPErrorMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.expireTime] forKey:kMovieRMTPMovieRMTPExpireTime];
    NSMutableArray *tempArrayForLives = [NSMutableArray array];
    for (NSObject *subArrayObject in self.lives) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLives addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLives addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLives] forKey:kMovieRMTPMovieRMTPLives];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dmError] forKey:kMovieRMTPMovieRMTPDmError];
    [mutableDict setValue:self.errorMsg forKey:kMovieRMTPMovieRMTPErrorMsg];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.expireTime = [aDecoder decodeDoubleForKey:kMovieRMTPMovieRMTPExpireTime];
    self.lives = [aDecoder decodeObjectForKey:kMovieRMTPMovieRMTPLives];
    self.dmError = [aDecoder decodeDoubleForKey:kMovieRMTPMovieRMTPDmError];
    self.errorMsg = [aDecoder decodeObjectForKey:kMovieRMTPMovieRMTPErrorMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_expireTime forKey:kMovieRMTPMovieRMTPExpireTime];
    [aCoder encodeObject:_lives forKey:kMovieRMTPMovieRMTPLives];
    [aCoder encodeDouble:_dmError forKey:kMovieRMTPMovieRMTPDmError];
    [aCoder encodeObject:_errorMsg forKey:kMovieRMTPMovieRMTPErrorMsg];
}

- (id)copyWithZone:(NSZone *)zone
{
    MovieRMTPMovieRMTP *copy = [[MovieRMTPMovieRMTP alloc] init];
    
    if (copy) {

        copy.expireTime = self.expireTime;
        copy.lives = [self.lives copyWithZone:zone];
        copy.dmError = self.dmError;
        copy.errorMsg = [self.errorMsg copyWithZone:zone];
    }
    
    return copy;
}


@end
