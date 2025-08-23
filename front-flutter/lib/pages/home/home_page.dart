import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Nest Js'),
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                const Text('Rotina de cadastros!'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pushNamed("/user");
                  },
                  child: const Text('Cadastrar Usuario'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pushNamed("/category");
                  },
                  child: const Text('Cadastrar Categoria'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
