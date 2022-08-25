import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho2/bloc/auth_bloc.dart';
import 'package:trabalho2/bloc/auth_event.dart';
import 'package:trabalho2/views/Home/produto_entry.dart';
import 'package:trabalho2/views/Home/produto_list.dart';
import 'package:trabalho2/views/Home/user_list.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Home Screen"),
            actions: [
              FlatButton.icon(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(Logout());
                  },
                  icon: Icon(Icons.person),
                  label: Text("logout"))
            ],
            bottom: TabBar(tabs: [
              Tab(
                  icon: Row(
                children: [Icon(Icons.announcement), Text("Lista Produtos")],
              )),
              Tab(
                  icon: Row(
                children: [Icon(Icons.cake), Text("Cadastro Produtos")],
              ))
            ]),
          ),
          body: TabBarView(children: [
            ProdutoList(),
            ProdutoEntry(),
          ])),
    );
  }
}
