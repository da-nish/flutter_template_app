

import 'package:flutter/material.dart';
import 'package:poc_flutter_app/app/screens/listview_screen/widget/listview_widget.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Screen'),
      ),
      
      body: ListviewWidget()
    );
  }
}