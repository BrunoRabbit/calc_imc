import 'package:hive/hive.dart';

part 'imc_model.g.dart';

@HiveType(typeId: 0)
class ImcModel extends HiveObject {
  ImcModel({
    required this.weight,
    required this.height,
    this.imc,
    this.imcResult,
    this.name = "Não informado",
  });


  @HiveField(0)
  double? height;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? imc;

  @HiveField(3)
  double? imcResult;

  @HiveField(4)
  double? weight;
  
  double calcularIMC() {
    return weight! / (height! * height!);
  }

  String verifyImc(double imc) {
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

  ImcModel copyWith({
    double? weight,
    double? height,
    String? name,
    String? imc,
    double? imcResult,
  }) {
    return ImcModel(
      weight: weight ?? this.weight,
      height: height ?? this.height,
      imc: imc ?? this.imc,
      imcResult: imcResult ?? this.imcResult,
      name: name ?? this.name,
    );
  }
}
