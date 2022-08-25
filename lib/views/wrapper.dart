import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho2/bloc/auth_bloc.dart';
import 'package:trabalho2/bloc/auth_state.dart';
import 'package:trabalho2/bloc/produto_bloc.dart';
import 'package:trabalho2/views/Home/home.dart';

import 'auth/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, AuthState state) {
        if (state is Authenticated) {
          return MultiBlocProvider(
            providers:  [
              BlocProvider<ProdutoBloc>(
              create: (context) {
                return ProdutoBloc(state.user.uid);
              }),
              BlocProvider<AuthBloc>(
              create: (context) {
                return AuthBloc();
              })
            ],         
            child: Home());
        } else {
          return Authenticate();
        }
      },
      listener: (context, AuthState state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Erro no Servidor"),
                  content: Text(state.message),
                  actions: [
                    FlatButton(
                      child: Text("Ok"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        }
      },
    );
  }
}
