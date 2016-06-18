//
//  MovieRMTPLives.m
//
//  Created by Heige  on 16/6/18
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MovieRMTPLives.h"
#import "MovieRMTPCreator.h"


NSString *const kMovieRMTPLivesId = @"id";
NSString *const kMovieRMTPLivesRoomId = @"room_id";
NSString *const kMovieRMTPLivesOnlineUsers = @"online_users";
NSString *const kMovieRMTPLivesVersion = @"version";
NSString *const kMovieRMTPLivesLink = @"link";
NSString *const kMovieRMTPLivesShareAddr = @"share_addr";
NSString *const kMovieRMTPLivesSlot = @"slot";
NSString *const kMovieRMTPLivesCreator = @"creator";
NSString *const kMovieRMTPLivesGroup = @"group";
NSString *const kMovieRMTPLivesCity = @"city";
NSString *const kMovieRMTPLivesImage = @"image";
NSString *const kMovieRMTPLivesStreamAddr = @"stream_addr";
NSString *const kMovieRMTPLivesPubStat = @"pub_stat";
NSString *const kMovieRMTPLivesOptimal = @"optimal";
NSString *const kMovieRMTPLivesName = @"name";
NSString *const kMovieRMTPLivesStatus = @"status";


@interface MovieRMTPLives ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MovieRMTPLives

