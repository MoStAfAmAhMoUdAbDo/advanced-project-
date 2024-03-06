import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_corse_project/core/networking/api_error_handler.dart';
part 'api_resuilt.freezed.dart';

@freezed
abstract class ApiResuilt<T> with _$ApiResuilt<T> {
  const factory ApiResuilt.success(T data) = Success<T>;
  const factory ApiResuilt.failure(ErrorHandler errorHandler) = Failure<T>;
}
