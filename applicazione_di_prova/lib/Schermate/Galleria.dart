import 'package:flutter/material.dart';

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
        onPressed: _aumentaNumeroListe,
      ),
    );
  }

  void _aumentaNumeroListe() {
    setState(() {
      numeroListe++;
      listaAlbum.add(Card(
        child: ListTile(
          leading: Icon(Icons.photo_outlined),
          title: Text('Numero Album $numeroListe'),
          onTap: () {},
        ),
      ));
    });
  }
}
