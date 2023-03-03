import 'package:flutter/material.dart';
import 'package:register_screen/register_screen.dart';
import 'home_screen.dart';
import 'shared/components.dart';

class LoginScreen extends StatefulWidget {
   const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPressed =false;
  TextEditingController emailController =TextEditingController();
  TextEditingController pwController =TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: MyCustomClip(),
                child: Container(
                  color: Colors.purple,
                  height: 200,
                  width: double.infinity,
                  child:  Center(child:  Text('login'.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key:formKey ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultTextField(
                          validate: (value){
                            if(value.isEmpty){
                              return 'This Field must not be empty';
                            }else if(!value!.contains('@')){
                              return 'Please check your email';
                            }
                          },
                          control:emailController,
                          label: 'Email',
                          icona: Icons.email_outlined,
                          type: TextInputType.text),
                      const SizedBox(height: 15),
                      defaultTextField(
                          validate: (value){
                            if(value.isEmpty){
                              return 'This Field must not be empty';
                            }
                          },
                          control: pwController,
                          label: 'Password',
                          pwInvisible: isPressed?false:true,
                          icona: Icons.lock_outline,
                          suffix:isPressed?Icons.visibility_off_rounded:Icons.visibility_rounded ,
                          suffixPressed: (){
                            setState((){
                              isPressed= !isPressed;
                            });
                          },
                          type: TextInputType.text),
                      const SizedBox(height: 15),
                      ElevatedButton(onPressed: (){
                        if(formKey.currentState!.validate()){
                          navigateAndFinish(context,const HomeScreen());
                        }
                      },
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 120.0,vertical: 15),
                            child: Text('login'.toUpperCase()),
                          )),
                      const SizedBox(height: 15),
                      OutlinedButton(
                        onPressed: (){
                          navigateTo(context,const RegisterScreen());
                        },
                        child:  const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 110.0,vertical: 15),
                          child: Text('Sign Up'),
                        ),
                      ),


                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}