@synthesize livesIdentifier = _livesIdentifier;
@synthesize roomId = _roomId;
@synthesize onlineUsers = _onlineUsers;
@synthesize version = _version;
@synthesize link = _link;
@synthesize shareAddr = _shareAddr;
@synthesize slot = _slot;
@synthesize creator = _creator;
@synthesize group = _group;
@synthesize city = _city;
@synthesize image = _image;
@synthesize streamAddr = _streamAddr;
@synthesize pubStat = _pubStat;
@synthesize optimal = _optimal;
@synthesize name = _name;
@synthesize status = _status;


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
            self.livesIdentifier = [self objectOrNilForKey:kMovieRMTPLivesId fromDictionary:dict];
            self.roomId = [[self objectOrNilForKey:kMovieRMTPLivesRoomId fromDictionary:dict] doubleValue];
            self.onlineUsers = [[self objectOrNilForKey:kMovieRMTPLivesOnlineUsers fromDictionary:dict] doubleValue];
            self.version = [[self objectOrNilForKey:kMovieRMTPLivesVersion fromDictionary:dict] doubleValue];
            self.link = [[self objectOrNilForKey:kMovieRMTPLivesLink fromDictionary:dict] doubleValue];
            self.shareAddr = [self objectOrNilForKey:kMovieRMTPLivesShareAddr fromDictionary:dict];
            self.slot = [[self objectOrNilForKey:kMovieRMTPLivesSlot fromDictionary:dict] doubleValue];
            self.creator = [MovieRMTPCreator modelObjectWithDictionary:[dict objectForKey:kMovieRMTPLivesCreator]];
            self.group = [[self objectOrNilForKey:kMovieRMTPLivesGroup fromDictionary:dict] doubleValue];
            self.city = [self objectOrNilForKey:kMovieRMTPLivesCity fromDictionary:dict];
            self.image = [self objectOrNilForKey:kMovieRMTPLivesImage fromDictionary:dict];
            self.streamAddr = [self objectOrNilForKey:kMovieRMTPLivesStreamAddr fromDictionary:dict];
            self.pubStat = [[self objectOrNilForKey:kMovieRMTPLivesPubStat fromDictionary:dict] doubleValue];
            self.optimal = [[self objectOrNilForKey:kMovieRMTPLivesOptimal fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kMovieRMTPLivesName fromDictionary:dict];
            self.status = [[self objectOrNilForKey:kMovieRMTPLivesStatus fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.livesIdentifier forKey:kMovieRMTPLivesId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.roomId] forKey:kMovieRMTPLivesRoomId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.onlineUsers] forKey:kMovieRMTPLivesOnlineUsers];
    [mutableDict setValue:[NSNumber numberWithDouble:self.version] forKey:kMovieRMTPLivesVersion];
    [mutableDict setValue:[NSNumber numberWithDouble:self.link] forKey:kMovieRMTPLivesLink];
    [mutableDict setValue:self.shareAddr forKey:kMovieRMTPLivesShareAddr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.slot] forKey:kMovieRMTPLivesSlot];
    [mutableDict setValue:[self.creator dictionaryRepresentation] forKey:kMovieRMTPLivesCreator];
    [mutableDict setValue:[NSNumber numberWithDouble:self.group] forKey:kMovieRMTPLivesGroup];
    [mutableDict setValue:self.city forKey:kMovieRMTPLivesCity];
    [mutableDict setValue:self.image forKey:kMovieRMTPLivesImage];
    [mutableDict setValue:self.streamAddr forKey:kMovieRMTPLivesStreamAddr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pubStat] forKey:kMovieRMTPLivesPubStat];
    [mutableDict setValue:[NSNumber numberWithDouble:self.optimal] forKey:kMovieRMTPLivesOptimal];
    [mutableDict setValue:self.name forKey:kMovieRMTPLivesName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kMovieRMTPLivesStatus];

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

    self.livesIdentifier = [aDecoder decodeObjectForKey:kMovieRMTPLivesId];
    self.roomId = [aDecoder decodeDoubleForKey:kMovieRMTPLivesRoomId];
    self.onlineUsers = [aDecoder decodeDoubleForKey:kMovieRMTPLivesOnlineUsers];
    self.version = [aDecoder decodeDoubleForKey:kMovieRMTPLivesVersion];
    self.link = [aDecoder decodeDoubleForKey:kMovieRMTPLivesLink];
    self.shareAddr = [aDecoder decodeObjectForKey:kMovieRMTPLivesShareAddr];
    self.slot = [aDecoder decodeDoubleForKey:kMovieRMTPLivesSlot];
    self.creator = [aDecoder decodeObjectForKey:kMovieRMTPLivesCreator];
    self.group = [aDecoder decodeDoubleForKey:kMovieRMTPLivesGroup];
    self.city = [aDecoder decodeObjectForKey:kMovieRMTPLivesCity];
    self.image = [aDecoder decodeObjectForKey:kMovieRMTPLivesImage];
    self.streamAddr = [aDecoder decodeObjectForKey:kMovieRMTPLivesStreamAddr];
    self.pubStat = [aDecoder decodeDoubleForKey:kMovieRMTPLivesPubStat];
    self.optimal = [aDecoder decodeDoubleForKey:kMovieRMTPLivesOptimal];
    self.name = [aDecoder decodeObjectForKey:kMovieRMTPLivesName];
    self.status = [aDecoder decodeDoubleForKey:kMovieRMTPLivesStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_livesIdentifier forKey:kMovieRMTPLivesId];
    [aCoder encodeDouble:_roomId forKey:kMovieRMTPLivesRoomId];
    [aCoder encodeDouble:_onlineUsers forKey:kMovieRMTPLivesOnlineUsers];
    [aCoder encodeDouble:_version forKey:kMovieRMTPLivesVersion];
    [aCoder encodeDouble:_link forKey:kMovieRMTPLivesLink];
    [aCoder encodeObject:_shareAddr forKey:kMovieRMTPLivesShareAddr];
    [aCoder encodeDouble:_slot forKey:kMovieRMTPLivesSlot];
    [aCoder encodeObject:_creator forKey:kMovieRMTPLivesCreator];
    [aCoder encodeDouble:_group forKey:kMovieRMTPLivesGroup];
    [aCoder encodeObject:_city forKey:kMovieRMTPLivesCity];
    [aCoder encodeObject:_image forKey:kMovieRMTPLivesImage];
    [aCoder encodeObject:_streamAddr forKey:kMovieRMTPLivesStreamAddr];
    [aCoder encodeDouble:_pubStat forKey:kMovieRMTPLivesPubStat];
    [aCoder encodeDouble:_optimal forKey:kMovieRMTPLivesOptimal];
    [aCoder encodeObject:_name forKey:kMovieRMTPLivesName];
    [aCoder encodeDouble:_status forKey:kMovieRMTPLivesStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    MovieRMTPLives *copy = [[MovieRMTPLives alloc] init];
    
    if (copy) {

        copy.livesIdentifier = [self.livesIdentifier copyWithZone:zone];
        copy.roomId = self.roomId;
        copy.onlineUsers = self.onlineUsers;
        copy.version = self.version;
        copy.link = self.link;
        copy.shareAddr = [self.shareAddr copyWithZone:zone];
        copy.slot = self.slot;
        copy.creator = [self.creator copyWithZone:zone];
        copy.group = self.group;
        copy.city = [self.city copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.streamAddr = [self.streamAddr copyWithZone:zone];
        copy.pubStat = self.pubStat;
        copy.optimal = self.optimal;
        copy.name = [self.name copyWithZone:zone];
        copy.status = self.status;
    }
    
    return copy;
}


@end
