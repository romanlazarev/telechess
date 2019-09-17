//
//  Message.h
//  telechess-client
//
//  Created by Roman Lazarev on 15/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#define mustOverride() @throw [NSException exceptionWithName:NSInvalidArgumentException reason:[NSString stringWithFormat:@"%s must be overridden", __PRETTY_FUNCTION__] userInfo:nil]
#define methodNotImplemented() mustOverride()
#define invalidArgumentExeption() @throw [NSException exceptionWithName:NSInvalidArgumentException reason:[NSString stringWithFormat:@"%s received invalid argument", __PRETTY_FUNCTION__] userInfo:nil]

@interface Message : NSObject
- (instancetype)initWithJsonData:(NSData*)data;
- (instancetype)initWithDictionary:(NSDictionary*)dictionary;
- (NSDictionary*)dictionary;
- (NSData*)jsonData;
- (NSString*)jsonString;

+(NSString*)methodUrl;
@end
