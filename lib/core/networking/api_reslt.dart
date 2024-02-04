import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project/core/networking/api_error_handeler.dart';
part 'api_reslt.freezed.dart';
@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ErrorHandler errorHandler) = Failure<T>;

}