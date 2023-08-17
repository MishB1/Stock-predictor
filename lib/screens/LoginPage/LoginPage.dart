import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stock_predictor/components/loginButton.dart';
import 'package:stock_predictor/components/logInTextField.dart';
import 'package:stock_predictor/screens/RegisterPage/RegisterPage.dart';
import 'package:stock_predictor/screens/homeScreen/homeScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = false;
  // text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  //sign in user
  void signIn() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );

      //pop loading circle
      if (!mounted) return;
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false,
      );
    } on FirebaseAuthException catch (error) {
      //pop loading circle
      Navigator.pop(context);
      displayMessage(error.code);
    }
  }

  //display a dialogue message
  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // logo
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, Welcome Back!👋',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Hello again, you've been missed!",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 50),

                  Text(
                    'Email Address',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5),
                  // email textfield
                  MyTextField(
                    controller: emailTextController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    'Password',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5),
                  // password texttfield

                  MyTextField(
                    controller: passwordTextController,
                    hintText: 'Password',
                    obscureText: !isPasswordVisible,
                    icon: isPasswordVisible == true
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordVisible = false;
                              });
                            },
                            child: Icon(
                              Icons.visibility_off_outlined,
                              size: 20,
                              color: Colors.black,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordVisible = true;
                              });
                              print('object');
                            },
                            child: Icon(
                              Icons.visibility_outlined,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                  ),

                  SizedBox(height: 30),

                  //sign in button
                  MyButton(onTap: signIn, text: 'Sign In'),
                ],
              ),

              // go to register page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
