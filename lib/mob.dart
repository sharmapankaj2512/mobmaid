class Mob {
  final _participants = [];

  participants() {
    return _participants;
  }

  join(String participant) {
    _participants.add(participant);
  }

  void rotate() {
    if (_participants.isNotEmpty) {
      var firstParticipant = _participants.removeAt(0);
      _participants.add(firstParticipant);
    }
  }
}
