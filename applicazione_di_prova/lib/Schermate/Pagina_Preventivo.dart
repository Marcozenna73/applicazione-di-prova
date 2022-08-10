import 'package:applicazione_di_prova/Schermate/SchermataHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Dati/Stanza.dart';

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
  int numeroStanze = 0; //int.tryParse(numeroStanzeController.text);
  List<Stanza> stanzeDaDipingere = [];
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
              keyboardType: TextInputType.number,
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
              child: Text('Riepilogo Preventivo'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  side: BorderSide(color: Colors.red, width: 2),
                  elevation: 10,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            Container(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                numeroStanze = int.tryParse(numeroStanzeController.text);
                if (numeroStanze > 0) {
                  openAlertDialog(context, numeroStanze);
                } else if (numeroStanze == 0) {
                  SnackBar snackBar2 = SnackBar(
                      content: Text('Numero di stanze troppo basso',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      backgroundColor: Colors.black);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar2);
                } else {
                  SnackBar snackBar3 = SnackBar(
                      content: Text('Inserire numero di stanze',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      backgroundColor: Colors.black);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar3);
                }
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

  openAlertDialog(BuildContext context, int numeroStanze) {
    Stanza stanza;
    TextEditingController nomeStanza = TextEditingController();
    TextEditingController lunghezzaController = TextEditingController();
    TextEditingController larghezzaController = TextEditingController();
    TextEditingController altezzaController = TextEditingController();
    int valoreSelezionato;
    List<String> tipoMaterialeStanza = [
      'Lavabile',
      'Traspirante',
      'Travertino',
      'Calce'
    ];
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Inserire i dati richiesti:"),
            content: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                TextField(
                  controller: nomeStanza,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(hintText: 'Inserire nome stanza'),
                ),
                TextField(
                  controller: lunghezzaController,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(hintText: 'Lunghezza stanza'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: larghezzaController,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(hintText: 'Larghezza stanza'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: altezzaController,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(hintText: 'Altezza stanza'),
                  keyboardType: TextInputType.number,
                ),
                DropdownButton(
                    hint: Text('Scegliere un materiale'),
                    value: valoreSelezionato,
                    items: [
                      DropdownMenuItem(
                          value: 0, child: Text(tipoMaterialeStanza[0])),
                      DropdownMenuItem(
                          value: 1, child: Text(tipoMaterialeStanza[1])),
                      DropdownMenuItem(
                          value: 2, child: Text(tipoMaterialeStanza[2])),
                      DropdownMenuItem(
                          value: 3, child: Text(tipoMaterialeStanza[3]))
                    ],
                    onChanged: (valore) {
                      setState(() {
                        valoreSelezionato = valore;
                      });
                    })
              ]),
            ),
            actions: [
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Indietro')),
                  Container(
                    width: 50,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {
                        stanza = Stanza(
                            nomeStanza.text,
                            double.tryParse(lunghezzaController.text),
                            double.tryParse(larghezzaController.text),
                            double.tryParse(altezzaController.text));
                        stanzeDaDipingere.add(stanza);
                        numeroStanze--;
                        if (numeroStanze == 0) {
                          openFinalAlertDialog();
                        } else {
                          openAlertDialog(context, numeroStanze);
                        }
                      },
                      child: Text('Conferma'))
                ],
              )
            ],
          );
        });
  }

  openFinalAlertDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Richiedere un altro preventivo?"),
              content: Row(children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaginaPreventivo()));
                    },
                    child: Text('Sì')),
                Container(
                  width: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      while (Navigator.canPop(context)) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('No'))
              ]));
        });
  }
}
