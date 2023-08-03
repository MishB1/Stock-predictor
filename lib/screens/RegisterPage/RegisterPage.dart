import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../components/loginButton.dart';
import '../../components/logInTextField.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
 // text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController =  TextEditingController();
  final confirmPasswordTextController = TextEditingController();

void signUp() async {

    //show loading circle
    showDialog(context: context, 
    builder: (context) => Center(
      child: CircularProgressIndicator(),
    )
    );

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
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (error) {

      //pop loading circle
      Navigator.pop(context);
      displayMessage(error.code);
    }
  }

  //display a dialogue message
  void displayMessage(String message) {
    showDialog(context: context, 
    builder: (context) => AlertDialog(
      title: Text(message),
    ),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                                                                              
                  // logo
                  Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  SizedBox(height: 50,),
                  
                  //welcome back message
                  Text("Let's create an account for you",
                  style: TextStyle(
                          color: Colors.white
                        ),),
                  SizedBox(height: 25,),
                      
                  // email textfield
                  MyTextField(
                    controller: emailTextController, 
                    hintText: 'Email', 
                    obscureText: false,
                  ),
                  
                   SizedBox(height: 10,),
                  // password texttfield
                  MyTextField(
                    controller: passwordTextController, 
                    hintText: 'Password', 
                    obscureText: true,
                  ),
                  
                  SizedBox(height: 10,),
                  // confirm password texttfield
                  MyTextField(
                    controller: confirmPasswordTextController, 
                    hintText: 'Confirm Password', 
                    obscureText: true,
                  ),
            
                   SizedBox(height: 25),
                   
                   //sign in button
                   MyButton(
                    onTap: signUp, 
                    text: 'Sign Up'
                  ),
                   
                  SizedBox(height: 25),
                  // go to register page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
            
                      SizedBox(width: 4),
            
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text("Login now", 
                        style:TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}  