class Tarefa{

  String nomeTarefa;
  DateTime data;
  bool fez;



  Tarefa(String nome){
    this.nomeTarefa = nome;
    data = DateTime.now();
    fez = false;
  }


}