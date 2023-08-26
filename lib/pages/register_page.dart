import 'package:chatapp/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  
  ///sign up method
  void signUp(){
    if(passwordController.text != confirmPasswordController.text){
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Passwords Do not match')));
         return;
    }

    try {
        final authService = Provider.of<AuthService>(context, listen: false);
        authService.signUpWithEmailAndPassword(emailController.text, passwordController.text);
  
    } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(e.toString())));
     
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                 Lottie.network('https://lottie.host/4ee2fd92-c00d-4f07-99cc-9c40a3969a4e/Gj4BepV7lb.json'),
                
                // const Icon(
                //   Icons.message, 
                //   size: 90,
                // ),
                //welcome back message
                const Text('Let\'s create your account',
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                const SizedBox(height: 25,),

                //email textfield
                MyTextfield(
                  controller: emailController, 
                  hintText: 'Email', 
                  obscureText: false
                ),
                const SizedBox(height: 10,),

                //password textfield
                MyTextfield(
                  controller: passwordController, 
                  hintText: 'Password', 
                  obscureText: true
                ),
                const SizedBox(height: 10,),

                //confirm password
                 MyTextfield(
                  controller: confirmPasswordController, 
                  hintText: 'Confirm Password', 
                  obscureText: true
                ),
                const SizedBox(height: 10,),
                //sign in button
                MyButton(onTap: signUp, text: 'Register'),

                const SizedBox(height: 50,),
                //not a member? sign in now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already a member?'),
                    const SizedBox(width: 4,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text('sign in',
                      style:TextStyle(
                        fontWeight: FontWeight.bold),
                        ),
                    )
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
