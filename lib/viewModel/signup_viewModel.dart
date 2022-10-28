import 'package:brewery/utils/firebase_utility.dart';
import 'package:brewery/view/brawery_list_view.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class SignupViewModel extends ChangeNotifier
{
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final repassController = TextEditingController();
  bool showPassword = false;
  bool showRePassword = false;

  showHidePassword()
  {
    showPassword = !showPassword;
    notifyListeners();
  }

  showHideRePassword()
  {
    showRePassword = !showRePassword;
    notifyListeners();
  }

  bool matchPassword()
  {
    if(passwordController.text == repassController.text)
      {
        return true;
      }
    else
      {
       return false;
      }
  }

  signUp(BuildContext context) async
  {
    var u = await FirebaseUtility.signUpWithEmailPassword(
        email: usernameController.text,
        password: passwordController.text,
        context: context);
    if(u != null)
      {
        Common.showSnackBar('You Successfully Signup!', context);
        Common.openScreen(context: context, screen: BreweryListView());
      }
  }
}