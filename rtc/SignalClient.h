
#ifndef SignalClient_h
#define SignalClient_h

#import <Foundation/Foundation.h>

@protocol SignalEvent <NSObject>

@required
- (void) joined: (NSString*) room;
- (void) leaved: (NSString*) room;
- (void) otherjoin: (NSString*) room User: (NSString*) uid;
- (void) full: (NSString*) room;
- (void) byeFrom: (NSString*) room User:(NSString*) uid;
- (void) answer: (NSString*) room message: (NSDictionary*) dict;
- (void) offer: (NSString*) room message: (NSDictionary*) dict;
- (void) candidate: (NSString*) room message: (NSDictionary*) dict;
- (void) connected;
- (void) connect_error;
- (void) connect_timeout;
- (void) reconnectAttempt;

@end

@interface SignalClient : NSObject

+(SignalClient*) getInstance;

- (void) createConnect: (NSString*) addr;
- (void) joinRoom: (NSString*) room;
- (void) leaveRoom: (NSString*) room;
- (void) sendMessage: (NSString*) room withMsg:(NSDictionary*) msg;

@property (retain, nonatomic) id<SignalEvent> delegate;

@end

#endif /* SignalClient_h */
