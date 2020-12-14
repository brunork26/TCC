import 'package:flutter/material.dart';
import 'VSD.dart';

class MontaVSD extends StatefulWidget {
  Widget child;

  MontaVSD({this.child});

  MontaVSDState montaVSDState;

  @override
  MontaVSDState createState() {
    montaVSDState = MontaVSDState();
    return montaVSDState;
  }

  static MontaVSDState of(BuildContext context) =>
      context.findAncestorStateOfType<MontaVSDState>();
}

class MontaVSDState extends State<MontaVSD> {
  Widget child;

  MontaVSDState({this.child}) {}

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
