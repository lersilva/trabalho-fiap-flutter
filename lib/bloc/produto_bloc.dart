import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:trabalho2/bloc/produto_event.dart';
import 'package:trabalho2/bloc/produto_state.dart';
import 'package:trabalho2/firebase/produto.dart';
import 'package:trabalho2/models/produto_models.dart';

class ProdutoBloc extends Bloc<ProdutoEvent, ProdutoState> {
  ProdutoService _produtoService;
  StreamSubscription _produtoSubscription;

  ProdutoBloc(String uid) : super(UnAuthenticatedProdutoState()) {
    _produtoService = ProdutoService(uid: uid);
    _produtoSubscription = _produtoService.produtos.listen((List<Produto> event) {
      add(ReceivedNewList(event));
    });
  }

  @override
  Stream<ProdutoState> mapEventToState(ProdutoEvent event) async* {
    if (event is AddProduto) {
      _produtoService.addProduto(event.nome, event.preco, event.categoria);
    } else if (event is DeleteProduto) {
      _produtoService.removeProduto(event.docId);
    } else if (event is UpdateProduto) {
      _produtoService.updateProduto(
          event.produtoId, event.nome, event.preco, event.categoria);
    } else if (event is ReceivedNewList) {
      yield ProdutoProdutoState(event.produtos);
    }
  }

  @override
  Future<void> close() {
    _produtoSubscription.cancel();
    return super.close();
  }
}
