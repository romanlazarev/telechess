//
//  NetworkGameModel.m
//  telechess-client
//
//  Created by Roman Lazarev on 10/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "NetworkManager.h"

NSString *const SERVICE_HOST_URL = @"https://us-central1-chess-game-48719.cloudfunctions.net";
NSUInteger const URL_REQUEST_TIMEOUT = 15;

@implementation NetworkManager

+ (id)sharedInstance {
    static NetworkManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)request:(Message*)message {
    NSString *url = [SERVICE_HOST_URL stringByAppendingString:[[message class] methodUrl]];
    NSData *received = [self requestDataSynchronouslyWithUrlString:url andPayload:[message jsonData]];
    if(received) {
        NSLog(@"Received string: %@", [[NSString alloc] initWithData:received encoding:NSUTF8StringEncoding]);
    }
}

- (nullable Message*)request:(Message*)message withResponseClass:(Class)aClass {
    if([aClass isSubclassOfClass:[Message class]] == NO) {
        invalidArgumentExeption();
    }
    NSString *url = [SERVICE_HOST_URL stringByAppendingString:[[message class] methodUrl]];
    NSData *received = [self requestDataSynchronouslyWithUrlString:url andPayload:[message jsonData]];
    if(received) {
        NSLog(@"Received string: %@", [[NSString alloc] initWithData:received encoding:NSUTF8StringEncoding]);
        return [[aClass alloc] initWithJsonData:received];
    }
    else return NULL;
}

- (NSDictionary*)requestDictionarySynchronouslyWithUrlString:(NSString*) urlString andPayload:(Message*) payload {
    NSData *payloadData = [payload jsonData];
    NSData *data = [self requestDataSynchronouslyWithUrlString:urlString andPayload:payloadData];
    NSError *error = nil;
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if(error) {
        NSLog(@"Error occured while converting data to JSON: %@", error);
    }
    return jsonData;
}

- (NSString*)requestStringSynchronouslyWithUrlString:(NSString*) urlString {
    NSData *data = [self requestDataSynchronouslyWithUrlString:urlString andStringPayload:nil];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString*)requestStringSynchronouslyWithUrlString:(NSString*) urlString andStringPayload:(NSString*)payload {
    NSData *data = [self requestDataSynchronouslyWithUrlString:urlString andStringPayload:payload];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSData*)requestDataSynchronouslyWithUrlString:(NSString*) urlString {
    return [self requestDataSynchronouslyWithUrlString:urlString andPayload:nil];
}

- (NSData*)requestDataSynchronouslyWithUrlString:(NSString*) urlString andStringPayload:(NSString*)payload {
    return [self requestDataSynchronouslyWithUrlString:urlString
                                            andPayload:[payload dataUsingEncoding:NSUTF8StringEncoding]];
}

- (NSData*)requestDataSynchronouslyWithUrlString:(NSString*) urlString andPayload:(NSData*) payload {
    NSURL *url = [NSURL URLWithString:urlString];
    __block NSData *data = nil;

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:15];
    request.HTTPMethod=@"POST";
    request.HTTPBody=payload;
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable receivedData, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSHTTPURLResponse *httpResponse;
        if([response isKindOfClass:[NSHTTPURLResponse class]]) {
            httpResponse = (NSHTTPURLResponse*)response;
        }
        data = receivedData;
        if(error) {
            NSLog(@"ERROR: %@", error);
        }
        if(!data || (httpResponse && httpResponse.statusCode != 200)) {
            NSLog(@"RESPONSE: %@", response);
        }
        dispatch_semaphore_signal(semaphore);
    }];
    [task resume];
    dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, URL_REQUEST_TIMEOUT * NSEC_PER_SEC));
    return data;
}

@end
