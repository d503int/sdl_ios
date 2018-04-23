//  SDLTCPTransport.h
//

#import "SDLAbstractTransport.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDLTCPTransport : SDLAbstractTransport <NSStreamDelegate>

@property (strong, nonatomic) NSString *hostName;
@property (strong, nonatomic) NSString *portNumber;
@property (nonatomic, assign) NSUInteger receiveBufferSize;

@end

NS_ASSUME_NONNULL_END
