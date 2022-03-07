import 'package:flutter/material.dart';
import 'package:pizzadeeserts/pages/home_page.dart';
import 'package:pizzadeeserts/size_config/size_config.dart';
import 'package:slide_drawer/slide_drawer.dart';

class textfield extends StatelessWidget {
  const textfield({
    Key? key,
    required TextEditingController fullname,
  })  : _fullname = fullname,
        super(key: key);

  final TextEditingController _fullname;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
        padding: EdgeInsets.only(
          left: getProportionScreenWidth(20),
          right: getProportionScreenWidth(20),
          top: getProportionScreenHeight(10),
        ),
        child: TextFormField(
          validator: (v) {
            if (v == null) {
              return "Shoudn't be empty";
            }
          },
          controller: _fullname,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                getProportionScreenHeight(12),
              ),
            ),
          ),
        ));
  }
}

class loginRow extends StatelessWidget {
  const loginRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(
            left: getProportionScreenWidth(50),
            top: getProportionScreenHeight(20)),
        child: Row(
          children: [
            const Text(
              "Already have an account?",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: getProportionScreenWidth(10),
            ),
            const Text("Sign In")
          ],
        ),
      ),
      onTap: () async{
      await  Navigator.pushNamed(context, "/login",);
      },
    );
  }
}


class ChiziqchaSignin extends StatelessWidget {
  const ChiziqchaSignin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: getProportionScreenHeight(4),
          width: getProportionScreenWidth(100),
          color: Colors.black,
        ),
        const Text("sign in with"),
        Container(
          height: getProportionScreenHeight(4),
          width: getProportionScreenWidth(100),
          color: Colors.black,
        )
      ],
    );
  }
}
