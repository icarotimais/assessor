// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lancamentos.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LancamentosAdapter extends TypeAdapter<Lancamentos> {
  @override
  final int typeId = 2;

  @override
  Lancamentos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Lancamentos()
      ..idProfessor = fields[0] as int
      ..idAluno = fields[1] as int
      ..dataLancamento = fields[2] as DateTime
      ..iesConcluido = fields[3] as bool
      ..observacao = fields[4] as String
      ..iesAtivo = fields[5] as bool;
  }

  @override
  void write(BinaryWriter writer, Lancamentos obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.idProfessor)
      ..writeByte(1)
      ..write(obj.idAluno)
      ..writeByte(2)
      ..write(obj.dataLancamento)
      ..writeByte(3)
      ..write(obj.iesConcluido)
      ..writeByte(4)
      ..write(obj.observacao)
      ..writeByte(5)
      ..write(obj.iesAtivo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LancamentosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
