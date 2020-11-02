import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tcc/componentes/VSD.dart';
import 'package:reorderables/reorderables.dart';
import 'package:tcc/componentes/box_teste.dart';

class Grade extends StatefulWidget {
  static const String id = 'grade';
  final List<Widget> _tiles = [
    BoxTeste(
      color: Colors.red,
      height: 100,
      width: 100,
    ),
    BoxTeste(
      color: Colors.blue,
      height: 100,
      width: 100,
    ),
  ];
  @override
  _GradeState createState() => _GradeState();
}

class _GradeState extends State<Grade> {
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      widget._tiles.insert(newIndex, widget._tiles.removeAt(oldIndex));
    });
  }

  Widget _corpoDaGrade() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReorderableWrap(
            spacing: 8.0,
            runSpacing: 4.0,
            padding: const EdgeInsets.all(8),
            children: widget._tiles,
            onReorder: _onReorder,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _corpoDaGrade(),
      ),
    );
  }
}

/*
Table(
  children:[
    TableRow(
     children[
       ANYWDIDGET();
       ANYWDIDGET();
       ANYWDIDGET();
     ]),
    TableRow(
      children[
       ANYWDIDGET();
       ANYWDIDGET();
       ANYWDIDGET();
      ]),
  ]
);


ANYWIDGET(){
 return...
}
 */
