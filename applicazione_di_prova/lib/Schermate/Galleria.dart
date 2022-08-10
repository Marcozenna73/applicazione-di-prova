import 'package:flutter/material.dart';
import './AlbumFoto.dart';

class Galleria extends StatefulWidget {
  @override
  _GalleriaState createState() => _GalleriaState();
}

class _GalleriaState extends State<Galleria> {
  int numeroListe = 0;
  List<Card> listaAlbum = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galleria'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                numeroListe = 0;
              });
            },
          )
        ],
      ),
      body: ListView(
        children: [
          /*ListTile(
            leading: Icon(Icons.add_a_photo_outlined),
            title: Text('Album numero $numeroListe'),
            tileColor: Colors.purple,
            onTap: _aumentaNumeroListe,
          )*/
          for (int i = 0; i < numeroListe; i++) listaAlbum[i]
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_photo_alternate_outlined,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        onPressed: () {
          alertDialogNameAlbum(context);
        },
      ),
    );
  }

  void _aumentaNumeroListe(String nomeAlbum) {
    setState(() {
      numeroListe++;
      listaAlbum.add(Card(
        child: ListTile(
            leading: Icon(Icons.photo_outlined),
            title: Text('Numero Album $numeroListe'),
            subtitle: Text('Nome Album: $nomeAlbum'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AlbumFoto()));
            },
            onLongPress: () {
              rimuoviElementoLista();
            }),
      ));
    });
  }

  alertDialogNameAlbum(BuildContext context) {
    TextEditingController controller = TextEditingController();
    String nomeAlbum;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Inserire nome Album:"),
              content: TextField(
                controller: controller,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(hintText: 'Inserire nome Album'),
              ),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black, minimumSize: Size(100, 40)),
                    onPressed: () {
                      nomeAlbum = controller.text;
                      _aumentaNumeroListe(nomeAlbum);
                      Navigator.of(context).pop();
                    },
                    child: Text('Conferma')),
                Container(
                  width: 50,
                ),
              ]);
        });
  }

  rimuoviElementoLista() {
    setState(() {
      numeroListe--;
    });
  }
}
