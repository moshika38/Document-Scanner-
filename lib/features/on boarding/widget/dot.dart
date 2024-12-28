import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';

class Dot {
  
  static  Widget buildDot(int currentPage,int index) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentPage == index
            ? AppColors.primary
            : AppColors.inactiveDot,
      ),
    );
  }
}