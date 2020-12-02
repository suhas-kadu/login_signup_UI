import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/views/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

TextEditingController _username = new TextEditingController();
TextEditingController _email = new TextEditingController();
TextEditingController _password = new TextEditingController();

Future<void> signUp() async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _email.text,
      password: _password.text,
    );
} catch (e) {
    print(e);
  }
Fluttertoast.showToast(
        msg: "Account created",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,        
        fontSize: 16.0);  
}


class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      body: SingleChildScrollView(
              child: Container(        
        height: MediaQuery.of(context).size.height, 
        width: MediaQuery.of(context).size.width  ,               
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
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
                child: Text("Sign up to continue", style: TextStyle(color: Colors.white60),),),
              Container(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              decoration: BoxDecoration(
              
              borderRadius: BorderRadius.circular(40),
            ),
            child: TextField(   
              keyboardType: TextInputType.text,                 
              controller: _username,
              decoration: InputDecoration(
                icon: Icon(Icons.person, color: Colors.yellow),
                labelText: "UserName",
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _email,
              decoration: InputDecoration(                
                icon: Icon(Icons.email, color: Colors.yellow),
                labelText: "Email",
                enabledBorder: InputBorder.none
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Container(
            clipBehavior: Clip.none,
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            decoration: BoxDecoration(              
              borderRadius: BorderRadius.circular(40),
            ),
            child: TextField(              
              controller: _password,
              decoration: InputDecoration(
                icon: Icon(Icons.lock, color: Colors.yellow,),
                labelText: "Password",
                border: InputBorder.none,
                
              ),
              obscureText: true,
            ),
          ),
          SizedBox(
            height: 70,
          ),
          InkWell(          
            onTap: () { signUp();
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
               child:Text("Sign Up",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),                        
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ? "),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                  child: Text("Login here", style: TextStyle(color: Colors.purpleAccent[700]),
              ),
              ),
              ],
            ),
          )
        ],
        ),
        ),
      ),
          );
  }
}
