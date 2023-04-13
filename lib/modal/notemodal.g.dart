// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notemodal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteModalAdapter extends TypeAdapter<NoteModal> {
  @override
  final int typeId = 0;

  @override
  NoteModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteModal(
      tittle: fields[0] as String,
      desc: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NoteModal obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.tittle)
      ..writeByte(1)
      ..write(obj.desc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
