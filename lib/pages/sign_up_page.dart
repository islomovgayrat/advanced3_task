import 'package:advanced3_task/pages/login_page.dart';
import 'package:advanced3_task/service/secure_service.dart';
import 'package:flutter/material.dart';

import '../model/secure_user_model.dart';
import '../service/logger.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController textFullNameController = TextEditingController();
  TextEditingController textGmailController = TextEditingController();
  TextEditingController textPhoneController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  TextEditingController textPasswordCheckController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const LoginPage(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 28,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              //Let's Get Started!
              const Text(
                "Let's Get Started!",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 26,
                ),
              ),
              //Create an account to Q Allure to get all features
              const Text(
                'Create an account to Q Allure to get all features',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              container(
                textEditingController: textFullNameController,
                prefixIcon: const Icon(Icons.person_2_outlined),
                hintText: 'John Williams',
              ),
              container(
                textEditingController: textGmailController,
                prefixIcon: const Icon(Icons.email),
                hintText: 'Email',
              ),
              container(
                textEditingController: textPhoneController,
                prefixIcon: const Icon(Icons.phone_android),
                hintText: 'Phone',
              ),
              container(
                textEditingController: textPasswordController,
                prefixIcon: const Icon(Icons.lock_open_outlined),
                hintText: 'Password',
              ),
              container(
                textEditingController: textPasswordCheckController,
                prefixIcon: const Icon(Icons.lock_open_outlined),
                hintText: 'Confirm Password',
              ),
              const SizedBox(height: 20),

              //create button
              GestureDetector(
                onTap: () {
                  var user = SecureUser(
                    textFullNameController.text,
                    textGmailController.text,
                    textPhoneController.text,
                    textPasswordController.text,
                    textPasswordCheckController.text,
                  );
                  SecureService.storeUser(user);
                  SecureService.loadUser().then(
                    (value) => {
                      LogService.d(value!.toJson().toString()),
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 85),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Center(
                    child: Text(
                      'Create',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              //Already have an account? and Login here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 5),

                  //login here
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (builder) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Login here",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool a({required bool a}) => a;

  Widget container({
    required TextEditingController textEditingController,
    required prefixIcon,
    required hintText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 3,
            blurRadius: 20,
          ),
        ],
      ),
      child: Center(
        child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            prefixIcon: prefixIcon,
            prefixIconColor: Colors.grey,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
