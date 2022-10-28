import 'package:flutter/material.dart';

import '../utils/utils.dart';

class BlockButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  const BlockButton({Key? key, required this.buttonText, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.buttonColor),
            side: MaterialStateProperty.all(const BorderSide(color: AppColors.primaryColor)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ))
        ),
        child: Text(buttonText),
      ),
    );
  }
}
