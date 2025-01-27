//
//  OpenVPNDhcpOptionEntry.mm
//  OpenVPNAdapter
//
//  Created by Vyacheslav Razumeenko on 27.01.2025.
//

#import "OpenVPNDhcpOptionEntry.h"
#import "OpenVPNDhcpOptionEntry+Internal.h"

@implementation OpenVPNDhcpOptionEntry
- (instancetype)initWithDhcpOptionEntry:(ClientAPI::DhcpOptionEntry)entry {
    if (self = [super init]) {
        _type = !entry.type.empty() ? [NSString stringWithUTF8String:entry.type.c_str()] : nil;
        _address = !entry.address.empty() ? [NSString stringWithUTF8String:entry.address.c_str()] : nil;
    }
    return self;
}
@end
