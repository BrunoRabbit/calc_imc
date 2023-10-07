import 'package:calculo_imc/home_view.dart';
import 'package:flutter/material.dart';

class Application extends StatefulWidget {

  const Application({ super.key });

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

   @override
   Widget build(BuildContext context) {
       return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
       );
  }
}