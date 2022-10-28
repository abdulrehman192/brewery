import 'package:brewery/utils/colors.dart';
import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150,
      height: 150,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 3,
            color: Colors.grey,
            offset: Offset(1, 5)
          )
        ]
      ),
      child: Container(
        alignment: Alignment.center,
        width: 110,
        height: 110,
        decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 8,
                  color: Colors.grey,
                  offset: Offset(1, 5)
              )
            ]
        ),
        child: Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 8,
                    color: Colors.grey,
                    offset: Offset(1, 5)
                )
              ]
          ),
        ),
      ),
    );
  }
}
