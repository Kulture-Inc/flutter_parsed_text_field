part of flutter_parsed_text_field;

class FlutterParsedTextFieldController extends TextEditingController {
  /// The list of matchers that are to be recognized in this text field
  List<Matcher> matchers = List<Matcher>.empty();

  RegExp get _combinedRegex => RegExp(matchers.map((m) => m.regexPattern).where((e) => e.isNotEmpty).join('|'));

  /// Return the stringified version of your text
  ///
  /// Eg "Hey @Ironman" => "Hey [[@Ironman:uid3000]]"
  String stringify() {
    if (matchers.isEmpty) {
      return text;
    }

    return text.splitMapJoin(
      _combinedRegex,
      onMatch: (Match match) {
        final display = match[0]!;
        final matcher = matchers.firstWhere((m) => m.regexPattern.isNotEmpty && RegExp(m.regexPattern).hasMatch(display));
        final suggestions = matcher.suggestions.where((e) => '${matcher.trigger}${matcher.displayProp(e)}' == display).toList();

        if (suggestions.isNotEmpty) {
          assert(suggestions.length == 1);
          return matcher.stringify(matcher.trigger, suggestions.first);
        }

        if (matcher.alwaysHighlight) {
          return matcher.stringify(matcher.trigger, display);
        }

        throw '`suggestions` is empty and `alwaysHighlight` is false.';
      },
      onNonMatch: (String text) => text,
    );
  }

  /// [text] is the default text if the text field
  FlutterParsedTextFieldController({
    String? text,
  }) : super(text: text);

  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    if (matchers.isEmpty) {
      return TextSpan(
        text: text,
        style: style,
      );
    }

    var widgets = List<InlineSpan>.empty(growable: true);

    text.splitMapJoin(
      _combinedRegex,
      onMatch: (Match match) {
        final matcher = matchers.firstWhere((m) => RegExp(m.regexPattern).hasMatch(match[0]!));

        widgets.add(
          TextSpan(
            text: match[0],
            style: style!.merge(matcher.style),
          ),
        );

        return '';
      },
      onNonMatch: (String text) {
        widgets.add(TextSpan(text: text, style: style));

        return '';
      },
    );

    return TextSpan(style: style, children: widgets);
  }
}
