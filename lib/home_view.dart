import 'package:calculo_imc/imc_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final heightEC = TextEditingController();
  final widthEC = TextEditingController();
  List<ImcModel> listImc = [];

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
                  labelText: 'Altura a altura',
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: const Text('CALCULAR'),
                      onPressed: () {
                        setState(() {
                          listImc.add(
                            ImcModel(
                              height: double.parse(heightEC.text),
                              weight: double.parse(widthEC.text),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 180,
                ),
                shrinkWrap: true,
                itemCount: listImc.length,
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  final item = listImc[index];
                  final imc = item.calcularIMC();

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
                          Text("Altura: ${item.height}"),
                          const SizedBox(width: 10),
                          Text("Peso: ${item.weight}"),
                        ],
                      ),
                      Text(item.verifyImc(imc)),
                    ],
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
