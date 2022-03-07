import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:pizzadeeserts/const/signup_fuctions.dart';
import 'package:pizzadeeserts/data/data_base.dart';
import 'package:pizzadeeserts/provider/neumorphism_provider.dart';
import 'package:pizzadeeserts/size_config/size_config.dart';
import 'package:provider/provider.dart';
import 'package:slide_drawer/slide_drawer.dart';

class HomePAge extends StatelessWidget {
  const HomePAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      drawer: slideDrawer(context),
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        shadowColor: Colors.white,
        backgroundColor: const Color(0XFFE9F3FC),
        title: const ListTile(
          title: Text("Select Location"),
          subtitle: Text("Get accurate pricing and menu listing"),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: getProportionScreenHeight(20),
                    left: getProportionScreenHeight(25)),
                child: SizedBox(
                  height: getProportionScreenHeight(64),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: getProportionScreenWidth(30),
                    ),
                    itemBuilder: ((context, index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: getProportionScreenHeight(74),
                        width: getProportionScreenWidth(74),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(rasm[index].toString())),
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: context
                                    .watch<NeuMorphismProvider>()
                                    .notifier[index]
                                ? [
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
                                  ]
                                : null),
                      );
                    }),
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                  ),
                ),
              ),
              DefaultTabController(
                length: 4,
                child: TabBar(
                  onTap: (val) {
                    context.read<NeuMorphismProvider>().ozgartir(val);
                  },
                  indicatorColor: const Color(0XFFE9F3FC),
                  isScrollable: false,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(
                      text: "Delivery",
                    ),
                    Tab(
                      text: "Pickup",
                    ),
                    Tab(
                      text: "Curbside",
                    ),
                    Tab(
                      text: "Dine-in",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionScreenHeight(200),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(
                        getProportionScreenHeight(10.0),
                      ),
                      child: InkWell(
                        child: Container(
                          height: getProportionScreenHeight(200),
                          width: getProportionScreenWidth(300),
                          decoration: BoxDecoration(
                            borderRadius: border(),
                            color: const Color(0XFFE9F3FC),
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
                          child: Container(
                            height: getProportionScreenHeight(180),
                            width: getProportionScreenWidth(280),
                            margin:
                                EdgeInsets.all(getProportionScreenHeight(10.0)),
                            child: ClipRRect(
                              child: CachedNetworkImage(
                                imageUrl: restoran[index]["rasm"].toString(),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: border(),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, "/info",
                              arguments: restoran[index]);
                        },
                      ),
                    );
                  },
                  itemCount: restoran.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: getProportionScreenHeight(15.0),
              ),
              exploreMenu(),
              SizedBox(
                height: getProportionScreenHeight(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0XFFFEFFFC),
                      boxShadow: [boxsahdowww()],
                      borderRadius: radiusOnly(),
                    ),
                    height: getProportionScreenHeight(150),
                    width: getProportionScreenWidth(100),
                    child: Stack(
                      children: [
                        Positioned(
                          left: getProportionScreenWidth(10),
                          right: getProportionScreenWidth(10),
                          top: getProportionScreenHeight(5),
                          child: Container(
                            height: getProportionScreenHeight(84),
                            width: getProportionScreenWidth(84),
                            decoration: BoxDecoration(
                              boxShadow: [boxsahdowww()],
                              color: color(),
                              borderRadius: BorderRadius.circular(
                                getProportionScreenHeight(50),
                              ),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/ex.jpg"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Positioned(
                          left: getProportionScreenWidth(15),
                          right: getProportionScreenWidth(5),
                          bottom: getProportionScreenHeight(20),
                          child: const AutoSizeText("Exclusive"),
                        ),
                        Positioned(
                            bottom: getProportionScreenHeight(0),
                            child: Container(
                              height: getProportionScreenHeight(5),
                              width: getProportionScreenWidth(100),
                              color: Colors.amber,
                            ))
                      ],
                    ),
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0XFFFEFFFC),
                          borderRadius: radiusOnly(),
                          boxShadow: [boxsahdowww()]),
                      height: getProportionScreenHeight(150),
                      width: getProportionScreenWidth(100),
                      child: Stack(
                        children: [
                          Positioned(
                            left: getProportionScreenWidth(10),
                            right: getProportionScreenWidth(10),
                            top: getProportionScreenHeight(5),
                            child: Container(
                              height: getProportionScreenHeight(84),
                              width: getProportionScreenWidth(84),
                              decoration: BoxDecoration(
                                  boxShadow: [boxsahdowww()],
                                  color: color(),
                                  borderRadius: BorderRadius.circular(
                                    getProportionScreenHeight(50),
                                  ),
                                  image: const DecorationImage(
                                      image:
                                          AssetImage("assets/images/p3.png"))),
                            ),
                          ),
                          Positioned(
                            left: getProportionScreenWidth(30),
                            right: getProportionScreenWidth(20),
                            bottom: getProportionScreenHeight(20),
                            child: const AutoSizeText("Pizza"),
                          ),
                          Positioned(
                            bottom: getProportionScreenHeight(0),
                            child: Container(
                              height: getProportionScreenHeight(5),
                              width: getProportionScreenWidth(100),
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/pizza");
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0XFFFEFFFC),
                        borderRadius: radiusOnly(),
                        boxShadow: [boxsahdowww()]),
                    height: getProportionScreenHeight(150),
                    width: getProportionScreenWidth(100),
                    child: Stack(
                      children: [
                        Positioned(
                          left: getProportionScreenWidth(10),
                          right: getProportionScreenWidth(10),
                          top: getProportionScreenHeight(5),
                          child: Container(
                            height: getProportionScreenHeight(84),
                            width: getProportionScreenWidth(84),
                            decoration: BoxDecoration(
                                boxShadow: [boxsahdowww()],
                                color: color(),
                                borderRadius: BorderRadius.circular(
                                  getProportionScreenHeight(50),
                                ),
                                image: const DecorationImage(
                                    image: AssetImage("assets/images/st7.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Positioned(
                          left: getProportionScreenWidth(20),
                          right: getProportionScreenWidth(10),
                          bottom: getProportionScreenHeight(20),
                          child: const AutoSizeText("Starters"),
                        ),
                        Positioned(
                          bottom: getProportionScreenHeight(0),
                          child: Container(
                            height: getProportionScreenHeight(5),
                            width: getProportionScreenWidth(100),
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionScreenHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0XFFFEFFFC),
                      boxShadow: [boxsahdowww()],
                      borderRadius: radiusOnly(),
                    ),
                    height: getProportionScreenHeight(150),
                    width: getProportionScreenWidth(100),
                    child: Stack(
                      children: [
                        Positioned(
                          left: getProportionScreenWidth(10),
                          right: getProportionScreenWidth(10),
                          top: getProportionScreenHeight(5),
                          child: Container(
                            height: getProportionScreenHeight(84),
                            width: getProportionScreenWidth(84),
                            decoration: BoxDecoration(
                                boxShadow: [boxsahdowww()],
                                color: color(),
                                borderRadius: BorderRadius.circular(
                                  getProportionScreenHeight(50),
                                ),
                                image: const DecorationImage(
                                    image: AssetImage("assets/images/ps.png"))),
                          ),
                        ),
                        Positioned(
                          left: getProportionScreenWidth(20),
                          right: getProportionScreenWidth(10),
                          bottom: getProportionScreenHeight(20),
                          child: const AutoSizeText("Pasta"),
                        ),
                        Positioned(
                            bottom: getProportionScreenHeight(0),
                            child: Container(
                              height: getProportionScreenHeight(5),
                              width: getProportionScreenWidth(100),
                              color: Colors.amber,
                            ))
                      ],
                    ),
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0XFFFEFFFC),
                          borderRadius: radiusOnly(),
                          boxShadow: [boxsahdowww()]),
                      height: getProportionScreenHeight(150),
                      width: getProportionScreenWidth(100),
                      child: Stack(
                        children: [
                          Positioned(
                            left: getProportionScreenWidth(10),
                            right: getProportionScreenWidth(10),
                            top: getProportionScreenHeight(5),
                            child: Container(
                              height: getProportionScreenHeight(84),
                              width: getProportionScreenWidth(84),
                              decoration: BoxDecoration(
                                  boxShadow: [boxShad()],
                                  color: color(),
                                  borderRadius: BorderRadius.circular(
                                    getProportionScreenHeight(50),
                                  ),
                                  image: const DecorationImage(
                                      image: AssetImage("assets/images/dr.png"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Positioned(
                            left: getProportionScreenWidth(20),
                            right: getProportionScreenWidth(10),
                            bottom: getProportionScreenHeight(20),
                            child: const AutoSizeText("Drinks"),
                          ),
                          Positioned(
                            bottom: getProportionScreenHeight(0),
                            child: Container(
                              height: getProportionScreenHeight(5),
                              width: getProportionScreenWidth(100),
                              color: Colors.amber,
                            ),
                          )
                        ],
                      ),
                    ),
                    onDoubleTap: () {},
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0XFFFEFFFC),
                          borderRadius: radiusOnly(),
                          boxShadow: [boxsahdowww()]),
                      height: getProportionScreenHeight(150),
                      width: getProportionScreenWidth(100),
                      child: Stack(
                        children: [
                          Positioned(
                            left: getProportionScreenWidth(10),
                            right: getProportionScreenWidth(10),
                            top: getProportionScreenHeight(5),
                            child: Container(
                              height: getProportionScreenHeight(84),
                              width: getProportionScreenWidth(84),
                              decoration: BoxDecoration(
                                  boxShadow: [boxShad()],
                                  color: color(),
                                  borderRadius: BorderRadius.circular(
                                    getProportionScreenHeight(50),
                                  ),
                                  image: const DecorationImage(
                                      image: AssetImage("assets/images/ds.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Positioned(
                            left: getProportionScreenWidth(20),
                            right: getProportionScreenWidth(10),
                            bottom: getProportionScreenHeight(20),
                            child: const AutoSizeText("Desserts"),
                          ),
                          Positioned(
                            bottom: getProportionScreenHeight(0),
                            child: Container(
                              height: getProportionScreenHeight(5),
                              width: getProportionScreenWidth(100),
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () async {
                      Navigator.pushNamed(context, "/desert");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: getProportionScreenHeight(20),
              ),
              Container(
                height: getProportionScreenHeight(150),
                width: getProportionScreenHeight(350),
                decoration: BoxDecoration(
                    borderRadius: border(),
                    color: const Color(0XFFE9F3FC),
                    boxShadow: [
                      boxShad(),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 10,
                          spreadRadius: 1)
                    ],
                    image: const DecorationImage(
                        image: AssetImage("assets/images/buy.png"),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: getProportionScreenHeight(10),
              ),
              topPicks(),
              SizedBox(
                height: getProportionScreenHeight(15),
              ),
              SizedBox(
                height: getProportionScreenHeight(160),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: getProportionScreenHeight(250),
                      crossAxisCount: 1),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(left: getProportionScreenWidth(25)),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: border(),
                            color: const Color(0XFFE9F3FC),
                            boxShadow: [
                              boxShad(),
                              const BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-4, -4),
                                  blurRadius: 10,
                                  spreadRadius: 1)
                            ],
                            image: const DecorationImage(
                                image: AssetImage("assets/images/piz.png"),
                                fit: BoxFit.fill)),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: getProportionScreenHeight(20),
              )
            ],
          ),
        ),
      ),
    );
  }

  SlideDrawer slideDrawer(BuildContext context) {
    return SlideDrawer(
      child: const HomePAge(),
      duration: const Duration(seconds: 3),
      items: [
        MenuItem(
          'Home',
          icon: Icons.home,
          onTap: () {
            Navigator.pushNamed(context, "/home");
          },
        ),
        MenuItem('Project', icon: Icons.rss_feed, onTap: () {}),
        MenuItem('My Bascet', icon: Icons.favorite_border, onTap: () {
          Navigator.pushNamed(context, "/bascet");
        }),
        MenuItem('Profile', icon: Icons.person_outline, onTap: () {}),
        MenuItem('Setting', icon: Icons.settings, onTap: () {}),
        MenuItem(
          'Log out',
          icon: Icons.logout_outlined,
          onTap: () {
            Dialogs.materialDialog(
                msg: 'Are you sure to log out?',
                title: "Log Out",
                color: Colors.white,
                context: context,
                actions: [
                  IconsOutlineButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Cancel',
                    iconData: Icons.cancel_outlined,
                    textStyle: const TextStyle(color: Colors.grey),
                    iconColor: Colors.grey,
                  ),
                  IconsButton(
                    onPressed: () {
                      Signup.logOut(context);
                    },
                    text: 'Log Out',
                    iconData: Icons.logout,
                    color: Colors.red,
                    textStyle: const TextStyle(color: Colors.white),
                    iconColor: Colors.white,
                  ),
                ]);
          },
        ),
      ],
    );
  }

  Row topPicks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: getProportionScreenWidth(15.0)),
          child: const Text("Top picks"),
        ),
        Padding(
          padding: EdgeInsets.only(right: getProportionScreenWidth(15.0)),
          child: Row(
            children: const [Text("View all"), Icon(Icons.arrow_forward_ios)],
          ),
        ),
      ],
    );
  }

  BoxShadow boxShad() {
    return BoxShadow(
        color: Colors.grey.shade500,
        offset: const Offset(4, 4),
        blurRadius: 10,
        spreadRadius: 1);
  }

  Color color() => const Color(0XFFE9F3FC);

  BorderRadius radiusOnly() {
    return BorderRadius.only(
      topLeft: Radius.circular(
        getProportionScreenHeight(50),
      ),
    );
  }

  Row exploreMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: getProportionScreenWidth(15.0)),
          child: const Text("Explore Menu"),
        ),
        Padding(
          padding: EdgeInsets.only(right: getProportionScreenWidth(15.0)),
          child: Row(
            children: const [Text("View all"), Icon(Icons.arrow_forward_ios)],
          ),
        ),
      ],
    );
  }

  BorderRadius border() {
    return BorderRadius.circular(
      getProportionScreenHeight(12.0),
    );
  }

  BoxShadow boxsahdowww() {
    return BoxShadow(
        color: Colors.grey.shade500,
        offset: const Offset(4, 4),
        blurRadius: 10,
        spreadRadius: 1);
  }

  BoxShadow boxshadow() {
    return BoxShadow(
        color: Colors.grey.shade500,
        offset: const Offset(4, 4),
        blurRadius: 10,
        spreadRadius: 1);
  }
}
