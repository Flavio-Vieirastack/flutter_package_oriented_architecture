class RestClientResponse<T> {
  final T? data;
  final int? statucCode;
  final String? statusMessage;
  RestClientResponse({
    this.data,
    this.statucCode,
    this.statusMessage,
  });
}
