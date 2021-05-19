import 'package:flutter/material.dart';

import 'objeto.dart';

void main() {
  runApp(new ListaView());
}

class ListaView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ListaScreen();
  }
}

class ListaScreen extends State<ListaView> {
  List<Tarefa> list = new List<Tarefa>();

  TextEditingController controller = new TextEditingController();
  void AdicionarTarefa(String nome) {
    setState(() {
      list.add(Tarefa(nome));
    });

    controller.clear();
  }

  Widget getItem(Tarefa tarefa) {
    return new Row(
      //layout horizontal
      children: [
        IconButton(
          icon: new Icon(
            tarefa.fez ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.indigo,
          ),
          onPressed: () {
            setState(() {
              tarefa.fez = true;
            });
          },
          iconSize: 42.0,
        ),
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              tarefa.nomeTarefa,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(tarefa.data.toIso8601String()) //dados da lista
          ],
        )
      ],
    );
  }

  //design do layout
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("ListView")),
            backgroundColor: Colors.indigo,
          ),
          body: Column(
            //vertical
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (value) {
                      AdicionarTarefa(value);
                    },
                  )),
              Expanded(
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (_, indice) {
                        return getItem(list[indice]);
                      }))
            ],
          )),
    );
  }
}
