import 'package:applicazione_di_prova/Schermate/GalleriaPro.dart';
import 'package:flutter/material.dart';
import '../Schermate/Pagina_Preventivo.dart';
import '../Schermate/Galleria.dart';
import '../Schermate/Pagina_Informazioni.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Center(
            child: Column(
              children: [
                DrawerHeader(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                      ),
                      Text('SideMenu', style: TextStyle(fontSize: 20)),
                      //Image(image: image)
                    ],
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.euro),
            title: Text('Richiedi un preventivo'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaginaPreventivo()));
            },
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Galleria'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Galleria()));
            },
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Galleria Pro'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GalleriaPro()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline_rounded),
            title: Text('Informazioni'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaginaInformazioni()));
            },
          )
        ],
      ),
    );
  }
}
