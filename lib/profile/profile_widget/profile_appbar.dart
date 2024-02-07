import 'package:flutter/material.dart';

import '../../constant/assets_location.dart';
import '../../constant/color.dart';
import '../../constant/dimensions.dart';
import '../../constant/strings.dart';
import '../../home/view/custom_text.dart';


class ProfileAppBar extends StatefulWidget {
  const ProfileAppBar({super.key});

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(290),
      width: SizeConfig.screenWidth,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          color: AppColors.blueshade200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getProportionateScreenWidth(65)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.arrow_back_ios,
                        color: AppColors.blackColor, size: 20),
                    SizedBox(width: getProportionateScreenWidth(100)),
                    customTextNunitoSansCenter(
                        inputText: StaticText.myProfile,
                        fontSize: 20,
                        weight: FontWeight.w800,
                        colorName: AppColors.blackColor),
                  ],
                ),
                const Icon(Icons.edit_note,
                    color: AppColors.blackColor, size: 25),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(15)),
          const Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(Assets.favour),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(8)),
          Center(
            child: customTextNunitoSansCenter(
                inputText: StaticText.name,
                fontSize: 17,
                weight: FontWeight.w800,
                colorName: AppColors.blackColor),
          ),
          Center(
            child: customTextNunitoSansCenter(
                inputText: StaticText.username,
                fontSize: 14,
                weight: FontWeight.w800,
                colorName: AppColors.greyColor),
          ),
        ],
      ),
    );
  }
}
