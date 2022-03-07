import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:pizzadeeserts/provider/boxadd_provider.dart';
import 'package:pizzadeeserts/provider/favorite_provider.dart';
import 'package:pizzadeeserts/size_config/size_config.dart';
import 'package:provider/src/provider.dart';

class InfoPAge extends StatelessWidget {
  var data;
  InfoPAge({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: getProportionScreenHeight(220),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: getProportionScreenHeight(220),
                width: getProportionScreenWidth(300),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          CachedNetworkImageProvider(data["rasm"].toString()),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: const Text(
              "Explore Menu",
              style: TextStyle(color: Color(0XFFE9F3FC)),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              )
            ],
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                margin: EdgeInsets.all(getProportionScreenHeight(10)),
                height: getProportionScreenHeight(250),
                decoration: BoxDecoration(
                  color: const Color(0XFFE9F3FC),
                  boxShadow: boxshadow,
                  borderRadius: borderAll(),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: getProportionScreenWidth(15),
                          right: getProportionScreenWidth(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            data["taom"][index].toString(),
                          ),
                          IconButton(
                            onPressed: () {
                              context
                                  .read<FavoriteProvider>()
                                  .changeFavoriteDesert(index);
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: context
                                          .watch<FavoriteProvider>()
                                          .isFavoriteDesert[index] ==
                                      false
                                  ? Colors.grey
                                  : Colors.red,
                              size: getProportionScreenHeight(28),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: getProportionScreenWidth(15),
                          right: getProportionScreenWidth(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: getProportionScreenHeight(120),
                            width: getProportionScreenWidth(200),
                            decoration: BoxDecoration(
                              boxShadow: boxshadow,
                              borderRadius: borderAll(),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      data["turlirasm"][index].toString()),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Container(
                            height: getProportionScreenHeight(120),
                            width: getProportionScreenWidth(100),
                            decoration: BoxDecoration(
                              boxShadow: boxshadow,
                              borderRadius: borderAll(),
                              image: const DecorationImage(
                                image: CachedNetworkImageProvider(
                                  "https://i.gifer.com/GvM1.gif",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: getProportionScreenWidth(20),
                          right: getProportionScreenWidth(10),
                          top: getProportionScreenHeight(10)),
                      child: SizedBox(
                        height: getProportionScreenHeight(15),
                        width: getProportionScreenWidth(300),
                        child: Text(
                          "Contains: ${data["taom"][index]}",
                          overflow: TextOverflow.ellipsis,
                          style:
                              const TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: getProportionScreenWidth(20),
                          right: getProportionScreenWidth(10),
                          top: getProportionScreenHeight(10)),
                      child: Row(
                        children: [
                          AutoSizeText("Price: ${data["narx"][index]}"),
                          SvgPicture.asset(
                            "assets/images/n1.svg",
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: getProportionScreenWidth(140)),
                            child: InkWell(
                              child: Container(
                                height: getProportionScreenHeight(25),
                                width: getProportionScreenWidth(50),
                                decoration: BoxDecoration(
                                  boxShadow: boxshadow,
                                  borderRadius: BorderRadius.circular(
                                      getProportionScreenHeight(8)),
                                  color: Colors.red,
                                ),
                                child: const Center(
                                  child: Text(
                                    "Add",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Dialogs.materialDialog(
                                    msg: 'Are you sure to Save this?',
                                    title: "Add to bascet",
                                    color: Colors.white,
                                    context: context,
                                    actions: [
                                      IconsOutlineButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        text: 'Cancel',
                                        iconData: Icons.cancel_outlined,
                                        textStyle:
                                            const TextStyle(color: Colors.grey),
                                        iconColor: Colors.grey,
                                      ),
                                      IconsButton(
                                        onPressed: () {
                                          context
                                              .read<BoxAddtoBascet>()
                                              .malumotQosh(data[index]);
                                        },
                                        text: 'Save',
                                        iconData: Icons.save,
                                        color: Colors.green,
                                        textStyle: const TextStyle(
                                            color: Colors.white),
                                        iconColor: Colors.white,
                                      ),
                                    ]);
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }, childCount: data["narx"].length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: getProportionScreenHeight(5),
              mainAxisExtent: getProportionScreenHeight(250),
            ),
          ),
        ],
      )),
    );
  }

  BorderRadius borderAll() {
    return BorderRadius.all(
      Radius.circular(
        getProportionScreenHeight(15.0),
      ),
    );
  }

  List<BoxShadow> get boxshadow {
    return [
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
    ];
  }
}
