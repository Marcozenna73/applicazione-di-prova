import 'package:flutter/material.dart';
import 'package:applicazione_di_prova/Schermate/AlbumFoto.dart';

class GalleriaFinale extends StatefulWidget {
  @override
  _GalleriaFinaleState createState() => _GalleriaFinaleState();
}

class _GalleriaFinaleState extends State<GalleriaFinale> {
  List<String> nomiAlbum = [];
  List<Card> album = [];
  int numeroAlbum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GalleriaFinale'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  numeroAlbum = 0;
                  nomiAlbum = [];
                  album = [];
                });
              })
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
          for (int i = 0; i < numeroAlbum; i++) album[i] //DA MODIFICARE
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_photo_alternate_outlined,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        onPressed: () {
          alertDialogNameAlbum(context); // DA MODIFICARE
        },
      ),
    );
  }

  alertDialogNameAlbum(BuildContext context) {
    TextEditingController controller = TextEditingController();
    String nomeAlbum;
    Card carta;
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
                      setState(() {
                        numeroAlbum++;
                        nomeAlbum = controller.text;
                        nomiAlbum.add(nomeAlbum);
                        carta = Card(
                          child: ListTile(
                              leading: Icon(Icons.photo_outlined),
                              title: Text('Numero Album $numeroAlbum'),
                              subtitle: Text('Nome Album: $nomeAlbum'),
                              onTap: () {
                                setState(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AlbumFoto()));
                                });
                              },
                              onLongPress: () {
                                //rimuoviElementoLista();           DA MODIFICARE!!!
                                setState(() {
                                  numeroAlbum--;
                                  album.removeAt((numeroAlbum));
                                  nomiAlbum.removeAt((numeroAlbum));
                                });
                              }),
                        );
                        album.add(carta);
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text('Conferma')),
                Container(
                  width: 50,
                ),
              ]);
        });
  }
}
