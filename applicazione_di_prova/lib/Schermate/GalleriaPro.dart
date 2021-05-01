import 'package:applicazione_di_prova/Schermate/AlbumFoto.dart';
import 'package:flutter/material.dart';

class GalleriaPro extends StatefulWidget {
  @override
  _GalleriaProState createState() => _GalleriaProState();
}

class _GalleriaProState extends State<GalleriaPro> {
  int numeroListe = 0;
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Eliminare l'album definitivamente?"),
              actions: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black, minimumSize: Size(100, 40)),
                        onPressed: () {
                          setState(() {
                            numeroListe--;
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text('Sì')),
                    Container(
                      width: 30,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black, minimumSize: Size(100, 40)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('No')),
                    Container(
                      width: 15,
                    )
                  ],
                ),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galleria Pro'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: numeroListe,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            leading: Icon(Icons.photo_library_outlined),
            title: Text('Numero Album $numeroListe'),
            onLongPress: () {
              createAlertDialog(context);
            },
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AlbumFoto()));
            },
          ));
        },
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
    });
  }
}
