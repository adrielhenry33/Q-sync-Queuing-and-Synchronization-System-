sealed class Result<T> {}

class Success<T> extends Result<T> {
  final int? statusCode;
  final T data;

  Success({required this.data, this.statusCode});
}

class Failure<T> extends Result<T> {
  final int? statusCode;
  final String errorMessage;
  final dynamic rawBody;
  final StackTrace? stackTrace;

  Failure({
    required this.errorMessage,
    this.rawBody,
    this.statusCode,
    this.stackTrace,
  });
}
