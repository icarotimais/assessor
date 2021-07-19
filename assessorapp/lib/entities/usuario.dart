import 'package:hive/hive.dart';

part 'usuario.g.dart';

@HiveType(typeId: 0)
class Usuario extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String login;
  @HiveField(2)
  String senha;
  @HiveField(3)
  String nome;
  @HiveField(4)
  String sobrenome;
  @HiveField(5)
  bool isAdmin;

  Usuario(this.login, this.senha, this.nome, this.sobrenome, this.isAdmin);
}
