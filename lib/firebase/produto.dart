import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trabalho2/models/produto_models.dart';

class ProdutoService {
  final String uid;

  ProdutoService({this.uid});

  final CollectionReference produtoCollections =
      FirebaseFirestore.instance.collection("produtos");

  addProduto(String nome, double preco, String categoria) async {
    return await produtoCollections
        .doc(uid)
        .collection("meus_produtos")
        .add({"nome": nome, "preco": preco, "categoria": categoria });
  }

  removeProduto(String produtoId) async {
    return await produtoCollections
        .doc(uid)
        .collection("meus_produtos")
        .doc(produtoId)
        .delete();
  }

  updateProduto(String produtoId, String nome, double preco, String categoria) async {
    return await produtoCollections
        .doc(uid)
        .collection("meus_produtos")
        .doc(produtoId)
        .update({"nome": nome, "preco": preco, "categoria": categoria });
  }

  Stream<List<Produto>> get produtos {
    return produtoCollections
        .doc(uid)
        .collection("meus_produtos")
        .snapshots()
        .map(_produtoListFromSnapshot);
  }

  List<Produto> _produtoListFromSnapshot(QuerySnapshot snapshot) {
    List<Produto> produtos = List();
    for (var doc in snapshot.docs) {
      produtos.add(Produto.fromMap(doc.id, doc.data()));
    }
    return produtos;
  }
}
