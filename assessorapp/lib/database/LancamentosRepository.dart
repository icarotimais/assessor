import 'package:assessorapp/database/Repository.dart';
import 'package:assessorapp/entities/aluno.dart';
import 'package:assessorapp/entities/lancamentos.dart';

class LancamentosRepository extends Repository<Lancamentos> {
  Iterable<Lancamentos> getLancamentos(int idProfessor) {
    return db
        .toMap()
        .values
        .where((element) => element.idProfessor == idProfessor);
  }
}
