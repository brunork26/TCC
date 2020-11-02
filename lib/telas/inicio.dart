import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  static const String id = 'inicio';
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  List<Widget> stack = [
    DragBox(Offset(0.0, 0.0), 'Box One', Colors.blueAccent, 0),
    DragBox(Offset(100.0, 0.0), 'Box two', Colors.red, 1),
    DragBox2(Offset(100.0, 0.0), 'Box three', Colors.green, 2),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: DragTarget(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) =>
                  Container(
                width: 200.0,
                height: 200.0,
                color: Colors.yellow,
                child: Center(
                  child: Text(
                    "Drag Here!",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              onAccept: (data) {
                print(data);
                setState(
                  () {
                    //stack[data].key =
                  },
                );
              },
            ),
          ),
          stack[0],
          stack[1],
          stack[2],
        ],
      ),
    );
  }
}

class DragBox extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;
  final int id;

  DragBox(this.initPos, this.label, this.itemColor, this.id);

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    double width = 100;
    double height = 100;
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        child: Container(
          width: width,
          height: height,
          color: widget.itemColor,
          child: Center(
            child: Text(
              "Drag",
              style: Theme.of(context).textTheme.headline,
            ),
          ),
        ),
        feedback: Container(
          child: Center(
            child: Text(
              "Drag",
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          color: widget.itemColor,
          width: width,
          height: height,
        ),
        onDraggableCanceled: (Velocity velocity, Offset offset) {
          setState(() => position = offset);
        },
      ),
    );
  }
}

class DragBox2 extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;
  final int id;

  DragBox2(this.initPos, this.label, this.itemColor, this.id);

  @override
  DragBox2State createState() => DragBox2State();
}

class DragBox2State extends State<DragBox2> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            position = Offset(
                position.dx + details.delta.dx, position.dy + details.delta.dy);
          });
        },
        child: Container(width: 100, height: 100, color: widget.itemColor),
      ),
    );
  }
}

/*
* class DragBox extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;
  final int id;

  DragBox(this.initPos, this.label, this.itemColor, this.id);

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    double width = 100;
    double height = 100;
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable<int>(
        data: widget.id,
        child: Container(
          width: 300.0,
          height: 300.0,
          color: widget.itemColor,
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
        onDragCompleted: () {
          setState(() {
            print('complete');
          });
        },
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            position = Offset(offset.dx, offset.dy - 20);
            // print(position);
          });
        },
        feedback: Container(
          width: 300.0,
          height: 300.0,
          color: widget.itemColor.withOpacity(0.5),
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/
