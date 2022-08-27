import 'package:flutter_test/flutter_test.dart';
import 'package:mobmaid/Mob.dart';

void main() {
  test('zero participants', () {
    final mob = Mob();
    mob.rotate();
    expect(mob.participants(), []);
  });

  test('one participants', () {
    final mob = Mob();
    mob.join("alex");
    mob.rotate();
    expect(mob.participants(), ["alex"]);
  });

  test('two participants', () {
    final mob = Mob();
    mob.join("alex");
    mob.join("chandra");
    mob.rotate();
    expect(mob.participants(), ["chandra", "alex"]);
  });
}