
class  Produto{
  String id;
  String nome;
  double preco;
  String categoria;

  Produto({this.id, this.nome, this.preco, this.categoria});

  Produto.fromMap(String id, Map<String, dynamic> map) {
    this.id = id;
    this.nome = map["nome"];
    this.preco = map["preco"];
    this.categoria = map["categoria"];
  }
}
