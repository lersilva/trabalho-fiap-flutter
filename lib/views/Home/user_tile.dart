import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho2/bloc/produto_bloc.dart';
import 'package:trabalho2/bloc/produto_event.dart';
import 'package:trabalho2/models/produto_models.dart';
import 'package:trabalho2/models/user_model.dart';

class UserTile extends StatelessWidget {
  final int produto;

  const UserTile({this.produto}) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8),
        child: Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[2 * 100],
            ),
            title: Text(produto.toString()),
            
        )
    ));
  }    
}
