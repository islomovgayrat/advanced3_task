import 'package:advanced3_task/model/user_model.dart';
import 'package:advanced3_task/pages/sign_up_page.dart';
import 'package:advanced3_task/service/logger.dart';
import 'package:advanced3_task/service/pref_service.dart';
import 'package:advanced3_task/service/secure_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textGmailController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              //image
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrXM8iKoDd_Q0oMMeqfvmXIiPM0Wbfk9H0eA&usqp=CAU',
                fit: BoxFit.cover,
                height: 240,
                width: double.infinity,
              ),
              //Welcome back text
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //description
              const Text(
                'Log in to your existent account of Q Allure',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 30),
              container(
                textEditingController: textGmailController,
                prefixIcon: const Icon(Icons.person_2_outlined),
                hintText: 'Jonswilliams5@gmail.com',
              ),
              const SizedBox(height: 20),
              container(
                textEditingController: textPasswordController,
                prefixIcon: const Icon(Icons.password),
                hintText: 'Password',
              ),
              const SizedBox(height: 10),

              //Forgot password text
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              //Log in button
              GestureDetector(
                onTap: () {
                  var user = User(
                    textGmailController.text,
                    textPasswordController.text,
                  );
                  Prefs.storeUser(user);
                  Prefs.loadUser().then(
                    (value) => {
                      LogService.d(value!.toJson().toString()),
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 85),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Center(
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              //or connect using text
              const Text(
                'Or connect using',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 15),

              //facebook and google buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFF375C8E),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'f',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Facebook',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF04437),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'G',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Google',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              //don't have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (builder) => const SignUp(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Up",
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

  Widget container({
    required TextEditingController textEditingController,
    required prefixIcon,
    required hintText,
  }) =>
      Container(
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
