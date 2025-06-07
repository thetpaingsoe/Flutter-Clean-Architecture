class ApiResponse<T> {
  final T? data;
  final String? message;
  final bool success;
  final int? statusCode;

  ApiResponse({this.data, this.message, this.success = true, this.statusCode});

  factory ApiResponse.success(T data, {int? statusCode}) {
    return ApiResponse(data: data, success: true, statusCode: statusCode);
  }

  factory ApiResponse.error(String message, {int? statusCode}) {
    return ApiResponse(
      message: message,
      success: false,
      statusCode: statusCode,
    );
  }
}
