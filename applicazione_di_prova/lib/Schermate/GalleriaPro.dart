import 'package:applicazione_di_prova/Schermate/AlbumFoto.dart';
import 'package:flutter/material.dart';

class GalleriaPro extends StatefulWidget {
  @override
  _GalleriaProState createState() => _GalleriaProState();
}

class _GalleriaProState extends State<GalleriaPro> {
  int numeroListe = 0;
  int numeroAlbum = -1;
  List<String> nomiAlbum = [];
  alertDialogDelete(BuildContext context) {
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
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                            'Eliminare TUTTI gli elementi definitivamente?'),
                        actions: [
                          Row(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      minimumSize: Size(100, 40)),
                                  onPressed: () {
                                    setState(() {
                                      numeroListe = 0;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Sì')),
                              Container(
                                width: 30,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      minimumSize: Size(100, 40)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('No')),
                              Container(
                                width: 15,
                              )
                            ],
                          )
                        ],
                      );
                    });
              })
        ],
      ),
      body: ListView.builder(
        itemCount: numeroListe,
        itemBuilder: (context, index) {
          String nomeAlbum = nomiAlbum[numeroAlbum];
          Card carta = Card(
              child: ListTile(
            leading: Icon(Icons.photo_library_outlined),
            title: Text('$nomeAlbum'),
            onLongPress: () {
              alertDialogDelete(context);
            },
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AlbumFoto()));
            },
          ));
          return carta;
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add_photo_alternate_outlined,
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
          onPressed: () {
            alertDialogNameAlbum(context);
          }),
    );
  }

  alertDialogNameAlbum(BuildContext context) {
    TextEditingController controller = TextEditingController();
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
                      nomiAlbum.add(controller.text);
                      _aumentaNumeroListe();
                      Navigator.of(context).pop();
                    },
                    child: Text('Conferma')),
                Container(
                  width: 50,
                ),
              ]);
        });
  }

  void _aumentaNumeroListe() {
    setState(() {
      numeroListe++;
      numeroAlbum++;
    });
  }
}
