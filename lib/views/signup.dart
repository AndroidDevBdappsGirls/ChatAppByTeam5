import 'package:kothopokothonn/helper/helperfunctions.dart';
import 'package:kothopokothonn/helper/theme.dart';
import 'package:kothopokothonn/services/auth.dart';
import 'package:kothopokothonn/services/database.dart';
import 'package:kothopokothonn/views/chatrooms.dart';
import 'package:kothopokothonn/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp(this.toggleView);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();

  AuthService authService = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  singUp() async {

    if(formKey.currentState.validate()){
      setState(() {

        isLoading = true;
      });

      await authService.signUpWithEmailAndPassword(emailEditingController.text,
          passwordEditingController.text).then((result){
            if(result != null){

              Map<String,String> userDataMap = {
                "userName" : usernameEditingController.text,
                "userEmail" : emailEditingController.text
              };

              databaseMethods.addUserInfo(userDataMap);

              HelperFunctions.saveUserLoggedInSharedPreference(true);
              HelperFunctions.saveUserNameSharedPreference(usernameEditingController.text);
              HelperFunctions.saveUserEmailSharedPreference(emailEditingController.text);

              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => ChatRoom()
              ));
            }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: appBarMain(context),
      body: isLoading ? Container(child: Center(child: CircularProgressIndicator(),),) :
      Container(
      child:Container(
      //padding: EdgeInsets.symmetric(vertical: 50),
      constraints: BoxConstraints.expand(),
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/images/chat.jpg"),
    fit: BoxFit.cover, )),
    padding: EdgeInsets.symmetric(horizontal: 50),
    child: Column(
    children: [
    Spacer(),
    Form(
    key: formKey,
    child: Column(
    children: [
    Shimmer.fromColors(
    baseColor: Color(0xffd81b60),
    highlightColor: Color(0xffad1457), //0xff26a69a),
    child: Container(
    padding: EdgeInsets.all(4.0),
    child: Text(
    'Kothopokothon',
    style: TextStyle(
    fontSize: 40,
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
                  TextFormField(
                    style: simpleTextStyle1(),
                    controller: usernameEditingController,
                    validator: (val){
                      return val.isEmpty || val.length < 3 ? "Enter Username 3+ characters" : null;
                    },
                    decoration: textFieldInputDecoration1("username"),
                  ),
                  TextFormField(
                    controller: emailEditingController,
                    style: simpleTextStyle1(),
                    validator: (val){
                      return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                          null : "Enter correct email";
                    },
                    decoration: textFieldInputDecoration1("email"),
                  ),
                  TextFormField(
                    obscureText: true,
                    style: simpleTextStyle1(),
                    decoration: textFieldInputDecoration1("password"),
                    controller: passwordEditingController,
                    validator:  (val){
                      return val.length < 6 ? "Enter Password 6+ characters" : null;
                    },

                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: (){
                singUp();
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
                  "Sign Up",
                  style: biggerTextStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(vertical: 16),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(30), color: Colors.white),
            //   width: MediaQuery.of(context).size.width,
            //   child: Text(
            //     "Sign Up with Google",
            //     style: TextStyle(fontSize: 17, color: CustomTheme.textColor),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: simpleTextStyle1(),
                ),
                GestureDetector(
                  onTap: () {
                    widget.toggleView();
                  },
                  child: Text(
                    "SignIn now",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 180,
            )
          ],
        ),
      ),
      )
    );
    ;
  }
}
