import 'package:flutter/material.dart';
import 'package:tugas_1/_dashboard.dart';
import 'package:tugas_1/account.dart';
import 'package:tugas_1/styles.dart';
import 'package:tugas_1/widget/custom_textfield.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  bool isObscure = true;

  void validate(String username, String password) {
    bool isUsernameAndPasswordCorrect = 
      username == Account.email && password == Account.password;


    if(username.trim().isNotEmpty && password.trim().isNotEmpty){
      if(isUsernameAndPasswordCorrect){
        showToast(
          "login berhasil!",
          context:context,
          animation: StyledToastAnimation.slideFromBottom
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(textParam: Account.name)
          )
        );
      } else {
        showToast(
          "Incorrect username or password!",
          context:context,
          animation: StyledToastAnimation.slideFromBottom
        );
      }
    } else {
      showToast(
        "Username & Password is required!",
        context:context,
        animation: StyledToastAnimation.slideFromBottom
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login', style: TextStyles.title),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/login_bg.png'),
              const SizedBox(height: 16.0),
              Text('Login Details', style: TextStyles.title.copyWith(fontSize: 20.0)),
              const SizedBox(height: 24),
              CustomTextfield(
                controller: emailController,
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                hint: "Email or username",
              ),
              const SizedBox(height: 16.0),
              CustomTextfield(
                controller: passwordController,
                inputType: TextInputType.visiblePassword,
                inputAction: TextInputAction.done,
                hint: "Password",
                isObscure: isObscure,
                hasSuffix: true,
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
                onPressed: (){
                  print("EMAIL : ${emailController.text}");
                  print("PASSWORD : ${passwordController.text}");
                  String inputEmail = emailController.text;
                  String inputPassword = passwordController.text;

                  validate(inputEmail, inputPassword);
                }, 
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Login',
                    style: TextStyles.title.copyWith(
                      fontSize: 20.0,
                      color: Colors.white,
                      backgroundColor: AppColors.darkBlue
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
