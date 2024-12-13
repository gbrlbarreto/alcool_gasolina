import 'package:flutter/material.dart';

class AlcoolGasolina extends StatefulWidget {
  @override
  _AlcoolGasolinaState createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){

    double? precoAlcool = double.tryParse( _controllerAlcool.text );
    double? precoGasolina = double.tryParse( _controllerGasolina.text );

    if( precoAlcool == null || precoGasolina == null ){
      setState(() {
        _textoResultado = "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    } else{
      if( (precoAlcool/precoGasolina) >= 0.7 ){
        setState(() {
          _textoResultado = "Gasolina: $precoGasolina, Álcool: $precoAlcool. Melhor abastecer com gasolina!";
      });
      }else{
        setState(() {
          _textoResultado = "Gasolina: $precoGasolina, Álcool: $precoAlcool. Melhor abastecer com álcool!";
        });
      }
      _limparCampos();
    }
  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecer seu carro",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço Alcool (Ex: 3.59)"),
                style: TextStyle(fontSize: 22),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço Gasolina (Ex: 5.89)"),
                style: TextStyle(fontSize: 22),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(15)),
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: _calcular
                    ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
