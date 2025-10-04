// Agregação e Composição Equipe: Ana Vitória e Luan Victor
import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'dependentes': _dependentes.map((d) => d.toJson()).toList(),
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
    };
  }
}

void main() {
  // 1. Criar vários objetos Dependentes
  var d1 = Dependente("Lucas");
  var d2 = Dependente("Maria");
  var d3 = Dependente("Pedro");
  var d4 = Dependente("Ana");

  // 2. Criar vários objetos Funcionário associando Dependentes
  var f1 = Funcionario("João", [d1, d2]);
  var f2 = Funcionario("Carla", [d3]);
  var f3 = Funcionario("Roberto", [d4]);

  // 3. Criar lista de Funcionários
  var funcionarios = [f1, f2, f3];

  // 4. Criar EquipeProjeto
  var equipe = EquipeProjeto("Sistema de Vendas", funcionarios);

  // 5. Printar no formato JSON
  var jsonEquipe = jsonEncode(equipe.toJson());
  print(jsonEquipe);
}

---------------------------------------------------------------------------------------------------------------------------------------------------------------

Saída Json:


{"nomeProjeto":"Sistema de Vendas","funcionarios":[{"nome":"João","dependentes":[{"nome":"Lucas"},{"nome":"Maria"}]},{"nome":"Carla","dependentes":[{"nome":"Pedro"}]},{"nome":"Roberto","dependentes":[{"nome":"Ana"}]}]}
