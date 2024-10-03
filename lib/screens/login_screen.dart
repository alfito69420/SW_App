import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
    final defaultColorScheme = Theme.of(context).colorScheme;

    //  Controllers
    final txtUserController = TextEditingController();
    final txtpWDController = TextEditingController();

    //  Text Forms
    final txtUser = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: txtUserController,
      decoration: InputDecoration(
          prefixIcon: Icon(
        Icons.person,
        color: defaultColorScheme.onPrimary,
      )),
    );

    final txtPwd = TextFormField(
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      controller: txtpWDController,
      decoration: InputDecoration(
          prefixIcon: Icon(
        Icons.password,
        color: defaultColorScheme.onPrimary,
      )),
    );

    final ctnCredentials = Positioned(
        bottom: 90,
        child: Container(
          width: MediaQuery.of(context).size.width * .9,
          // margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: defaultColorScheme.primary,
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
        style: ElevatedButton.styleFrom(
            backgroundColor: defaultColorScheme.primary),
        onPressed: () {
          isLoading = true;
          setState(() {});
          Future.delayed(const Duration(milliseconds: 1000)).then((value) => {
                isLoading = false,
                setState(() {}),
                Navigator.pushNamed(context, "/onboarding")
              });
        },
        child: Text(
          'Validar usuario...',
          style: TextStyle(color: defaultColorScheme.onPrimary),
        ),
      ),
    );

    final gifLoading = Positioned(
        bottom: 250, child: Lottie.asset("assets/lottie/22.json", width: 150));

    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Positioned.fill(
          child: Lottie.asset(
            "assets/lottie/sw_background.json",
            repeat: true,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 10,
          child: Image.asset(
            "assets/sw_white_logo.webp",
            width: 200,
          ),
        ),
        ctnCredentials,
        btnLogin,
        isLoading ? gifLoading : Container(),
      ]),
    );
  }
}
