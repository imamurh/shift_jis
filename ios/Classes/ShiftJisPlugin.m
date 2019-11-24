#import "ShiftJisPlugin.h"
#import <shift_jis/shift_jis-Swift.h>

@implementation ShiftJisPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftShiftJisPlugin registerWithRegistrar:registrar];
}
@end
