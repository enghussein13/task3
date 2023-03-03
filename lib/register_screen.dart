import 'package:flutter/material.dart';
import 'package:register_screen/login_screen.dart';
import 'shared/components.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey =GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController confirmPwController = TextEditingController();

  bool isPressed =false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [Column(
              children: [
                ClipPath(
                  clipper: MyCustomClip(),
                  child: Container(
                    color: Colors.purple,
                    height: 200,
                    width: double.infinity,
                    child:  Center(child:  Text('Register'.toUpperCase(),
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
                   key: formKey,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       defaultTextField(
                           validate: (value){
                             if(value.isEmpty){
                               return 'This Field must not be empty';
                             }
                           },
                           control:fullNameController,
                           label: 'Full Name',
                           icona: Icons.perm_identity_outlined,
                           type: TextInputType.text),
                       const SizedBox(height: 15),
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
                           control:phoneController,
                           label: 'Phone Number',
                           icona: Icons.phone,
                           type: TextInputType.phone),
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
                       defaultTextField(
                           validate: (value){
                             if(value.isEmpty){
                               return 'This Field must not be empty';
                             }
                           },
                           control: confirmPwController,
                           label: 'Confirm Password',
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
                           navigateAndFinish(context, LoginScreen());
                         }
                       },
                           child:  Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 90.0,vertical: 15),                         child: Text('register'.toUpperCase()),
                           )),
                       const SizedBox(height: 15),
                       OutlinedButton(
                         onPressed: (){
                           navigateAndFinish(context, LoginScreen());
                         },
                         child:  Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 100.0,vertical: 15),
                           child: Text('login'.toUpperCase(),),
                         ),
                         ),


                     ],
                   ),
                 ),
               )

              ],
            ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon:const Icon(Icons.arrow_back,color: Colors.white,)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

