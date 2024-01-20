import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/features/login/ui/widgets/already_have_account.dart';
import 'package:project/features/login/ui/widgets/tearm_contion_text.dart';
import 'package:project/features/login/ui/widgets/welecom_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/text_button.dart';
import '../../../core/widgets/text_form_field.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/style/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool ObscureText = true;
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 35.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const WelecomText(),
                horizontalSpace(38),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        hintText: 'Email',
                        validator: EmailValidate,
                      ),
                      verticalSpace(20),
                      AppTextFormField(
                        hintText: 'Password',
                        validator: EmailValidate,
                        isObscureText: ObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              ObscureText = !ObscureText;
                            });
                          },
                          child: Icon(
                            ObscureText ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      ),
                      verticalSpace(10),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forget Password?',
                            style: Styles.font13Buleregular,
                          )),
                      verticalSpace(40),
                      AppTextButton(
                        buttonText: 'Login',
                        textStyle: Styles.font16semiBold,
                        onPressed: () {},
                      ),
                      verticalSpace(20),
                      TearmAndCondionText(),
                      verticalSpace(50),
                      AlreadyHaveAccount()
            
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String? EmailValidate(text) {
  if (text!.isEmpty || text.trim().isEmpty) {
    return 'Pleas Enter Your Email';
  }
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(text);
  if (!emailValid) {
    return 'Email not Valid';
  }
  return null;
}
