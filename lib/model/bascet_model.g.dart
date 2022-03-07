// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bascet_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyBascetAdapter extends TypeAdapter<MyBascet> {
  @override
  final int typeId = 0;

  @override
  MyBascet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyBascet(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as int?,
      fields[4] as int?,
    )..narxx = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, MyBascet obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.img)
      ..writeByte(2)
      ..write(obj.narx)
      ..writeByte(3)
      ..write(obj.narxx)
      ..writeByte(4)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyBascetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
