import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobmaid/main.dart';
import 'package:mobmaid/mob.dart';

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

  testWidgets('acceptance', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.enterText(find.byKey(const Key('participant_name')), 'ria');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.enterText(find.byKey(const Key('participant_name')), 'alex');
    await tester.testTextInput.receiveAction(TextInputAction.done);

    expect(find.text('alex'), findsOneWidget);
    expect(find.text('ria'), findsOneWidget);
    expect(find.text('pinto'), findsNothing);
  });
}

