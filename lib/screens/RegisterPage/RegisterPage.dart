import 'package:flutter/material.dart';
import '../../components/button.dart';
import '../../components/textField.dart';

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
                Text("Let's create an account for you",
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
                  onTap: (){}, 
                  text: 'Sign Up'
                ),
                 
                SizedBox(height: 25),
                // go to register page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                      style: TextStyle(
                        color: Colors.grey[700]
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
    );
  }
}  