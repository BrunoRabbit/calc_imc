import 'package:flutter_test/flutter_test.dart';
import 'package:calculo_imc/main.dart';

void main() {
  group('Pessoa', () {
    test('Cálculo do IMC', () {
      final pessoa = Pessoa(name: 'João', weight: 70.0, height: 1.75);
      expect(pessoa.calcularIMC(), closeTo(22.86, 0.01));
    });

    test('Classificação do IMC', () {
      expect(verifyImc(15.5), 'Magreza grave');
      expect(verifyImc(16.5), 'Magreza moderada');
      expect(verifyImc(18.0), 'Magreza leve');
      expect(verifyImc(20.0), 'Saudável');
      expect(verifyImc(27.0), 'Sobrepeso');
      expect(verifyImc(32.0), 'Obesidade Grau 1');
      expect(verifyImc(38.0), 'Obesidade Grau 2 (severa)');
      expect(verifyImc(42.0), 'Obesidade Grau 3 (mórbida)');
    });
  });
}
