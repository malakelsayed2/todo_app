import 'package:authentication/todo_screen.dart';
import 'package:authentication/widgets/custom_button.dart';
import 'package:authentication/widgets/custom_text_field.dart';
import 'package:authentication/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Icon(
                Icons.check_circle_outline,
                color: Colors.purple.shade700,
                size: 100,
              ),
              SizedBox(height: 20),

              Text(
                "Create Account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                "Sign up to get started with our app",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              SizedBox(height: 80),
              Expanded(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: fullNameController,
                        icon: Icons.person_outline_outlined,
                        hintText: "Full Name",
                        validator: (String? String) {
                          if (String!.length < 5) {
                            return "Full Name cant't be shorter than 5 characters";
                          }
                        },
                      ),
                      SizedBox(height: 20),
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
                      SizedBox(height: 20),
                      CustomTextField(
                        icon: Icons.lock_outline,
                        hintText: "Confirm Password",
                        obsText: true,
                        validator: (String) {
                          if (String != passwordController.text) {
                            return "Passwords don't Match";
                          }
                        },
                        controller: confirmPassController,
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                label: "Sign Up",
                onPressed: () async {
                  final isValid = formKey.currentState!.validate();
                  if (isValid) {
                    final user = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                    await user.user!.updateDisplayName(fullNameController.text);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => TodoScreen()),
                      (route) => false,
                    );
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false,
                      );
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.purple.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
