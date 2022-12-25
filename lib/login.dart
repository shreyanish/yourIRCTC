import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(
            left: 20, right: 20, top: size.height * 0.2, bottom: size.height * 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.train,
                  color: Colors.blueAccent,
                  size: 80,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Your",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      ),),
                    Text("IRCTC",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: ElevatedButton( onPressed: () {
                      AuthService().signInWithGoogle();
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent
                        ),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.g_mobiledata_rounded),
                            SizedBox(width: 5),
                            Text("Google Sign In",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            )
                          ],
                        )
                    ),
                  ),
                ),

          ],
        ),
      ),
    );
  }
}