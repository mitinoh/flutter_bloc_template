import 'dart:developer' as developer;

class Logger {
  static void info(String msg) {
    developer.log('\x1B[34m$msg\x1B[0m');
  }

  static void success(String msg) {
    developer.log('\x1B[32m$msg\x1B[0m');
  }

  static void warning(String msg) {
    developer.log('\x1B[33m$msg\x1B[0m');
  }

  static void error(String msg) {
    developer.log('\x1B[31m$msg\x1B[0m');
  }
}
