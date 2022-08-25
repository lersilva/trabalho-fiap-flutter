import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho2/bloc/produto_bloc.dart';
import 'package:trabalho2/bloc/produto_event.dart';
import 'package:trabalho2/models/produto_models.dart';
String categoria;
class ProdutoTile extends StatelessWidget {
  final Produto produto;

  const ProdutoTile({this.produto}) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8),
        child: Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: imagem(produto),
            title: Text(produto.nome),
            subtitle: Text(produto.preco.toString()),
            trailing: GestureDetector(
                child: Icon(Icons.delete),
                onTap: () {
                  BlocProvider.of<ProdutoBloc>(context)
                      .add(DeleteProduto(docId: produto.id));
                }),
            onLongPress:(){
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.grey,
                  duration: Duration(seconds: 100),
                  content: Container(
                     height: 300
                    ,child: updateProdutoFormulario(context,produto)),
                )
              );             
            }
          ),
        ));
  }

  Image imagem(produto){
    if (produto.categoria == 'frutas') {
      return Image.asset('assets/images/fruta.jpg');
    } else if(produto.categoria == 'verduras') {
      return Image.asset('assets/images/alface.jpg');
    } else if(produto.categoria == 'legumes') {
      return Image.asset('assets/images/legume.jpg');
    }
  }
  Widget updateProdutoFormulario(BuildContext context,produto){
    DropdownExample dropdown = DropdownExample();
    return Column(
          children: [
            TextFormField(
                initialValue: produto.nome,
                validator: (value) {
                  if (value.length == 0) {
                    return "Please enter titulo";
                  }
                  return null;
                },
                onChanged: (String value) {
                  produto.nome = value;
                },
                decoration:
                    InputDecoration(hintText: "Nome", labelText: "Nome")),
            TextFormField(
                initialValue: produto.preco.toString(),
                validator: (value) {
                  if (value.length == 0) {
                    return "Please enter preco";
                  }
                  return null;
                },
                onChanged: (String value) {
                  produto.preco = double.parse(value);
                },
                decoration:
                    InputDecoration(hintText: "Preço", labelText: "Preço")),
            dropdown,
            RaisedButton(
                child: Text("Register"),
                onPressed: () {
                   BlocProvider.of<ProdutoBloc>(context)
                .add(UpdateProduto(produtoId: produto.id, nome :  produto.nome, preco: produto.preco, categoria: categoria));
                Scaffold.of(context).hideCurrentSnackBar();
                }),
            RaisedButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Scaffold.of(context).hideCurrentSnackBar();
                })    
          ],
        );
  }
    
}

class DropdownExample extends StatefulWidget {
    @override
    _DropdownExampleState createState() {
      return _DropdownExampleState();
    }
  }
  
  class _DropdownExampleState extends State<DropdownExample> {
    String _value = categoria;
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
