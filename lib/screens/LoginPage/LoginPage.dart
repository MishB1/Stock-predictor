import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stock_predictor/auth/login_or_register.dart';
import 'package:stock_predictor/components/loginButton.dart';
import 'package:stock_predictor/components/logInTextField.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister()), // use MaterialApp
  );


}
class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});
    
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController =  TextEditingController();

  //sign in user
  void signIn() async {

    //show loading circle
    showDialog(context: context, 
    builder: (context) => Center(
      child: CircularProgressIndicator(),
    )
    );


    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
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
                  Text("Welcome back, you've been missed!",
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
            
                   SizedBox(height: 25),
                   
                   //sign in button
                   MyButton(
                    onTap: signIn, 
                    text: 'Sign In'
                  ),
                   
                  SizedBox(height: 25),
                  // go to register page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Not a member?",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      
                      SizedBox(width: 4),
            
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text("Register now", 
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