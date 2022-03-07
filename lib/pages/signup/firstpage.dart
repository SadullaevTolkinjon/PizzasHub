import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pizzadeeserts/size_config/size_config.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0XFFE9F3FC),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: getProportionScreenWidth(140),
                  top: getProportionScreenHeight(300)),
              child: GestureDetector(
                child: Container(
                  height: getProportionScreenHeight(100),
                  width: getProportionScreenWidth(100),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("assets/images/piza.jpeg"),
                        fit: BoxFit.cover),
                    color: const Color(0XFFE9F3FC),
                    borderRadius: BorderRadius.circular(
                      getProportionScreenHeight(12),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          offset: const Offset(4, 4),
                          blurRadius: 10,
                          spreadRadius: 1),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 10,
                          spreadRadius: 1)
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/signup", (route) => false);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: getProportionScreenWidth(140),
                  top: getProportionScreenHeight(20)),
              child: SizedBox(
                height: getProportionScreenHeight(50),
                width: getProportionScreenWidth(250),
                child: AutoSizeText(
                  "Food Hub",
                  style: TextStyle(fontSize: getProportionScreenHeight(20)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
