
import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/dimensions.dart';
import '../../home/view/custom_text.dart';


class CustomProfileInformation extends StatelessWidget {
  final IconData firstIcon;
  final String buttonText;

  const CustomProfileInformation({
    Key? key,
    required this.firstIcon,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(50),
      width: getProportionateScreenWidth(340),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.greyshade50),
        boxShadow: const [
          BoxShadow(
            color: AppColors.greyshade50,
            spreadRadius: 0,
            offset: Offset(0, 4),
            blurRadius: 1,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(firstIcon, size: 33, color: AppColors.blueshade200),
                SizedBox(width: getProportionateScreenWidth(20)),
                customTextNunitoSansCenter(
                  inputText: buttonText,
                  fontSize: 15,
                  weight: FontWeight.w800,
                  colorName: AppColors.blackColor,
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 25,
              color: AppColors.blueshade200,
            ),
          ],
        ),
      ),
    );
  }
}
