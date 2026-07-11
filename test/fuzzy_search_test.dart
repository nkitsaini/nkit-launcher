import 'package:flutter_test/flutter_test.dart';
import 'package:nkit_launcher/fuzzy_search.dart';

void main() {
  group('FuzzySearch', () {
    test('matches non-contiguous letters in order', () {
      final match = FuzzySearch.match('gmap', 'Google Maps');

      expect(match, isNotNull);
      expect(match!.matchedIndexes, containsAll(<int>{0, 7, 8, 9}));
    });

    test('requires every whitespace-separated query term', () {
      expect(FuzzySearch.match('goo map', 'Google Maps'), isNotNull);
      expect(FuzzySearch.match('goo calendar', 'Google Maps'), isNull);
    });

    test('favours a consecutive, word-start match', () {
      final wordStart = FuzzySearch.match('map', 'Google Maps');
      final scattered = FuzzySearch.match('map', 'My Awesome Project');

      expect(wordStart, isNotNull);
      expect(scattered, isNotNull);
      expect(wordStart!.score, greaterThan(scattered!.score));
    });
  });
}
