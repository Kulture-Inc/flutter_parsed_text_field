part of flutter_parsed_text_field;

///
class SuggestionApplier<T> with ChangeNotifier {
  Matcher<T>? _matcher;
  T? _suggestionToApply;

  Matcher<T>? get matcher => _matcher;

  T? get suggestionToApply => _suggestionToApply;

  bool get isValid => _matcher != null && _suggestionToApply != null;

  /// Let the [FlutterParsedTextField] know that you have selected a suggestion and want it applied to the text field.
  void updateSuggestion({
    required Matcher<T> matcher,
    required T suggestionToApply,
  }) {
    _matcher = matcher;
    _suggestionToApply = suggestionToApply;

    notifyListeners();
  }
}
