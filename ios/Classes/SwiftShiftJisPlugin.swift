import Flutter
import UIKit

public class SwiftShiftJisPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "shift_jis", binaryMessenger: registrar.messenger())
    let instance = SwiftShiftJisPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  enum Method: String {
    case encode
    case decode
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let method = Method(rawValue: call.method) else {
        return result(FlutterMethodNotImplemented)
    }
    switch method {
    case .encode: encode(call.arguments, result: result)
    case .decode: decode(call.arguments, result: result)
    }
  }
}

extension SwiftShiftJisPlugin {
  private func encode(_ arguments: Any?, result: FlutterResult) {
    guard let string = arguments as? String else { return result(nil) }
    let data = string.data(using: .shiftJIS)
    result(data)
  }

  private func decode(_ arguments: Any?, result: FlutterResult) {
    guard let typedData = arguments as? FlutterStandardTypedData else { return result(nil) }
    let string = String(data: typedData.data, encoding: .shiftJIS)
    result(string)
  }
}
