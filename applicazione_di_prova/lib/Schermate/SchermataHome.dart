import 'package:flutter/material.dart';
import '../Schermate/Side_Drawer.dart';
//import 'package:shrink_sidemenu/shrink_sidemenu.dart';
//import './SideMenu.dart';

class SchermataHome extends StatefulWidget {
  SchermataHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SchermataHomeState createState() => _SchermataHomeState();
}

class _SchermataHomeState extends State<SchermataHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawerScrimColor: Colors.black,
      drawer: SideDrawer(),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //actions: <Widget>[
        // IconButton(icon: Icon(Icons.menu), onPressed: _mostraSnackBar)
        //],
        title: Text(widget.title, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: 20,
                height: 30,
              ),
              Image.network(
                  'https://preventivofacile.it/media/notizie/copertina/2015-12_pitture-decorative-per-interni-tutti-i-tipi-di-pitture-moderne-e-decorazioni-particolari-per-interni_121.jpg'),
              Container(
                width: 20,
                height: 50,
              ),
              Text('Dipintore \n' + 'Luca Zennaro',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold)),
              Container(
                width: 20,
                height: 50,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    side: BorderSide(color: Colors.black, width: 1),
                    elevation: 5,
                    minimumSize: Size(150, 50),
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    'Email',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  onPressed: _mostraSnackBar)
            ],
          ),
        ),
      ),
    );
  }

  void _mostraSnackBar() {
    SnackBar snackBar = SnackBar(
        content: Text("L'email di Luca è: \n" + "'luca.zennaro.73@gmail.com'",
            style: TextStyle(color: Colors.black, fontSize: 20)),
        backgroundColor: Colors.white);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
