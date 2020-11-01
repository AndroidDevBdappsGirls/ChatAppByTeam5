import 'package:flutter/material.dart';
import 'package:kothopokothonn/widget/widget.dart';
import 'package:shimmer/shimmer.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController passwordEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        // padding: EdgeInsets.symmetric(vertical: 50),
        // constraints: BoxConstraints.expand(),
        // decoration: BoxDecoration(
        // image: DecorationImage(
        // image: AssetImage("assets/images/phone.jpg"),
        // fit: BoxFit.cover, )),
       padding: EdgeInsets.symmetric(horizontal: 30),
       child:Column(
        children: [
          SizedBox(height: 100,),

          Shimmer.fromColors(
            baseColor: Color(0xffd81b60),
            highlightColor: Color(0xffad1457), //0xff26a69a),
            child: Container(
              padding: EdgeInsets.all(4.0),
              child: Text(
                'Kothopokothon',
                style: TextStyle(
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                  shadows: <Shadow>[
                    Shadow(
                        blurRadius: 18.0,
                        color: Colors.black54,
                        offset: Offset.fromDirection(120,12)
                    )
                  ]
                ),
              ),
            ),
          ),

          SizedBox(height: 50,),

          Text("Forgot your password?\n"
              "Please enter an email address below.",
            style: TextStyle(color: Colors.blue,fontSize: 20),

          ),
          SizedBox(height: 20,),

          TextFormField(
            style: simpleTextStyle(),
            controller: passwordEditingController,
            decoration: textFieldInputDecoration("Enter email"),
          ),

          SizedBox(height: 50,),

          GestureDetector(
            onTap: (){

            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [const Color(0xff007EF4), const Color(0xff2A75BC)],
                  )),
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Send",
                style: biggerTextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
