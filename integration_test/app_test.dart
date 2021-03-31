import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {

    
  group('Testing App Performance Tests', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized() as IntegrationTestWidgetsFlutterBinding;

    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
      testWidgets('input test', (tester) async {
      await tester.pumpWidget(TestingApp());

      var username = find.byKey(ValueKey('username'));
      await tester.tap(username);
      await tester.enterText(username, 'admin');
      await tester.pumpAndSettle(Duration(seconds: 1));
      var password = find.byKey(ValueKey('password'));
      await tester.tap(password);
      await tester.enterText(password, '1234');
      await tester.pumpAndSettle(Duration(seconds: 1));
      var submit = find.byKey(ValueKey('submit'));
      await tester.tap(submit);
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('login success'), findsOneWidget);
      await tester.pump(new Duration(milliseconds: 2000));
      final listFinder = find.byType(ListView);

      await binding.watchPerformance(() async {
        await tester.fling(listFinder, Offset(0, -500), 10000);
        await tester.pumpAndSettle();

        await tester.fling(listFinder, Offset(0, 500), 10000);
        await tester.pumpAndSettle();
      }, reportKey: 'scrolling_summary');
      final iconKeys = [
        'icon_0',
        'icon_1',
        'icon_2',
      ];

      for (var icon in iconKeys) {
        await tester.tap(find.byKey(ValueKey(icon)));
        await tester.pumpAndSettle(Duration(seconds: 1));

        expect(find.text('Added to favorites.'), findsOneWidget);
      }

      await tester.tap(find.text('Favorites'));
      await tester.pumpAndSettle();

      final removeIconKeys = [
        'remove_icon_0',
        'remove_icon_1',
        'remove_icon_2',
      ];

      for (final iconKey in removeIconKeys) {
        await tester.tap(find.byKey(ValueKey(iconKey)));
        await tester.pumpAndSettle(Duration(seconds: 1));

        expect(find.text('Removed from favorites.'), findsOneWidget);
      }
    });
    // testWidgets('Scrolling test', (tester) async {
    //   await tester.pumpWidget(TestingApp());

    //   final listFinder = find.byType(ListView);

    //   await binding.watchPerformance(() async {
    //     await tester.fling(listFinder, Offset(0, -500), 10000);
    //     await tester.pumpAndSettle();

    //     await tester.fling(listFinder, Offset(0, 500), 10000);
    //     await tester.pumpAndSettle();
    //   }, reportKey: 'scrolling_summary');
    // });
    // testWidgets('Favorites operations test', (tester) async {
    //   await tester.pumpWidget(TestingApp());

    //   final iconKeys = [
    //     'icon_0',
    //     'icon_1',
    //     'icon_2',
    //   ];

    //   for (var icon in iconKeys) {
    //     await tester.tap(find.byKey(ValueKey(icon)));
    //     await tester.pumpAndSettle(Duration(seconds: 1));

    //     expect(find.text('Added to favorites.'), findsOneWidget);
    //   }

    //   await tester.tap(find.text('Favorites'));
    //   await tester.pumpAndSettle();

    //   final removeIconKeys = [
    //     'remove_icon_0',
    //     'remove_icon_1',
    //     'remove_icon_2',
    //   ];

    //   for (final iconKey in removeIconKeys) {
    //     await tester.tap(find.byKey(ValueKey(iconKey)));
    //     await tester.pumpAndSettle(Duration(seconds: 1));

    //     expect(find.text('Removed from favorites.'), findsOneWidget);
    //   }
    // });
  });
}
