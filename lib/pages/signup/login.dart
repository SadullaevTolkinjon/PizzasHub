import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pizzadeeserts/const/constant.dart';
import 'package:pizzadeeserts/const/signup_fuctions.dart';
import 'package:pizzadeeserts/core/widgets.dart';
import 'package:pizzadeeserts/pages/home_page.dart';
import 'package:pizzadeeserts/size_config/size_config.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/burger2.jpg"),
                  fit: BoxFit.fitHeight,
                  opacity: 0.4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: getProportionScreenHeight(100),
                    left: getProportionScreenWidth(20),
                  ),
                  child: SizedBox(
                    height: getProportionScreenHeight(100),
                    width: getProportionScreenWidth(250),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: getProportionScreenHeight(30),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: getProportionScreenWidth(20),
                    top: getProportionScreenHeight(20),
                  ),
                  child: const Text(
                    "E-mail",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                textfield(fullname: _emailController),
                Padding(
                  padding: EdgeInsets.only(
                    left: getProportionScreenWidth(20),
                    top: getProportionScreenHeight(20),
                  ),
                  child: const Text(
                    "Password",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                textfield(
                  fullname: _passwordController,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: getProportionScreenWidth(30),
                    top: getProportionScreenHeight(40),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0XFFE9F3FC),
                      minimumSize: Size(
                        getProportionScreenWidth(300),
                        getProportionScreenHeight(50),
                      ),
                    ),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionScreenHeight(20)),
                    ),
                    onPressed: () async {
                      await Signup.signInAccount(
                              _emailController.text, _passwordController.text)
                          .then((value) {
                        if (value != null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePAge(),
                            ),
                          );
                        } else {
                          Constants.snackbar(
                              context, "E-mail or password error");
                        }
                      });
                    },
                  ),
                ),
                const loginRow(),
                Padding(
                  padding: EdgeInsets.only(top: getProportionScreenHeight(40)),
                  child: const ChiziqchaSignin(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getProportionScreenHeight(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: Container(
                          height: getProportionScreenHeight(60),
                          width: getProportionScreenWidth(150),
                          decoration: BoxDecoration(
                              borderRadius: border(),
                              color: const Color(0XFFE9F3FC)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                LineIcons.facebook,
                                size: getProportionScreenHeight(35),
                                color: Colors.blue,
                              ),
                              Text(
                                "Facebook",
                                style: TextStyle(
                                    fontSize: getProportionScreenHeight(18),
                                    color: Colors.blue),
                              )
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                          height: getProportionScreenHeight(60),
                          width: getProportionScreenWidth(150),
                          decoration: BoxDecoration(
                              borderRadius: border(),
                              color: const Color(0XFFE9F3FC)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                LineIcons.googleLogo,
                                size: getProportionScreenHeight(35),
                                color: Colors.green,
                              ),
                              Text(
                                "Google",
                                style: TextStyle(
                                    fontSize: getProportionScreenHeight(18),
                                    color: Colors.green),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Signup.signInWithGoogle();
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BorderRadius border() {
    return BorderRadius.circular(
      getProportionScreenHeight(20.0),
    );
  }
}
