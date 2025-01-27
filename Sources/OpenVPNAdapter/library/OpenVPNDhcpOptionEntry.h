//
//  OpenVPNDhcpOptionEntry.h
//  OpenVPNAdapter
//
//  Created by Vyacheslav Razumeenko on 27.01.2025.
//

#import <Foundation/Foundation.h>

@interface OpenVPNDhcpOptionEntry : NSObject
@property (nullable, readonly, nonatomic) NSString *type;
@property (nullable, readonly, nonatomic) NSString *address;
- (nonnull instancetype) init NS_UNAVAILABLE;
@end
