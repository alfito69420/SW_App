import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    //  Controllers
    final txtUserController = TextEditingController();
    final txtpWDController = TextEditingController();

    //  Text Forms
    final txtUser = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: txtUserController,
    );
    
    final txtPwd = TextFormField(
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      controller: txtpWDController,
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          
            image:
                DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/sw.jpg"))),
                child: Stack(
                  alignment: Alignment.center,
                  children:[
                    Positioned(
                      top: 100,
                      child: Image.asset("assets/logo-StarWars.png", width: 100,))
                  ]
                ),
      ),
    );
  }
}
