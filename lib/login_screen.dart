import 'package:flutter/material.dart';

import 'sign_up_screen.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 4),
              Icon(
                Icons.check_circle_outline,
                color: Colors.purple.shade700,
                size: 100,
              ),
              Spacer(flex: 1),
              Text(
                "Welcome Back",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                "Sign in to continue using our app",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              Spacer(flex: 3),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      icon: Icons.email_outlined,
                      hintText: "Email",
                      validator: (String) {
                        if (!String!.contains('@')) {
                          return "invalid Email";
                        }
                      },
                      controller: emailController,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      icon: Icons.lock_outline,
                      hintText: "Password",
                      obsText: true,
                      validator: (String) {
                        if (String!.length < 8) {
                          return "Passwords must be at least 8 characters";
                        }
                      },
                      controller: passwordController,
                    ),
                  ],
                ),
              ),
              Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot password?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple.shade700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Spacer(flex: 3),
              CustomButton(
                label: "Sign In",
                onPressed: () {
                  formKey.currentState!.validate();
                },
              ),
              Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                            (route) => false,
                      );
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.purple.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
