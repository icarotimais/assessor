import 'package:hive/hive.dart';

part 'aluno.g.dart';

@HiveType(typeId: 1)
class Aluno extends HiveObject {
  @HiveField(0)
  int idProfessor;
  @HiveField(1)
  String nome;
  @HiveField(2)
  String sobrenome;
  @HiveField(3)
  bool iesAtivo;
}
