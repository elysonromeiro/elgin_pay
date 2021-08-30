import 'package:flutter/material.dart';
import 'package:smartpos_flutter/smartpos_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initElgin();
  }

  void initElgin() {
    // (OPCIONAL) Caso deseje configurar o tema, configurar antes de chamar o init.
    ElginPAY.configTema(
      corFonte: Colors.black,
      corFundoTela: Colors.white,
    );

    // Inicializa a biblioteca.
    ElginPAY.init(
        empresaAutomacao: "Empresa",
        nomeAutomacao: "Empresa",
        versaoAutomacao: "versaoAutomacao");

    // (OPCIONAL) Definir manualmente os textos das dialogs.
    // Não é necessário definir todos os campos
    ElginPAY.configurarTexto(
      dialogText: DialogText.ERRO_IMPRESSAO,
      title: "ERROR",
    );
  }

  void administrativa() {
    ElginPAY.transactionCall(operacao: Operacoes.ADMINISTRATIVA);
  }

  void imprimir() {
    ElginPAY.imprimirStrings(<String>[
      'Teste Impressao',
      'Linha 2',
      'Linha 3',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SmartPOS Flutter DEMO'),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: initElgin,
                  child: Text("Init"),
                ),
                ElevatedButton(
                  onPressed: administrativa,
                  child: Text("ADMINISTRATIVA"),
                ),
                ElevatedButton(
                  onPressed: imprimir,
                  child: Text("Teste Impressao"),
                ),
              ]),
        ),
      ),
    );
  }
}