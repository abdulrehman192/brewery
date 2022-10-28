import 'package:flutter/material.dart';

class Common
{

  static showSnackBar(String message, BuildContext context, [Color? color]) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,

    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static showConfirmAlert({required String title, required String content, required BuildContext context, required Function() onYes}) async
  {
    await showDialog(
        context: context,
        builder: (context)
        {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                  onPressed: (){
                    onYes();
                    Navigator.pop(context);
                  },
                  child: const Text("Yes")
              ),
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text("No")
              )
            ],
          );
        }
    );
  }

  static void openScreen({required BuildContext context, required dynamic screen})
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static bool validatePassword(String value) {
    RegExp regex = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$");
    return regex.hasMatch(value);
  }

  static bool validateEmail(String email)
  {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return emailValid;
  }

}
