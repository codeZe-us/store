
import 'package:flutter/material.dart';

import '../../constant/dimensions.dart';
import '../../constant/strings.dart';
import 'profile)information.dart';



class AllProfileInformation extends StatefulWidget {
  const AllProfileInformation({super.key});

  @override
  State<AllProfileInformation> createState() => _AllProfileInformationState();
}

class _AllProfileInformationState extends State<AllProfileInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(50)),
        const CustomProfileInformation(
            firstIcon: Icons.person_outline,
            buttonText: StaticText.editProfile),
        SizedBox(height: getProportionateScreenHeight(15)),
        const CustomProfileInformation(
            firstIcon: Icons.settings,
            buttonText: StaticText.settings),
        SizedBox(height: getProportionateScreenHeight(15)),
        const CustomProfileInformation(
            firstIcon: Icons.history,
            buttonText: StaticText.orderH),
        SizedBox(height: getProportionateScreenHeight(15)),
        const CustomProfileInformation(
            firstIcon: Icons.bloodtype,
            buttonText: StaticText.skinType),
        SizedBox(height: getProportionateScreenHeight(15)),
        const CustomProfileInformation(
            firstIcon: Icons.language,
            buttonText: StaticText.lang),
        SizedBox(height: getProportionateScreenHeight(15)),
        const CustomProfileInformation(
            firstIcon: Icons.logout,
            buttonText: StaticText.logOut),
      ],
    );
  }
}
