import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Participant extends StatelessWidget {
  final String participant;

  const Participant({Key? key, required this.participant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.7,
        heightFactor: 0.3,
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: Text(
                key: Key(participant),
                participant,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            )));
  }
}
