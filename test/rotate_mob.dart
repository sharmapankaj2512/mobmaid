import 'package:flutter_test/flutter_test.dart';
import 'package:mobmaid/Mob.dart';

void main() {
  test('two participants', () {
    final mob = Mob();
    mob.join("alex");
    mob.join("chandra");
    mob.rotate();
    expect(mob.participants(), ["chandra", "alex"]);
  });
}