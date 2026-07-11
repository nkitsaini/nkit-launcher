/// A compact, fzf-inspired subsequence matcher.
///
/// Matches are case-insensitive, query words are combined with AND semantics,
/// and scores favour matches at the start of a word and consecutive letters.
class FuzzyMatch {
  const FuzzyMatch({
    required this.score,
    required this.matchedIndexes,
  });

  final int score;
  final Set<int> matchedIndexes;
}

class FuzzySearch {
  FuzzySearch._();

  /// Returns a scored match for [query] in [candidate], or `null` when every
  /// query word cannot be found as an ordered subsequence.
  static FuzzyMatch? match(String query, String candidate) {
    final terms = query
        .trim()
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .where((term) => term.isNotEmpty);
    if (terms.isEmpty) {
      return const FuzzyMatch(score: 0, matchedIndexes: <int>{});
    }

    final candidateLower = candidate.toLowerCase();
    var totalScore = 0;
    final matchedIndexes = <int>{};

    for (final term in terms) {
      final termMatch = _matchTerm(term, candidate, candidateLower);
      if (termMatch == null) {
        return null;
      }
      totalScore += termMatch.score;
      matchedIndexes.addAll(termMatch.matchedIndexes);
    }

    // Prefer a compact candidate when matches are otherwise equally strong.
    totalScore -= candidate.length;
    return FuzzyMatch(score: totalScore, matchedIndexes: matchedIndexes);
  }

  static FuzzyMatch? _matchTerm(
    String term,
    String candidate,
    String candidateLower,
  ) {
    final termLength = term.length;
    final candidateLength = candidate.length;
    final scores = List<List<int?>>.generate(
      termLength,
      (_) => List<int?>.filled(candidateLength, null),
    );
    final paths = List<List<int?>>.generate(
      termLength,
      (_) => List<int?>.filled(candidateLength, null),
    );

    for (var termIndex = 0; termIndex < termLength; termIndex++) {
      for (var candidateIndex = 0;
          candidateIndex < candidateLength;
          candidateIndex++) {
        if (term[termIndex] != candidateLower[candidateIndex]) {
          continue;
        }

        final characterScore = 10 +
            _boundaryBonus(candidate, candidateIndex) +
            (candidateIndex == 0 ? 8 : 0);
        if (termIndex == 0) {
          scores[termIndex][candidateIndex] = characterScore;
          continue;
        }

        for (var previousIndex = 0;
            previousIndex < candidateIndex;
            previousIndex++) {
          final previousScore = scores[termIndex - 1][previousIndex];
          if (previousScore == null) {
            continue;
          }

          final gap = candidateIndex - previousIndex - 1;
          final score = previousScore + characterScore + (gap == 0 ? 14 : -gap);
          if (scores[termIndex][candidateIndex] == null ||
              score > scores[termIndex][candidateIndex]!) {
            scores[termIndex][candidateIndex] = score;
            paths[termIndex][candidateIndex] = previousIndex;
          }
        }
      }
    }

    var bestIndex = -1;
    var bestScore = -0x7fffffff;
    for (var candidateIndex = 0;
        candidateIndex < candidateLength;
        candidateIndex++) {
      final score = scores[termLength - 1][candidateIndex];
      if (score != null && score > bestScore) {
        bestScore = score;
        bestIndex = candidateIndex;
      }
    }
    if (bestIndex < 0) {
      return null;
    }

    final indexes = <int>{};
    for (var termIndex = termLength - 1; termIndex >= 0; termIndex--) {
      indexes.add(bestIndex);
      bestIndex = paths[termIndex][bestIndex] ?? -1;
    }
    return FuzzyMatch(score: bestScore, matchedIndexes: indexes);
  }

  static int _boundaryBonus(String candidate, int index) {
    if (index == 0) {
      return 12;
    }
    final previous = candidate[index - 1];
    final current = candidate[index];
    if (_isSeparator(previous) ||
        (previous == previous.toLowerCase() &&
            current == current.toUpperCase())) {
      return 9;
    }
    return 0;
  }

  static bool _isSeparator(String character) =>
      character == ' ' ||
      character == '-' ||
      character == '_' ||
      character == '.' ||
      character == '/' ||
      character == ':';
}
