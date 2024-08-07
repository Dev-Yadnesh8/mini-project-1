import 'package:mini_project_1/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  // Named constructor for loading state
  ApiResponse.loading() : status = Status.LOADING;

  // Named constructor for completed state
  ApiResponse.success() : status = Status.SUCCESS;

  // Named constructor for error state
  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status \n Message: $message \n Data: $data";
  }
}

