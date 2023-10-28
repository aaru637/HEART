import 'package:heart/Providers/AdminProvider.dart';
import 'package:heart/Screens/Home/API/AdminAPI.dart';
import 'package:flutter/material.dart';
import 'package:heart/Screens/Main/AdminMainScreen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AdminOpeningScreen extends StatelessWidget {
  const AdminOpeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final adminService = Provider.of<AdminProvider>(context);
    return Container(
      color: Colors.white,
      child: FutureBuilder(
        future: adminService.setAdmin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LottieBuilder.asset("assets/animations/Loading.json");
          } else {
            if (snapshot.data!.isEmailVerified == false) {
              return Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                          "Your Email is Not Verified. Please Verify Your Email"),
                    ),
                    Center(
                      child: TextButton(
                        child: const Text("Send Link"),
                        onPressed: () async {
                          final result =
                              await AdminAPI.emailResent(adminService.id_!);
                          if (result == "email-sent") {
                            print(
                                "Email Sent . Verify your Email within a hour.");
                          } else if (result == "email-sent-error") {
                            print(
                                "Error Occured in Email sent. Please Try again later.");
                          } else {
                            print("Please Try again later.");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const AdminMainScreen();
            }
          }
        },
      ),
    );
  }
}
