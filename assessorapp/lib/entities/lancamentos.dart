import 'package:hive/hive.dart';

part 'lancamentos.g.dart';

@HiveType(typeId: 2)
class Lancamentos extends HiveObject {
  @HiveField(0)
  int idProfessor;
  @HiveField(1)
  int idAluno;
  @HiveField(2)
  DateTime dataLancamento;
  @HiveField(3)
  bool iesConcluido;
  @HiveField(4)
  String observacao;
  @HiveField(5)
  bool iesAtivo;
}
