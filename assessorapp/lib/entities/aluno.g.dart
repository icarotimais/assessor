// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aluno.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlunoAdapter extends TypeAdapter<Aluno> {
  @override
  final int typeId = 1;

  @override
  Aluno read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Aluno()
      ..idProfessor = fields[0] as int
      ..nome = fields[1] as String
      ..sobrenome = fields[2] as String
      ..iesAtivo = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, Aluno obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.idProfessor)
      ..writeByte(1)
      ..write(obj.nome)
      ..writeByte(2)
      ..write(obj.sobrenome)
      ..writeByte(3)
      ..write(obj.iesAtivo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlunoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
