// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calculo_imc/imc_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:calculo_imc/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ImcModelAdapter());
  await Hive.openBox('imc_key');
  runApp(const Application());
}