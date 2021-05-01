import 'package:flutter/material.dart';

int selectedValue;
TextEditingController numeroStanzeController = TextEditingController();

class PaginaPreventivo extends StatefulWidget {
  PaginaPreventivo();
  @override
  _PaginaPreventivoState createState() => _PaginaPreventivoState();
}

class _PaginaPreventivoState extends State<PaginaPreventivo> {
  //int selectedValue;
  List<String> tipoMateriale = [
    'Lavabile',
    'Traspirante',
    'Travertino',
    'Calce'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Preventivo'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 30,
            ),
            TextField(
              controller: numeroStanzeController,
              style: TextStyle(fontSize: 20, color: Colors.black),
              decoration: InputDecoration(
                  hintText: 'Inserisci numero di stanze',
                  hintStyle: TextStyle(fontSize: 18)),
            ),
            Container(
              height: 30,
            ),
            DropdownButton(
                hint: Text('Scegliere un materiale'),
                value: selectedValue,
                items: [
                  DropdownMenuItem(value: 0, child: Text(tipoMateriale[0])),
                  DropdownMenuItem(value: 1, child: Text(tipoMateriale[1])),
                  DropdownMenuItem(value: 2, child: Text(tipoMateriale[2])),
                  DropdownMenuItem(value: 3, child: Text(tipoMateriale[3]))
                ],
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                }),
            Container(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                SnackBar snackBar = SnackBar(
                    content: Text(
                        "Numero stanze da dipingere: " +
                            numeroStanzeController.text +
                            "\nTipo di materiale: " +
                            tipoMateriale[selectedValue],
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    backgroundColor: Colors.black);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text('Richiedi Preventivo'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  side: BorderSide(color: Colors.red, width: 2),
                  elevation: 10,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
            )
          ],
        ),
      ),
    );
  }
}
