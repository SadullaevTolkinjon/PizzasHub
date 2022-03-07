import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pizzadeeserts/provider/boxadd_provider.dart';
import 'package:pizzadeeserts/size_config/size_config.dart';
import 'package:provider/provider.dart';

class MyBascetPage extends StatelessWidget {
  const MyBascetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<Box>(
          valueListenable: Hive.box("bascets").listenable(),
          builder: (context, box, index) {
            var data = box.values.cast().toList();
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemBuilder: (context, indexx) {
                  return Dismissible(
                    key: UniqueKey(),
                    child: Card(
                      child: ListTile(
                        leading: Container(
                          height: getProportionScreenHeight(64),
                          width: getProportionScreenWidth(64),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                data[indexx]["img"],
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          data[indexx]["name"].toString(),
                        ),
                        trailing: Text(
                          data[indexx]["price"].toString(),
                        ),
                      ),
                    ),
                    onDismissed: (val) {
                      context.read<BoxAddtoBascet>().ochiribTasha(indexx);
                    },
                  );
                },
                itemCount: data.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
