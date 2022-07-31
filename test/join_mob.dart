import 'package:flutter_test/flutter_test.dart';

void main() {
  test('one participant joins the mob', () {
    final mob = Mob();
    mob.join("alex");
    expect(mob.participants(), ["alex"]);
  });

  test('two participants join the mob', () {
    final mob = Mob();
    mob.join("alpha");
    mob.join("beta");
    expect(mob.participants(), ["alpha", "beta"]);
  });
}

class Mob {
  final _participants = [];

  participants() {
    return _participants;
  }

  join(String participant) {
    _participants.add(participant);
  }
}