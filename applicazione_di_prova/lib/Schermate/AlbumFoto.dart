import 'package:flutter/material.dart';

class AlbumFoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Album Foto',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_a_photo_outlined,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        onPressed: () {},
      ),
    );
  }
}
