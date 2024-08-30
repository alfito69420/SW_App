import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    //  Controllers
    final txtUserController = TextEditingController();
    final txtpWDController = TextEditingController();

    //  Text Forms
    final txtUser = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: txtUserController,
      decoration: const InputDecoration(
          prefixIcon: Icon(
        Icons.person,
        color: Color.fromARGB(255, 255, 85, 7),
      )),
    );

    final txtPwd = TextFormField(
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      controller: txtpWDController,
      decoration: const InputDecoration(
          prefixIcon: Icon(
        Icons.password,
        color: Color.fromARGB(255, 255, 85, 7),
      )),
    );

    final ctnCredentials = Positioned(
        bottom: 90,
        child: Container(
          width: MediaQuery.of(context).size.width * .9,
          // margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(10)),
          child: ListView(
            shrinkWrap: true,
            children: [txtUser, txtPwd],
          ),
        ));

    final btnLogin = Positioned(
      bottom: 40,
      width: MediaQuery.of(context).size.width * .9,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.amberAccent),
        onPressed: () {
          isLoading = true;
          setState(() {});
          Future.delayed(const Duration(milliseconds: 4000))
              .then((value) => {isLoading = false,
              setState(() {}),
              Navigator.pushNamed(context, "/home")
              
              });
        },
        child: const Text('Validar usuario...'),
      ),
    );

    final gifLoading =
        Positioned(top: 0.5, child: Image.asset("assets/loading.gif"));

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("assets/sw_mando.jpg"))),
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
              top: 10,
              child: Image.asset(
                "assets/sw_logo_black.png",
                width: 200,
              )),
          ctnCredentials,
          btnLogin,
          isLoading ? gifLoading : Container()
        ]),
      ),
    );
  }
}
