import 'package:trabalho2/models/produto_models.dart';

abstract class ProdutoState {}

class UnAuthenticatedProdutoState extends ProdutoState {}

class ProdutoProdutoState extends ProdutoState {
  List<Produto> produtos;
  ProdutoProdutoState(this.produtos);
}
