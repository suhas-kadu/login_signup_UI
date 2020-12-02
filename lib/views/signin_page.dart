import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/views/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInPage extends StatelessWidget {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  Future<void> signIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
    } catch (e) {
      print(e);
    }
    Fluttertoast.showToast(
        msg: "Signed In Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,        
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(  
                padding: EdgeInsets.symmetric(vertical: 8.0),            
                child:Text("Welcome!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, ),)
              ),
              Container(
                padding: EdgeInsets.only(bottom: 32.0),
                child: Text("Login to continue", style: TextStyle(color: Colors.white60),),),
              
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                //border: Border.all(),
                //borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  icon: Icon(Icons.email, color: Colors.yellow,),
                  border:InputBorder.none,
                  labelText: "Email",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              clipBehavior: Clip.none,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                //border: Border.all(),
                //borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: _password,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock, color: Colors.yellow,),
                  hintText: "Enter your password",
                  border: InputBorder.none,
                  labelText: "Password",                  
                ),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
             InkWell(          
            onTap: () {
              signIn();
            Navigator.pop(context);
            },
            child: Center(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width  ,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 22.0),
                decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(10),
                ),
               child:Text("LogIn",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),                        
              ),
            ),
          ),
            Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account ? "),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  child: Text("Create here", style: TextStyle(color: Colors.purpleAccent[700]),
              ),
              ),
              ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
