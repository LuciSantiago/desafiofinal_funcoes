int qtdM = 0;
int qtdF = 0;
var pessoasM = [];
var pessoasF = [];

void separador() {
  print('-' * 80);
}

List listaDuplicados(List lista) {
  return lista.toSet().toList();
}

void calcularQtdSexo(List lista) {
  for (var pessoa in lista) {
    var dadosPessoa = pessoa.split('|');
    var sexoF = 'feminino';

    if (sexoF == dadosPessoa[2].toLowerCase()) {
      qtdF++;
      pessoasF.add(dadosPessoa[0]);
    } else {
      qtdM++;
      pessoasM.add(dadosPessoa[0]);
    }
  }
}

void main() {
  //! Detalhe sobre a String
  //! A String é composta por 3 campos ( Nome | Idade | Sexo )
  final pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino', //duplicado
    'Maria|88|Feminino',
    'Helena|24|Feminino', //duplicado
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino', //duplicado
    'Guilherme|15|Masculino',
    'Manuela|85|Feminino',
    'Leonardo|5|Masculino', // duplicado
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  //! Baseado na lista acima.
  //! 1 - Remova os pacientes duplicados e apresente a nova lista
  var listaSemDuplicados = listaDuplicados(pessoas);
  print('1 - Remova os pacientes duplicados e apresente a nova lista');
  print('Sem duplicados:');
  listaSemDuplicados.forEach(print);
  separador();

  //! 2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas
  print(
      '2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas');
  calcularQtdSexo(listaSemDuplicados);

  print('Existem $qtdF do sexo feminino');
  print('São elas: $pessoasF');
  print('Existem $qtdM do sexo masculino');
  print('São eles: $pessoasM');
  separador();

  //! 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome
  print(
      '3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome');
  var lista18 = [];

  for (var paciente in listaSemDuplicados) {
    int idade = 18;
    var pacienteDados = paciente.split('|');
    var idadePaciente = int.parse(pacienteDados[1]);
    if (idade < idadePaciente) {
      lista18.add(pacienteDados[0]);
    }
  }

  print('Lista com pessoas maiores de 18 anos:\n$lista18');
  separador();

  //! 4 - Encontre a pessoa mais velha e apresente o nome dela.
  print('4 - Encontre a pessoa mais velha e apresente o nome dela.');
  var listaMaisVelha = [...listaSemDuplicados];
  listaMaisVelha.sort((paciente1, paciente2) {
    final pacienteDados1 = paciente1.split('|');
    final pacienteDados2 = paciente2.split('|');

    final idadePaciente1 = int.parse(pacienteDados1[1]);
    final idadePaciente2 = int.parse(pacienteDados2[1]);

    return idadePaciente2.compareTo(idadePaciente1);
  });

  print('A pessoa mais velha é: ${listaMaisVelha.first.split('|')[0]}');
}
