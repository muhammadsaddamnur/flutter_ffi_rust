import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

final DynamicLibrary greeterNative = Platform.isAndroid
    ? DynamicLibrary.open("libgreeter.so")
    : DynamicLibrary.process();

typedef GreetingFunction = Pointer<Utf8> Function(Pointer<Utf8>);
typedef GreetingFunctionFFI = Pointer<Utf8> Function(Pointer<Utf8>);

final GreetingFunction rustGreeting = greeterNative
    .lookup<NativeFunction<GreetingFunctionFFI>>("rust_greeting")
    .asFunction();

class FFIBridge {
  void runFFI() {
    const nameStr = "John Smith";
    final Pointer<Utf8> namePtr = nameStr.toNativeUtf8();
    print("- Calling rust_greeting with argument:  $namePtr");

// Call rust_greeting
    final Pointer<Utf8> resultPtr = rustGreeting(namePtr);
    print("- Result pointer:  $resultPtr");

// Handle the result pointer
    final String greetingStr = resultPtr.toDartString();
    print("- Response string:  $greetingStr");
  }
}
