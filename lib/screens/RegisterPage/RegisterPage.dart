import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stock_predictor/screens/homeScreen/homeScreen.dart';
import '../../components/loginButton.dart';
import '../../components/logInTextField.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isPasswordVisible = false;
  bool isPasswordConfirmationVisible = false;
  // text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  void signUp() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    //make sure passwords work first
    if (passwordTextController.text != confirmPasswordTextController.text) {
      //pop loading circle
      Navigator.pop(context);
      //show error to user
      displayMessage("Passwords don't match");
      return;
    }

    //try sign in
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );

      //pop loading circle
      if (!mounted) return;
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  pageIndex: 1,
                )),
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
                    'Create Account',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Connect with your friends today!",
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
                  SizedBox(height: 20),
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5),

                  MyTextField(
                    controller: confirmPasswordTextController,
                    hintText: 'Confirm Password',
                    obscureText: isPasswordConfirmationVisible,
                    icon: isPasswordConfirmationVisible == true
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordConfirmationVisible = false;
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
                                isPasswordConfirmationVisible = true;
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

                  MyButton(onTap: signUp, text: 'Sign Up'),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Login",
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
