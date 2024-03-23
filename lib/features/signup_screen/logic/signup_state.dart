import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';
@freezed
class SignupState<T> with _$SignupState<T>
{
  const factory SignupState.initial()=_SignupStateInitial;
  const factory SignupState.loading()=SignupStateLoading ;
  const factory SignupState.success(T data )=SignupStateSuccess;
  const factory SignupState.error({required String error})=SignupStateError;
}


