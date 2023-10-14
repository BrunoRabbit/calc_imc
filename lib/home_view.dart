import 'package:calculo_imc/imc_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final heightEC = TextEditingController();
  final widthEC = TextEditingController();
  final nameEC = TextEditingController();
  static const String key = 'imc_key';
  var box = Hive.openBox(key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela inicial'),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              TextField(
                controller: widthEC,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Infome o peso',
                ),
              ),
              TextField(
                controller: heightEC,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Infome a altura',
                ),
              ),
              TextField(
                controller: nameEC,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Informe o nome (Opcional)',
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: const Text('CALCULAR'),
                      onPressed: () async {
                        final box = await Hive.openBox(key);

                        final name = nameEC.text;
                        final weight = double.parse(widthEC.text);
                        final height = double.parse(heightEC.text);

                        final model = ImcModel(
                          name: name.isNotEmpty ? name : null,
                          weight: weight,
                          height: height,
                        );
                        final imc = model.verifyImc(model.calcularIMC());
                        final imcResult = model.calcularIMC();

                        setState(() {
                          model.copyWith(
                            imc: imc,
                            imcResult: imcResult,
                          );

                          box.add(model);
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              FutureBuilder(
                future: Hive.openBox(key),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final box = Hive.box(key);

                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 180,
                      ),
                      padding: const EdgeInsets.all(12),
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        final data = box.getAt(index) as ImcModel;
                        final imc = data.calcularIMC();

                        return Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              child: FittedBox(
                                child: Text(
                                  "${imc.toStringAsFixed(4)} IMC",
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Altura: ${data.height}"),
                                const SizedBox(width: 10),
                                Text("Peso: ${data.weight}"),
                              ],
                            ),
                            Text(data.verifyImc(imc)),
                          ],
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
