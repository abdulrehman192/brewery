import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '/viewModel/viewModel.dart';
import '/widgets/widgets.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final _viewModel = SignupViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios),
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleWidget(),
                const SizedBox(height: 30,),
                const Text("Lets begin", style: TextStyle(color: AppColors.primaryColor, fontSize: 28, fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                const Text("Choose your username and set your password", style: TextStyle(color: AppColors.primaryColor),),
                const SizedBox(height: 35,),
                InputFiled(
                    controller: _viewModel.usernameController,
                    hintText: "Choose username*",
                    hintColor: AppColors.secondaryColor,
                    preIcon: const Icon(Icons.person, color: AppColors.primaryColor,),
                    validator: (value)
                    {
                      if(value!.isEmpty)
                        {
                          return "Please choose a username";
                        }
                      else if(!Common.validateEmail(value))
                        {
                          return "Please enter valid email";
                        }
                      return null;
                    },
                ),
                Consumer<SignupViewModel>(
                  builder: (_, data, __) {
                    return InputFiled(
                      isPassword: !data.showPassword,
                      controller: _viewModel.passwordController,
                      hintText: "Set Password*",
                      hintColor: AppColors.secondaryColor,
                      preIcon: const Icon(Icons.lock, color: AppColors.primaryColor,),
                      trailIcon: IconButton(
                        onPressed: (){
                          data.showHidePassword();
                        },
                        splashRadius: 20,
                        icon: data.showPassword ? const Icon(Icons.visibility, color: AppColors.primaryColor) : const Icon(Icons.visibility_off, color: AppColors.primaryColor),
                      ),
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return "Please set a password";
                        }
                        else if(!Common.validatePassword(value))
                          {
                            return "Please enter a valid password";
                          }
                        return null;
                      },
                    );
                  }
                ),
                Consumer<SignupViewModel>(
                  builder: (_, data, __) {
                    return InputFiled(
                      isPassword: !data.showRePassword,
                      controller: _viewModel.repassController,
                      hintText: "Repeat Password*",
                      hintColor: AppColors.secondaryColor,
                      preIcon: const Icon(Icons.history, color: AppColors.primaryColor,),
                      trailIcon: IconButton(
                        onPressed: (){
                          data.showHideRePassword();
                        },
                        splashRadius: 20,
                        icon: data.showRePassword ? const Icon(Icons.visibility, color: AppColors.primaryColor) : const Icon(Icons.visibility_off, color: AppColors.primaryColor),
                      ),

                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return "Please repeat password";
                        }
                        else if(!Common.validatePassword(value))
                        {
                          return "Please enter a valid password";
                        }
                        else if(!_viewModel.matchPassword())
                          {
                            return "Please enter same password";
                          }
                        return null;
                      },
                    );
                  }
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: const Text("Password : at least 8 characters, 1 capital letter and 1 number.", style: TextStyle(color: AppColors.primaryColor),),
                    )
                  ],
                ),
                const SizedBox(height: 50,),
                BlockButton(
                    buttonText: "Continue",
                    onPressed: (){
                      if( _formKey.currentState!.validate())
                        {
                          _viewModel.signUp(context);
                        }
                    }
                ),
                const SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
