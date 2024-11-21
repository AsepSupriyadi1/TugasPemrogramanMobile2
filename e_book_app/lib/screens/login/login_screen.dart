import 'package:e_book_app/screens/bottom_nav_bar.dart';
import 'package:e_book_app/screens/login/components/textfield_component.dart';
import 'package:e_book_app/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../../constant/account.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /* 
    Dibawah ini merupakan variable untuk satu satunya akun yang bisa masuk kedalam aplikasi
  */

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /* 
    isObscure disini berfungsi khusus untuk password input, dimana ketika obscure bernilai true 
    icon mata akan berubah dan password akan di toggle untuk terlihat dan tidak terlihat nya
  */
  bool isObscure = true;

  /* 
    Method validate dibawah ini berfungsi untuk memvalidasi inputan yang diberikan oleh user
    yang di validasi oleh method ini antara lain
    1. Apabila Username dan Password nya kosong
    2. Apabila Username dan Password nya salah
    3. Apabila Username dan Passsword benar

    jika berakhir pada kondisi ke-3 maka user baru bisa masuk ke halaman dashbord dari aplikasi ini
  */
  void validate(String reqEmail, String reqPassword) {
    bool isEmailAndPasswordCorrect =
        reqEmail == dummyEmail && reqPassword == dummyPassword;

    if (reqEmail.trim().isNotEmpty && reqPassword.trim().isNotEmpty) {
      if (isEmailAndPasswordCorrect) {
        showToast("login berhasil!",
            context: context, animation: StyledToastAnimation.slideFromBottom);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomNavbar()));
      } else {
        showToast("Incorrect email or password!",
            context: context, animation: StyledToastAnimation.slideFromBottom);
      }
    } else {
      showToast("Email & Password is required!",
          context: context, animation: StyledToastAnimation.slideFromBottom);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login', style: semiBoldText20),
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
              Text('Login Details',
                  style: semiBoldText20.copyWith(fontSize: 20.0)),
              const SizedBox(height: 24),
              TextfieldComponent(
                controller: emailController,
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                hint: "Email or username",
              ),
              const SizedBox(height: 16.0),
              TextfieldComponent(
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
                      backgroundColor: greenColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  onPressed: () {
                    // ignore: avoid_print
                    print("EMAIL : ${emailController.text}");
                    // ignore: avoid_print
                    print("PASSWORD : ${passwordController.text}");
                    String inputEmail = emailController.text;
                    String inputPassword = passwordController.text;

                    validate(inputEmail, inputPassword);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Login',
                      style: semiBoldText16.copyWith(
                          fontSize: 20.0,
                          color: Colors.white,
                          backgroundColor: greenColor),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
