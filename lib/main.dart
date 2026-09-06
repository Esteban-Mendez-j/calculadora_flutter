import 'package:calculadora/ui/views/calculadora_view.dart';
import 'package:calculadora/ui/views_models/calculadora_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CalculadoraViewmodel>(
          create: (_) => CalculadoraViewmodel(),
        ),
      ],

      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Calculadora',
          home: CalculadoraView(),
        );
      },
    );
  }
}
