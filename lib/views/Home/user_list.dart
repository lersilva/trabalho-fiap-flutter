import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho2/bloc/auth_bloc.dart';
import 'package:trabalho2/bloc/auth_state.dart';
import 'package:trabalho2/models/user_model.dart';
import 'package:trabalho2/views/Home/user_tile.dart';


class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Text('asfasdf');
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthState) {
          List<int> list = [1,2,3,4];
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return UserTile(produto: list[index]);
              });
        }
      },
    );
  }
}
