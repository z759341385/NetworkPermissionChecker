import Foundation
import SystemConfiguration

public class NetworkPermissionChecker {
    public init() { }
    
    public func hasInternetAccess() -> Bool {
        guard let reachability = SCNetworkReachabilityCreateWithName(nil, "www.google.com") else { return false }
        
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability, &flags)
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return isReachable && !needsConnection
    }
}
