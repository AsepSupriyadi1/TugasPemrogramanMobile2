import 'package:flutter/material.dart';
import 'package:tugas_1/styles.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.textParam});

  final String textParam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Dashboard', style: TextStyles.title.copyWith(color: Colors.white)),
        backgroundColor: AppColors.darkBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome to our dashboard!",
                style: TextStyles.title.copyWith(fontSize: 24, backgroundColor: Colors.white),
              ),
              Image.asset('assets/images/dashboard_bg.png'),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: 'Halo ', // Teks biasa
                  children: [
                    TextSpan(
                      text: 'Andi Sugara, ', 
                      style: TextStyles.body.copyWith(backgroundColor: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:  "Selamat datang di dashboard kami, karena aplikasi ini masih dalah tahap pengembangan silahkan hubungi CS apabila mengalami kendala, terimakasih.", 
                      style: TextStyles.body.copyWith(backgroundColor: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}