//-------------Navigator.push--------------

import 'package:flutter/material.dart';

void navigateTo( context, widget)=>Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context)=>widget
    )
);


//-------------Navigator.push and replacement--------------

void navigateAndFinish(context,widget)=>Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(
        builder: (context)=>widget
    ),
        (Route<dynamic> route){
      return false;
    }

);
//-----------------------------------------------------------



// ---------Text Form Field-----------------------------------
Widget defaultTextField({
  required var validate,
  required TextEditingController control,
  var onFieldSubmit ,
  var onFieldChange ,
  IconData? suffix,
  var suffixPressed ,
  required String label,
  required IconData icona,
  required TextInputType type,
  bool pwInvisible=false,
  var onTap,
})=>TextFormField(
  validator:validate ,
  controller:control ,
  obscureText: pwInvisible,
  onFieldSubmitted:onFieldSubmit,
  onChanged:onFieldChange,
  onTap: onTap,
  keyboardType:type,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(icona),
    suffixIcon: suffix != null?IconButton(icon: Icon(suffix), onPressed:suffixPressed):null,

    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  ),
);

// -----------------------------------------------------------


// This class is used as a custom widget to make the wave shape at the top of the screen

class MyCustomClip extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height-20 );
    var firstControlPoint = Offset(size.width / 3.5, size.height - 50);
    var firstEndPoint = Offset(size.width / 1.75, size.height - 20);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 1.25, size.height);
    var secondEndPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

