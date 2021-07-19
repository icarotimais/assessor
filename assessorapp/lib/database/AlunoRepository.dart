import 'package:assessorapp/database/Repository.dart';
import 'package:assessorapp/entities/aluno.dart';

class AlunoRepository extends Repository<Aluno> {
  Iterable<Aluno> getAlunos(int idProfessor) {
    return db
        .toMap()
        .values
        .where((element) => element.idProfessor == idProfessor);
  }
}
