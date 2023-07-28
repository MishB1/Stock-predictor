import 'package:flutter/material.dart';
import 'package:stock_predictor/auth/login_or_register.dart';
import 'package:stock_predictor/components/button.dart';
import 'package:stock_predictor/components/textField.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                        color: Colors.grey[700]
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
                  onTap: (){}, 
                  text: 'Sign In'
                ),
                 
                SizedBox(height: 25),
                // go to register page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?",
                      style: TextStyle(
                        color: Colors.grey[700]
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
    );
  }
}  