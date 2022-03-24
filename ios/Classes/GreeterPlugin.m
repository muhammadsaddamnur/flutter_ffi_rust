
   
#import "GreeterPlugin.h"
#if __has_include(<greeter/greeter-Swift.h>)
#import <greeter/greeter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "greeter-Swift.h"
#endif

@implementation GreeterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGreeterPlugin registerWithRegistrar:registrar];
}
@end