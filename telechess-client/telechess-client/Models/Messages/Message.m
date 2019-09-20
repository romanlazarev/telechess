//
//  Message.m
//  telechess-client
//
//  Created by Roman Lazarev on 16/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "Message.h"

@implementation Message
- (instancetype)initWithJsonData:(NSData*)data {
    NSError *error;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if(error) {
        NSLog(@"Error while convertion JSON data to dictionary: %@", error);
    }
    if(jsonDictionary) {
        return [self initWithDictionary:jsonDictionary];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    methodNotImplemented();
}

- (NSDictionary *)dictionary {
    methodNotImplemented();
}

+ (NSString*)methodUrl {
    methodNotImplemented();
}

- (NSData*)jsonData {
    NSError *error;
    NSData* result = [NSJSONSerialization dataWithJSONObject:[self dictionary] options:kNilOptions error: &error];
    if(error) {
        NSLog(@"Error while converting object to Json: %@", error);
    }
    return result;
}

- (NSString*)jsonString {
    NSString *jsonString = [[NSString alloc] initWithData:[self jsonData] encoding:NSUTF8StringEncoding];
    NSLog(@"JSON Output: %@", jsonString);
    return jsonString;
}

@end
