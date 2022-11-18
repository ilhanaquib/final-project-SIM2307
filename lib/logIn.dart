import 'package:flutter/material.dart';
import 'profile.dart';
import 'main.dart';

class logIn extends StatefulWidget {
  const logIn({Key? key}) : super(key: key);

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF802424),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/image/upmarket logo.png', scale: 5,),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              Container(
                child: Card(
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      Text('Log In', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'username / e-mail'
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        autocorrect: false,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'password'
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      Row(children: [
                        TextButton(onPressed: (){
                          setState(() {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (BuildContext context) {
                              return homeScreen();
                            }));
                          });
                        }, child: Text('Log in')),
                        TextButton(onPressed: (){}, child: Text('Not a member? Sign up now')),
                        TextButton(onPressed: (){}, child: Text('Use UPM-ID')),
                      ],),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
