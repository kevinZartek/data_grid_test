class HttpException implements Exception {
  HttpException({
    this.title,
    this.message,
    this.statusCode,
  });

  /// Exception title
  final String? title;

  /// Exception message
  final String? message;

  /// Exception http response code
  final int? statusCode;
}