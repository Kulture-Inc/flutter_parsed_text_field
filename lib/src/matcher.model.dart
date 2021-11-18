part of flutter_parsed_text_field;

enum MatcherSearchStyle {
  /// does suggestion start with search criteria, case-sensitive
  startsWith,
  /// does suggestion contain the search criteria, case-sensitive
  contains,
  /// does suggestion start with search criteria, case-insensitive
  iStartsWith,
  /// does suggestion contain the search criteria, case-isensitive
  iContains,
}

class Matcher<T> {
  /// The single character that will cause the [suggestions] to start appearing
  final String trigger;

  /// A list of objects that should be used to populate the suggestions popup
  final List<T> suggestions;

  /// A function to return the id of the suggestion.
  ///
  /// Eg {userId: 'uid3000', displayName: 'Ironman'}
  /// idProp = (suggestion) => suggestion.userId
  final String Function(dynamic suggestion) idProp;

  /// A function to return the display of the suggestion.
  ///
  /// Eg {userId: 'uid3000', displayName: 'Ironman'}
  /// idProp = (suggestion) => suggestion.displayName
  final String Function(dynamic suggestion) displayProp;

  /// How the search logic should be applied
  final MatcherSearchStyle searchStyle;

  /// A function to return the prop for sorting the final results BEFORE [FlutterParsedTextField.suggestionLimit] is applied
  final int Function(dynamic a, dynamic b)? resultSort;

  /// A function to return the prop for sorting the final results AFTER [FlutterParsedTextField.suggestionLimit] is applied
  final int Function(dynamic a, dynamic b)? finalResultSort;

  /// A function which will stringify the suggestion
  ///
  /// Eg {userId: 'uid3000', displayName: 'Ironman'}
  /// stringify = (trigger, suggestion) => '[$trigger${suggestion.displayName}${suggestion.userId}]'
  final String Function(String trigger, dynamic suggestion) stringify;

  /// The [RegExp] that will match stringified suggestions and enable parsing
  ///
  /// Eg "Hey [[@Ironman:uid3000]]" => "Hey @Ironman"
  final RegExp parseRegExp;

  /// A function to parse the stringified suggestion back into an object.
  final T Function(RegExp regex, String stringifiedSuggestion) parse;

  /// When a suggestion has been tapped and added to the text field, it will be returned.
  /// This allows you to, say, update the #hashtag list when an @mention has been added.
  final Function(String trigger, dynamic suggestion)? onSuggestionAdded;

  /// The [TextStyle] to be applied to matches within the text field
  final TextStyle? style;

  /// Returns a widget that will be used in the suggestion popup's [ListView]
  final Widget Function(Matcher matcher, dynamic suggestion)? suggestionBuilder;

  /// True if the [style] should always be applied regardless if it matches a suggestion; false otherwise.
  ///
  /// This is good to set as true for #hashtags when there typically isn't a predefined list.
  /// This is good to set as false for @mentions when there typically is a predefined list.
  final bool alwaysHighlight;

  /// Starting index in the text field of the current match
  ///
  /// Eg "Hey @Iro" would be 4.
  int? indexOfMatch;

  /// The length of the partial match (including trigger)
  ///
  /// Eg "Hey @Ir" would be 3.
  int? lengthOfMatch;

  /// This is the core of what makes flutter_parsed_text_field work. This is where you define what [trigger]s suggestions,
  /// what those [suggestions] are, and how they are used.
  Matcher({
    required this.trigger,
    required this.suggestions,
    required this.idProp,
    required this.displayProp,
    this.searchStyle = MatcherSearchStyle.iContains,
    this.resultSort,
    this.finalResultSort,
    required this.stringify,
    required this.parse,
    required this.parseRegExp,
    this.onSuggestionAdded,
    this.style,
    this.suggestionBuilder,
    this.alwaysHighlight = false,
  }) : assert(trigger.length == 1);

  Type typeOf() => T;

  String get regexPattern {
    final regexes = [
      if (alwaysHighlight) '[A-Za-z0-9]+',
      ...suggestions.map(displayProp).map((s) => RegExp.escape(s)).sortedDescending(),
    ].map((s) => '$trigger$s');

    return regexes.isEmpty ? '' : '(${regexes.join('|')})';
  }
}
