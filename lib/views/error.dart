import 'package:flutter/material.dart';
import 'package:kothopokothonn/views/signin.dart';

class error extends StatefulWidget {
  @override
  _errorState createState() => _errorState();
}

class _errorState extends State<error> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox( height: 200.0,),
            Card(
              margin: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: ListTile(
                onTap:(){
                  Function toggleView;
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => SignIn(toggleView)
                  ));
                },
                title: Text("Wrong Email or Password. click to go to log in page", style: TextStyle(fontSize: 15,color: Colors.blue),),
                leading: Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
