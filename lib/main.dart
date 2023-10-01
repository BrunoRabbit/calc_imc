import 'dart:io';

class Pessoa {
  Pessoa({
    this.name,
    this.weight,
    this.height,
  });

  String? name;
  double? weight;
  double? height;

  double calcularIMC() {
    return weight! / (height! * height!);
  }
}

void main() {
  try {
    stdout.write("informe o nome: ");
    String name = stdin.readLineSync()!;

    stdout.write("informe o peso (em kg): ");
    double weight = double.parse(stdin.readLineSync()!);

    stdout.write("informe a altura (em metros): ");
    double height = double.parse(stdin.readLineSync()!);

    Pessoa pessoa = Pessoa(name: name, weight: weight, height: height);

    double imc = pessoa.calcularIMC();

    print("Nome: ${pessoa.name}");
    print("Peso: ${pessoa.weight} kg");
    print("Altura: ${pessoa.height} metros");

    print("IMC: $imc, ${verifyImc(imc)}");
  } catch (e) {
    print("Ocorreu um erro: $e");
  }
}

verifyImc(double imc) {
  String message;
  if (imc < 16) {
    message = "Magreza grave";
  } else if (imc >= 16 && imc < 17) {
    message = "Magreza moderada";
  } else if (imc >= 17 && imc < 18.5) {
    message = "Magreza leve";
  } else if (imc >= 18.5 && imc < 25) {
    message = "Saudável";
  } else if (imc >= 25 && imc < 30) {
    message = "Sobrepeso";
  } else if (imc >= 30 && imc < 35) {
    message = "Obesidade Grau 1";
  } else if (imc >= 35 && imc < 40) {
    message = "Obesidade Grau 2 (severa)";
  } else {
    message = "Obesidade Grau 3 (mórbida)";
  }

  return message;
}
