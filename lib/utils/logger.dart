import 'package:logger/logger.dart';

class Log {
  var logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );

  void trace(String message) {
    logger.t(message);
  }

  void debug(String message) {
    logger.d(message);
  }

  void info(String message) {
    logger.i(message);
  }

  void warning(String message) {
    logger.w(message);
  }

  void error(String message, StackTrace error) {
    logger.e(message, error: error);
  }

  void fatal(String message, error, stackTrace) {
    logger.f(message, error: error, stackTrace: stackTrace);
  }
}
