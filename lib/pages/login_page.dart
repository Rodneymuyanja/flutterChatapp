import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  void signIn() async{
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
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
                const SizedBox(height: 50,),
                //logo
                //Lottie.asset('lib/assets/inboxgif.gif'),
                Lottie.network('https://lottie.host/151588b7-d3bb-4019-8451-37adc165de09/s3e8UVurkG.json'),
                // const Icon(
                //   Icons.message, 
                //   size: 90,
                // ),

                const SizedBox(height: 50,),
                //welcome back message
                const Text('Welcome back you were sooooo missed',
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

                //sign in button
                MyButton(onTap: signIn, text: 'Sign In'),

                const SizedBox(height: 50,),
                //not a member? sign in now
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member?'),
                    const SizedBox(width: 4,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child:  Text('Register now',
                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple[700]
                        ),
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