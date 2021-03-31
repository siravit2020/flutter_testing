import 'package:flutter_testing/model/favorites.dart';
import 'package:test/test.dart';

void main() {
  group('App Provider Tests', () {
    var favorites = Favorites();

    test('An item should be removed', () {
      var number = 45;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
      favorites.remove(number);
      expect(favorites.items.contains(number), false);
    });
  });
}
