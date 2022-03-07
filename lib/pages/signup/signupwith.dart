import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pizzadeeserts/const/signup_fuctions.dart';
import 'package:pizzadeeserts/core/widgets.dart';
import 'package:pizzadeeserts/size_config/size_config.dart';
import 'package:line_icons/line_icons.dart';

class SignUpWith extends StatelessWidget {
  const SignUpWith({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.4,
                image: AssetImage("assets/images/food2.jpeg"),
                fit: BoxFit.fitHeight),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
                height: 0,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: getProportionScreenHeight(30),
                    left: getProportionScreenWidth(20)),
                child: SizedBox(
                  child: AutoSizeText(
                    "Welcome to Food Hub",
                    style: TextStyle(
                      fontSize: getProportionScreenHeight(30),
                      color: const Color(0XFFFE724C),
                    ),
                  ),
                  height: getProportionScreenHeight(110),
                  width: getProportionScreenHeight(250),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: getProportionScreenWidth(20)),
                child: SizedBox(
                  height: getProportionScreenHeight(50),
                  width: getProportionScreenWidth(250),
                  child: AutoSizeText(
                    "Your favorite foods delivered fast at your door",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: getProportionScreenHeight(16)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: getProportionScreenHeight(350),
                    bottom: getProportionScreenHeight(20)),
                child: ChiziqchaSignin(),
              ),
              Row(
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
                    onTap: () async {
                      await Signup.signInWithGoogle().then((value) {
                        Navigator.pushNamed(context, "/home");
                      });
                    },
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: getProportionScreenHeight(20),
                    left: getProportionScreenWidth(30)),
                child: InkWell(
                  child: Container(
                    height: getProportionScreenHeight(60),
                    width: getProportionScreenWidth(300),
                    decoration: BoxDecoration(
                      borderRadius: border(),
                      border: Border.all(color: Colors.grey),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: AutoSizeText("Start with email or phone",
                          style: TextStyle(
                              fontSize: getProportionScreenHeight(17))),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/email");
                  },
                ),
              ),
              const loginRow(),
            ],
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
