import 'package:chatify/Home/home_screen.dart';
import 'package:chatify/Screens/signup.dart';
import 'package:chatify/constants/appColors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => SignInState();
}

class SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

// This key is required to save and reset or validate the rules defined for the textformfields
  final formKey = GlobalKey<FormState>();

// for hiding or showing the password

  bool toggleHidePassword = true;

  bool get areAllfieldsFilled =>
      emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

  Future<void> signInWithEmail() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Get.to(const HomeScreen(),
          transition: Transition.fadeIn, duration: const Duration(seconds: 1));

      Get.snackbar('Success', 'User signed up successfully!',
          backgroundColor: AppColors.successColor,
          colorText: AppColors.textColor);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Alert Message', e.message ?? 'Sign in failed',
          backgroundColor: AppColors.alertColor,
          colorText: AppColors.textColor);
    }
  }

  void validateForm() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    emailController.addListener(validateForm);

    passwordController.addListener(validateForm);
  }

  @override
  void dispose() {
    emailController.dispose();

    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                        controller: emailController,
                        style: const TextStyle(color: Colors.grey),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter a valid email',
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(color: Colors.grey),
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegExp(r'^\S+@\S+\.com$').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }

                          return null;
                        }),
                    const SizedBox(height: 20),
                    TextFormField(
                        controller: passwordController,
                        obscureText: toggleHidePassword,
                        style: const TextStyle(color: Colors.grey),
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: const OutlineInputBorder(),
                            labelStyle: const TextStyle(color: Colors.grey),
                            hintStyle: const TextStyle(color: Colors.grey),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    toggleHidePassword = !toggleHidePassword;
                                  });
                                },
                                icon: Icon(toggleHidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility))),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return 'Please must be atleast 6 characters long';
                          }

                          return null;
                        }),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: areAllfieldsFilled &&
                              formKey.currentState?.validate() == true
                          ? signInWithEmail
                          : null,
                      style: TextButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        side: const BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('New user?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300)),
          GestureDetector(
            onTap: () {
              Get.to(const Signup(),
                  transition: Transition.fadeIn,
                  duration: const Duration(seconds: 1));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'Sign up',
                style:
                    TextStyle(color: Colors.lightGreenAccent.withOpacity(0.9)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
