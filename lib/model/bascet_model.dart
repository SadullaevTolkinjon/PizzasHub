import 'package:hive/hive.dart';
part 'bascet_model.g.dart';
@HiveType(typeId: 0)
class MyBascet {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? img;
 @HiveField(2)
  int? narx;
 @HiveField(3)
  String? narxx;
 @HiveField(4)
  int? count;
  MyBascet(this.name, this.img, this.narx, this.count);
}
