package dev.imamurh.shift_jis

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import java.nio.charset.Charset

class ShiftJisPlugin: MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "shift_jis")
      channel.setMethodCallHandler(ShiftJisPlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    val arguments = call.arguments
    when (call.method) {
      "encode" -> {
        if (arguments is String) {
          result.success(encode(arguments))
        } else {
          result.success(null)
        }
      }
      "decode" -> {
        if (arguments is ByteArray) {
          result.success(decode(arguments))
        } else {
          result.success(null)
        }
      }
      else -> result.notImplemented()
    }
  }

  private fun encode(string: String): ByteArray {
    return string
            .replace("\u301c", "\uff5e") // Convert WAVE DASH to FULLWIDTH TILDE.
            .toByteArray(Charset.forName("Shift_JIS"))
  }

  private fun decode(bytes: ByteArray): String {
    return String(bytes, Charset.forName("Shift_JIS"))
  }
}
