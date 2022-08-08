import 'package:flutter/material.dart';
import 'package:projeto_exemplo/endereco/repository/endereco_repository.dart';
import 'package:projeto_exemplo/model/endereco_model.dart';

class EnderecoPage extends StatefulWidget {
  EnderecoPage({key}) : super(key: key);

  @override
  _EnderecoState createState() => _EnderecoState();
}

class _EnderecoState extends State<EnderecoPage> {
  EnderecoRepository httpService = EnderecoRepository();
  late Future<EnderecoModel> futureEndereco;

  @override
  void initState() {
    super.initState();
    futureEndereco = httpService.getEndereco(cep: "64006220");
  }

  TextEditingController buscaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Endereço'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: buscaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite o CEP',
              ),
            ),
            Center(
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    EnderecoModel end = snapshot.data as EnderecoModel;
                    return Container(
                      child: Column(children: [
                        Text(
                          'Logradouro: ${end.logradouro}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Bairro: ${end.bairro}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Localidade: ${end.localidade}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'UF: ${end.uf}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ]),
                    );
                  } else {
                    return Text(
                      'Erro ao carregar endereço',
                      style: TextStyle(fontSize: 16.0),
                    );
                  }
                },
                future: futureEndereco,
              ),
            ),
            TextButton(
              onPressed: () => setState(() {
                futureEndereco =
                    httpService.getEndereco(cep: buscaController.text);
              }),
              child: Text(
                'Buscar Endereço',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
