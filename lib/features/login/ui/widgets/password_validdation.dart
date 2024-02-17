import 'package:flutter/material.dart';
import 'package:project/core/theming/style/colors.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/style/styles.dart';

class PasswordValiddation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLenght;

  const PasswordValiddation(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasSpecialCharacters,
      required this.hasNumber,
      required this.hasMinLenght});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        buildValiditionRow(' At least 1 lowercase letter',hasLowerCase),
        verticalSpace(2),
        buildValiditionRow(' At least 1 upper case letter',hasUpperCase),
        verticalSpace(2),
        buildValiditionRow(' At least 1 special characters ',hasSpecialCharacters),
        verticalSpace(2),
        buildValiditionRow(' At least 1 number ',hasNumber),
        verticalSpace(2),
        buildValiditionRow(' At least 8 character long ',hasMinLenght),
        verticalSpace(2),

      ],
    );
  }
  Widget buildValiditionRow(String text,bool hasValidated)
  {
   return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManger.greyColor,
        ),
        Text(text,style: Styles.font13DarkBuleregular.copyWith(
          decoration: hasValidated ? TextDecoration.lineThrough :null,
          decorationThickness: 2,
          color: hasValidated ? ColorsManger.greyColor:ColorsManger.darkblue
        ),)
      ],
    );


  }
}
