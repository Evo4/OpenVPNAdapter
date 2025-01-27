//
//  OpenVPNDhcpOptionEntry+Internal.h
//  OpenVPNAdapter
//
//  Created by Vyacheslav Razumeenko on 27.01.2025.
//

#import "OpenVPNDhcpOptionEntry.h"
#include <ovpnapi.hpp>

using namespace openvpn;

@interface OpenVPNDhcpOptionEntry (Internal)
- (instancetype)initWithDhcpOptionEntry:(ClientAPI::DhcpOptionEntry)entry;
@end
