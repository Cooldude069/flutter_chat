import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/utils/auth_service.dart';
import 'package:flutter_chat/utils/gauth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 10, 11, 11),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const LogInText(),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Log In with one of the following options.",
                style: TextStyle(
                  // rgba(110,111,111,255)
                  color: Color.fromARGB(255, 110, 111, 111),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const LogInButtons(),
            const SizedBox(
              height: 40,
            ),
            TextFields(emailController, passwordController),
          ],
        ),
      ),
    );
  }
}

class LogInText extends StatelessWidget {
  const LogInText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 50,
            height: 50,
            child: InkWell(
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName("/"));
              },
              child: Container(
                child: const Center(
                  child: FaIcon(FontAwesomeIcons.angleLeft),
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 10, 11, 11),
                  borderRadius: BorderRadius.circular(15),
                  // border: Border.all(
                  //   color: Color.fromARGB(255, 87, 84, 84),
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.5,
                      blurRadius: 3,
                      // offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Log In",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class LogInButtons extends StatelessWidget {
  const LogInButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: screenWidth * 40 / 100,
          height: 60,
          child: GestureDetector(
            onTap: () async {
              final prov = Provider.of<GAuthService>(context, listen: false);
              bool? f = await prov.googleLogIn();
              if (f == false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.red,
                    elevation: 20,
                    content: Text(
                      "This account doesn't exist. Please Sign Up instead",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              }
            },
            child: Container(
              child: const Center(
                child: FaIcon(FontAwesomeIcons.google),
              ),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(15),
                // border: Border.all(
                //   color: Color.fromARGB(255, 87, 84, 84),
                // ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 3,
                    // offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: screenWidth * 40 / 100,
          height: 60,
          child: Container(
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.apple,
                size: 30,
              ),
            ),
            decoration: BoxDecoration(
              // rgba(22,23,22,255)
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(15),
              // border: Border.all(
              //   color: Color.fromARGB(255, 87, 84, 84),
              // ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  // offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class TextFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const TextFields(this.emailController, this.passwordController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            "Email",
            style: TextStyle(
              // color: Color.fromARGB(255, 110, 111, 111),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Enter your Email",
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  // rgba(120,53,106,255)
                  color: Color.fromARGB(255, 120, 53, 106),
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  // rgba(120,53,106,255)
                  color: Colors.grey.withOpacity(0.5),
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text(
            "Password",
            style: TextStyle(
              // color: Color.fromARGB(255, 110, 111, 111),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter your password",
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  // rgba(120,53,106,255)
                  color: Color.fromARGB(255, 120, 53, 106),
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  // rgba(120,53,106,255)
                  color: Colors.grey.withOpacity(0.5),
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        GestureDetector(
          onTap: () {
            context
                .read<AuthService>()
                .signIn(
                    email: emailController.text,
                    password: passwordController.text)
                .then((err) {
              if (err != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.deepPurple,
                    content: Text(
                      err,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                );
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Container(
              width: double.infinity,
              height: 60,
              child: const Center(
                child: Text(
                  "Log in",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                // rgba(182,24,224,255)
                // rgba(215,41,168,255)
                // gradient: const LinearGradient(
                //   colors: [
                //     Color.fromARGB(255, 182, 24, 224),
                //     Color.fromARGB(255, 215, 41, 168),
                //   ],
                // ),
                color: const Color.fromARGB(255, 60, 60, 60),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.blueAccent,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: RichText(
            text: TextSpan(
                text: "Don't have an account? ",
                style: const TextStyle(
                  color: Color.fromARGB(255, 110, 111, 111),
                ),
                children: [
                  TextSpan(
                    text: " Sign Up",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        debugPrint("Sign Up page clicked");
                        Navigator.pushNamed(context, "/signup");
                      },
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
