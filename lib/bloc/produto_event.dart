

import 'package:trabalho2/models/produto_models.dart';

abstract class ProdutoEvent {}

class UpdateProduto extends ProdutoEvent {
  String produtoId;
  String nome;
  double preco;
  String categoria;
  

  UpdateProduto({this.produtoId, this.nome, this.preco, this.categoria});
}

class AddProduto extends ProdutoEvent {
  String nome;
  double preco;
  String categoria;

  AddProduto({this.nome, this.preco, this.categoria});
}

class DeleteProduto extends ProdutoEvent {
  String docId;
  DeleteProduto({this.docId});
}

class ReceivedNewList extends ProdutoEvent {
  List<Produto> produtos;
  ReceivedNewList(this.produtos);
}
