import 'package:json_annotation/json_annotation.dart';
part 'login_reqest_body.g.dart';
@JsonSerializable()
class LoginRequestBody
{
  final String email;
  final String password;

  LoginRequestBody({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);

}