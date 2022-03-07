import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class DessertsService {
  static Future getDesertData() async {
    await openBox();
    BaseOptions option = BaseOptions(
      headers: {
        'x-rapidapi-key': "66d5b7797dmsh0bb04695d08b72ep15ab81jsn6d2c24e8deae"
      },
    );

    Dio dio = Dio(option);
    Response response =
        await dio.get("https://pizza-and-desserts.p.rapidapi.com/desserts");

    await putData(response.data);
  }

  static Future getDesertData2() async {
    BaseOptions option = BaseOptions(headers: {
      'x-rapidapi-key': "66d5b7797dmsh0bb04695d08b72ep15ab81jsn6d2c24e8deae"
    });

    Dio dio = Dio(option);
    Response response =
        await dio.get("https://pizza-and-desserts.p.rapidapi.com/pizzas");

    await putData2(response.data);
  }

  static Box? box1;
  static Box? box2;
  static openBox() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box1 = Hive.box("desert");
    box2 = Hive.box("pizza");
    return;
  }

  static putData(var data) async {
    await box1!.clear();
    for (var malumot in data) {
      await box1!.add(malumot);
    }
  }

  static putData2(var data) async {
    await box2!.clear();
    for (var malumot in data) {
      await box2!.add(malumot);
    }
  }
}
