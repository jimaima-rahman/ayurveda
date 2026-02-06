import 'package:ayurveda/core/constants/button.dart';
import 'package:ayurveda/core/utils/responsive.dart';
import 'package:ayurveda/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/Frame 176.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/Layer_1-2.png',
                  width: R.sw(80, context),
                  height: R.sh(84, context),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(R.sw(20, context)),
              child: Column(
                spacing: R.sh(10, context),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login Or Register To Book \nYour Appointments',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: R.sw(24, context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: R.sh(20, context)),
                  Text(
                    'Email',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: R.sw(16, context),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: 'Enter your email',
                    ),
                  ),
                  SizedBox(height: R.sh(10, context)),
                  Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: R.sw(16, context),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: 'Enter password',
                    ),
                  ),
                  SizedBox(height: R.sh(60, context)),
                  CustomElevatedButton(
                    onPressed: () async {
                      await authProvider.login(
                        usernameController.text.trim(),
                        passwordController.text.trim(),
                      );

                      if (authProvider.token != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login Successful')),
                        );
                      } else if (authProvider.error != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(authProvider.error!)),
                        );
                      }
                    },
                    text: 'Login',
                    height: R.sh(50, context),
                    width: R.sw(350, context),
                  ),
                  SizedBox(height: R.sh(60, context)),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                      children: [
                        const TextSpan(
                          text:
                              'By creating or logging into an account you are agreeing with our ',
                        ),
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
