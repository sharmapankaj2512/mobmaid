import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobmaid/Mob.dart';
import 'package:mobmaid/main.dart';

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

  testWidgets('rotate mob', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.enterText(
        find.byKey(const Key('participant_name')), 'test-ria');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.enterText(
        find.byKey(const Key('participant_name')), 'test-alex');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.enterText(
        find.byKey(const Key('timer')), '1');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.tap(find.byKey(const Key('start_mob')));
    await tester.pump(const Duration(minutes: 2));

    expect(
        find.textContaining("test-")
            .evaluate()
            .map((e) => e.widget)
            .whereType<Text>()
            .map((e) => e.data)
            .toList(),
        ['test-alex', 'test-ria']);
  });
}
