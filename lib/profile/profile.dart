
import 'package:flutter/material.dart';

import '../constant/color.dart';
import '../constant/dimensions.dart';
import 'profile_widget/all_profile_information.dart';
import 'profile_widget/profile_appbar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          ProfileAppBar(),
          AllProfileInformation()
        ],
      ),
    );
  }
}