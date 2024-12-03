import 'package:chatify/Screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => SignupState();
}

class SignupState extends State<Signup> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // This key is required to save and reset or validate the rules defined for the textformfields
  final formKey = GlobalKey<FormState>();

  // for hiding or showing the password
  bool toggleHidePassword = true;

  bool get areAllfieldsFilled =>
      firstNameController.text.isNotEmpty &&
      lastNameController.text.isNotEmpty &&
      emailController.text.isNotEmpty &&
      phoneController.text.isNotEmpty &&
      passwordController.text.isNotEmpty;

  void validateForm() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    firstNameController.addListener(validateForm);
    lastNameController.addListener(validateForm);
    emailController.addListener(validateForm);
    phoneController.addListener(validateForm);
    passwordController.addListener(validateForm);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
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
                  const SizedBox(height: 50),
                  const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: firstNameController,
                    style: const TextStyle(color: Colors.grey),
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      hintText: 'Enter your first name',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.grey),
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: lastNameController,
                    style: const TextStyle(color: Colors.grey),
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      hintText: 'Enter your last name',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.grey),
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
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
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: phoneController,
                    style: const TextStyle(color: Colors.grey),
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                      hintText: 'Enter your phone number',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.grey),
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
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
                        icon: Icon(
                          toggleHidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: areAllfieldsFilled &&
                            formKey.currentState?.validate() == true
                        ? () {
                            Get.to(const SignIn());
                            Get.snackbar(
                              'Success',
                              'Signed up successfully',
                              duration: const Duration(seconds: 1),
                              backgroundColor:
                                  Colors.lightGreenAccent.withOpacity(0.5),
                              colorText: Colors.white,
                            );
                          }
                        : null,
                    style: TextButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      side: const BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Already a user?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(
                const SignIn(),
                transition: Transition.fadeIn,
                duration: const Duration(seconds: 2),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'Sign in',
                style: TextStyle(
                  color: Colors.lightGreenAccent.withOpacity(0.9),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
