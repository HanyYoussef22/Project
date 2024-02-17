/// message : "Loggedin Successfuly."
/// data : {"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL3JlZ2lzdGVyIiwiaWF0IjoxNjk1MzAxMDM2LCJleHAiOjE2OTUzMDQ2MzYsIm5iZiI6MTY5NTMwMTAzNiwianRpIjoiZHI2SW9ISEhxRXU1ZTlrWiIsInN1YiI6IjIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.zWa9orDPpQrHjPvdC_G1atG-DUU2UUkEv8HycBCmd7E","username":"diaa"}
/// status : true
/// code : 200
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String name;
  final String email;
  final String phone;
  final int gender;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;

  SignupRequestBody(
      {required this.name,
        required this.email,
        required this.phone,
        required this.gender,
        required this.password,
        required this.passwordConfirmation,
      });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
