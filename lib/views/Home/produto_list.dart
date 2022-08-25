import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho2/bloc/produto_bloc.dart';
import 'package:trabalho2/bloc/produto_state.dart';
import 'package:trabalho2/models/produto_models.dart';

import 'produto_tile.dart';

class ProdutoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProdutoBloc, ProdutoState>(
      builder: (context, state) {
        if (state is ProdutoProdutoState) {
          List<Produto> list = state.produtos;
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ProdutoTile(produto: list[index]);
              });
        }
      },
    );
  }
}
