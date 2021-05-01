import 'package:flutter/material.dart';

class PaginaInformazioni extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Informazioni'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nome:',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                  Container(
                    width: 20,
                  ),
                  Text(
                    'Luca',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cognome:',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                  Container(
                    width: 20,
                  ),
                  Text(
                    'Zennaro',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Numero di telefono:',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                  Container(
                    width: 20,
                  ),
                  Text(
                    '3488242070',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Indirizzo email: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                  Text(
                    ' luca.zennaro.73@gmail.com',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Indirizzo:',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                  Container(
                    width: 20,
                  ),
                  Text(
                    'Via Toscana N° 1',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
