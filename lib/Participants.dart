import 'package:flutter/cupertino.dart';

import 'Participant.dart';

class Participants extends StatelessWidget {
  final List<dynamic> participants;

  const Participants({Key? key, required this.participants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            children: makeParticipants()));
  }

  makeParticipants() {
    return participants.map<Widget>((participant) {
      return Participant(participant: participant);
    }).toList();
  }
}
