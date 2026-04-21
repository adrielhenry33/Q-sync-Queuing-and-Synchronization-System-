sealed class Result<T> {}

class Success<T> extends Result<T> {
  final int? statusCode;
  final Result? result;

  Success({this.result, this.statusCode});
}

class Failure<T> extends Result<T> {
  final Result result;
  final int? statusCode;
  final String errorMessage;
  final dynamic rawBody;

  Failure({
    this.errorMessage = '',
    this.rawBody,
    required this.result,
    this.statusCode,
  });
}
