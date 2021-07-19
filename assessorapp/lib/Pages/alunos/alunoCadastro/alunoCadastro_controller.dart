import 'package:assessorapp/database/AlunoRepository.dart';
import 'package:assessorapp/entities/aluno.dart';
import 'package:assessorapp/menu/menu_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';

class AlunoCadastroController extends GetxController {
  final MenuController menuController = Get.find<MenuController>();
  final storage = GetStorage();
  final repository = Get.find<AlunoRepository>();
  var aluno = Aluno().obs;

  var alunoKey = "".obs;

  @override
  void onInit() {
    super.onInit();
    buscaAluno();
  }

  @override
  void onReady() async {
    super.onReady();
    await repository.init();
  }

  buscaAluno() {
    if (Get.parameters.length > 0) {
      alunoKey.value = Get.parameters["key"];

      aluno.value = repository.getData(int.parse(alunoKey.value));

      nome.value = aluno.value.nome;
      sobrenome.value = aluno.value.sobrenome;
      iesAtivo.value = aluno.value.iesAtivo;
    }
  }

  salvaAluno() {
    if (aluno.value.key != null) {
      aluno.value.nome = nome.value;
      aluno.value.sobrenome = sobrenome.value;
      aluno.value.iesAtivo = iesAtivo.value;
      aluno.value.save();
    } else {
      adicionaNovoAluno();
    }
    Get.back();
  }

  adicionaNovoAluno() async {
    var aluno = Aluno()
      ..idProfessor = menuController.idProfessor.value
      ..nome = this.nome.value
      ..sobrenome = this.sobrenome.value
      ..iesAtivo = true;
    await repository.add(aluno);
  }

  var alunos = RxList<Aluno>();

  var nome = "".obs;
  setNome(String value) => nome.value = value;
  bool get nomeIsValid => this.nome.isNotEmpty;
  String get nomeValidator =>
      !nomeIsValid ? "O nome do aluno deve ser informado" : null;

  var sobrenome = "".obs;
  setSobrenome(String value) => sobrenome.value = value;
  bool get sobrenomeIsValid => this.nome.isNotEmpty;
  String get sobrenomeValidator =>
      !nomeIsValid ? "O sobrenome do aluno deve ser informado" : null;

  var iesAtivo = false.obs;
  setIesAtivo(bool value) => iesAtivo.value = value;
}
