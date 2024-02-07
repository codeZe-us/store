
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/dimensions.dart';
import '../../constant/strings.dart';
import 'custom_text.dart';




class Promotions extends StatefulWidget {
  const Promotions({super.key});

  @override
  State<Promotions> createState() => _PromotionsState();
}

class _PromotionsState extends State<Promotions> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: getProportionateScreenHeight(137),
        pageSnapping: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
      ),
      items: [
        Container(
          width: getProportionateScreenWidth(372),
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(-0.95, 0.32),
              end: Alignment(0.95, -0.32),
              colors: [AppColors.blackshade200, AppColors.lightgrey],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(18)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getProportionateScreenHeight(20)),
                    customTextNunitoSansCenter(
                        inputText: StaticText.todayOff,
                        fontSize: 16,
                        weight: FontWeight.w400,
                        colorName: AppColors.primaryColor),
                    SizedBox(height: getProportionateScreenHeight(7)),
                    customTextNunitoSansCenter(
                        inputText: StaticText.free,
                        fontSize: 20,
                        weight: FontWeight.w600,
                        colorName: AppColors.primaryColor),
                    SizedBox(height: getProportionateScreenHeight(12)),
                    customTextNunitoSansCenter(
                        inputText: StaticText.news,
                        fontSize: 13,
                        weight: FontWeight.w500,
                        colorName: AppColors.primaryColor),
                  ],
                ),
           
              ],
            ),
          ),
        ),
        Container(
          clipBehavior: Clip.antiAlias,
          width: getProportionateScreenWidth(372),
          decoration: ShapeDecoration(
            gradient: AppColors.grade,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: -69,
                top: 7.30,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(-0.43),
                  child: Container(
                    width: 200.45,
                    height: 277.18,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.foodRedColor),
                  ),
                ),
              ),
              Positioned(
                left: getProportionateScreenWidth(24),
                top: getProportionateScreenHeight(36),
                child: customTextNunitoSansCenter(
                    inputText: StaticText.todaybuy,
                    fontSize: 20,
                    weight: FontWeight.w800,
                    colorName: AppColors.primaryColor),
              ),
              Positioned(
                left: getProportionateScreenWidth(24),
                top: getProportionateScreenHeight(100),
                child: customTextNunitoSansCenter(
                    inputText: StaticText.shop,
                    fontSize: 14,
                    weight: FontWeight.w600,
                    colorName: AppColors.primaryColor),
              ),
          
            ],
          ),
        ),
      ],
    );
  }
}