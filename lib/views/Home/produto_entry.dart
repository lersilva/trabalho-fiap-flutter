import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho2/bloc/produto_bloc.dart';
import 'package:trabalho2/bloc/produto_event.dart';
import 'package:trabalho2/models/produto_models.dart';

String categoria;
class ProdutoEntry extends StatelessWidget {
  final GlobalKey<FormState> formKey = new GlobalKey();
  final Produto inModel = Produto();
  DropdownExample dropdown = DropdownExample();
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: addProdutoFormulario(context),
    );
  }

  Widget addProdutoFormulario(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
                validator: (value) {
                  if (value.length == 0) {
                    return "Please enter nome";
                  }
                  return null;
                },
                onSaved: (String value) {
                  inModel.nome = value;
                },
                decoration:
                    InputDecoration(hintText: "Nome", labelText: "Nome")),
            TextFormField(
                validator: (value) {
                  if (value.length == 0) {
                    return "Please enter preço";
                  }  

                  return null;
                },
                onSaved: (String value) {
                  inModel.preco = double.parse(value);
                },
                decoration:
                    InputDecoration(hintText: "Preço", labelText: "Preço")),
            dropdown,              
            RaisedButton(
                child: Text("Register"),
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    inModel.categoria = categoria;
                    BlocProvider.of<ProdutoBloc>(context).add(AddProduto(
                        nome: inModel.nome,
                        preco: inModel.preco,
                        categoria: inModel.categoria));
                    formKey.currentState.reset();
                  }
                })
          ],
        ));
  }

}
  class DropdownExample extends StatefulWidget {
    @override
    _DropdownExampleState createState() {
      return _DropdownExampleState();
    }
  }
  
  class _DropdownExampleState extends State<DropdownExample> {
    String _value;
  
    @override
    Widget build(BuildContext context) {
      return Center(
        child: 
          DropdownButton<String>(
                icon: Icon(Icons.arrow_downward),
                value: _value,
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
                ),
                onChanged: (String value) {
                  setState(() {
                    _value = value;
                    categoria = value;
                  });
                },
                items: <String>['frutas','legumes','verduras']
                .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
                );
                }).toList(),
            ),
      );
    }
  }
