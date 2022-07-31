class Mob {
  final _participants = [];

  participants() {
    return _participants;
  }

  join(String participant) {
    _participants.add(participant);
  }
}