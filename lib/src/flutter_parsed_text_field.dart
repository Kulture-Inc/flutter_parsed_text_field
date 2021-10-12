part of flutter_parsed_text_field;

enum SuggestionPosition { above, below }

class FlutterParsedTextField extends StatefulWidget {
  /// Extension of [TextEditingController] which applies your styles to the parsed text.
  /// This also allows you to get the stringified value of your text.
  ///
  /// Eg "Hey @Ironman" => "Hey [[@Ironman:uid3000]]"
  final FlutterParsedTextFieldController? controller;

  /// A list of [Matcher]s that the widget will use to parse your text.
  final List<Matcher> matchers;

  /// Returns a list of the suggestions that match your current [Matcher].
  ///
  /// Eg "@I" would return "@Ironman" and "@BlackWidow"
  final Function(Matcher? matcher, List matches)? suggestionMatches;

  /// True if you don't want the built-in suggestion list to appear; false otherwise.
  final bool disableSuggestionOverlay;

  /// The max number of suggestions returned when matching
  final int? suggestionLimit;

  /// The position of the built-in suggestion popup; above or below the text field
  final SuggestionPosition? suggestionPosition;

  /****************************************************************
    FLUTTER TEXT FIELD PROPS
   ***************************************************************/

  /// {@macro flutter.widgets.editableText.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.editableText.decoration}
  final InputDecoration? decoration;

  /// {@macro flutter.widgets.editableText.keyboardType}
  final TextInputType? keyboardType;

  /// {@macro flutter.widgets.editableText.textInputAction}
  final TextInputAction? textInputAction;

  /// {@macro flutter.widgets.editableText.textCapitalization}
  final TextCapitalization textCapitalization;

  /// {@macro flutter.widgets.editableText.style}
  final TextStyle? style;

  /// {@macro flutter.widgets.editableText.strutStyle}
  final StrutStyle? strutStyle;

  /// {@macro flutter.widgets.editableText.textAlign}
  final TextAlign textAlign;

  /// {@macro flutter.widgets.editableText.textAlignVertical}
  final TextAlignVertical? textAlignVertical;

  /// {@macro flutter.widgets.editableText.textDirection}
  final TextDirection? textDirection;

  /// {@macro flutter.widgets.editableText.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.editableText.obscuringCharacter}
  final String obscuringCharacter;

  /// {@macro flutter.widgets.editableText.obscureText}
  final bool obscureText;

  /// {@macro flutter.widgets.editableText.autocorrect}
  final bool autocorrect;

  /// {@macro flutter.widgets.editableText.smartDashesType}
  final SmartDashesType? smartDashesType;

  /// {@macro flutter.widgets.editableText.smartQuotesType}
  final SmartQuotesType? smartQuotesType;

  /// {@macro flutter.widgets.editableText.enableSuggestions}
  final bool enableSuggestions;

  /// {@macro flutter.widgets.editableText.maxLines}
  final int? maxLines;

  /// {@macro flutter.widgets.editableText.minLines}
  final int? minLines;

  /// {@macro flutter.widgets.editableText.expands}
  final bool expands;

  /// {@macro flutter.widgets.editableText.readOnly}
  final bool readOnly;

  /// {@macro flutter.widgets.editableText.toolbarOptions}
  final ToolbarOptions? toolbarOptions;

  /// {@macro flutter.widgets.editableText.showCursor}
  final bool? showCursor;

  /// {@macro flutter.widgets.editableText.maxLength}
  final int? maxLength;

  /// {@macro flutter.widgets.editableText.maxLengthEnforcement}
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// {@macro flutter.widgets.editableText.onChanged}
  final ValueChanged<String>? onChanged;

  /// {@macro flutter.widgets.editableText.onEditingComplete}
  final VoidCallback? onEditingComplete;

  /// {@macro flutter.widgets.editableText.onSubmitted}
  final ValueChanged<String>? onSubmitted;

  /// {@macro flutter.widgets.editableText.onAppPrivateCommand}
  final AppPrivateCommandCallback? onAppPrivateCommand;

  /// {@macro flutter.widgets.editableText.inputFormatters}
  final List<TextInputFormatter>? inputFormatters;

  /// {@macro flutter.widgets.editableText.enabled}
  final bool? enabled;

  /// {@macro flutter.widgets.editableText.cursorWidth}
  final double cursorWidth;

  /// {@macro flutter.widgets.editableText.cursorHeight}
  final double? cursorHeight;

  /// {@macro flutter.widgets.editableText.cursorRadius}
  final Radius? cursorRadius;

  /// {@macro flutter.widgets.editableText.cursorColor}
  final Color? cursorColor;

  /// {@macro flutter.widgets.editableText.selectionHeightStyle}
  final ui.BoxHeightStyle selectionHeightStyle;

  /// {@macro flutter.widgets.editableText.selectionWidthStyle}
  final ui.BoxWidthStyle selectionWidthStyle;

  /// {@macro flutter.widgets.editableText.keyboardAppearance}
  final Brightness? keyboardAppearance;

  /// {@macro flutter.widgets.editableText.scrollPadding}
  final EdgeInsets scrollPadding;

  /// {@macro flutter.widgets.editableText.enableInteractiveSelection}
  final bool enableInteractiveSelection;

  /// {@macro flutter.widgets.editableText.selectionControls}
  final TextSelectionControls? selectionControls;

  /// {@macro flutter.widgets.editableText.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// {@macro flutter.widgets.editableText.onTap}
  final GestureTapCallback? onTap;

  /// {@macro flutter.widgets.editableText.mouseCursor}
  final MouseCursor? mouseCursor;

  /// {@macro flutter.widgets.editableText.buildCounter}
  final InputCounterWidgetBuilder? buildCounter;

  /// {@macro flutter.widgets.editableText.scrollPhysics}
  final ScrollPhysics? scrollPhysics;

  /// {@macro flutter.widgets.editableText.scrollController}
  final ScrollController? scrollController;

  /// {@macro flutter.widgets.editableText.autofillHints}
  final Iterable<String>? autofillHints;

  /// {@macro flutter.widgets.editableText.restorationId}
  final String? restorationId;

  /// {@macro flutter.widgets.editableText.enableIMEPersonalizedLearning}
  final bool enableIMEPersonalizedLearning;

  const FlutterParsedTextField({
    Key? key,
    this.controller,
    required this.matchers,
    this.suggestionMatches,
    this.disableSuggestionOverlay = false,
    this.suggestionLimit,
    this.suggestionPosition = SuggestionPosition.below,
    // flutter text field props
    this.focusNode,
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.onTap,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
  }) : super(key: key);

  @override
  FlutterParsedTextFieldState createState() => FlutterParsedTextFieldState();
}

class FlutterParsedTextFieldState extends State<FlutterParsedTextField> {
  late FlutterParsedTextFieldController _controller;

  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _suggestionOverlay;

  /// Apply the selected [suggestion] from the [matcher] to the text field.
  /// This will replace the partial text with the suggestion.
  ///
  /// Eg text field of "Hey @Ir", then applying will result in "Hey @Ironman"
  void applySuggestion<T>({
    required Matcher matcher,
    required T suggestion,
  }) {
    assert(matcher.indexOfMatch != null && matcher.lengthOfMatch != null);

    final replacement = '${matcher.trigger}${matcher.displayProp(suggestion)} ';
    _controller.text = _controller.value.text.replaceRange(
      matcher.indexOfMatch!,
      matcher.indexOfMatch! + matcher.lengthOfMatch!,
      replacement,
    );

    _controller.selection = TextSelection.fromPosition(TextPosition(offset: matcher.indexOfMatch! + replacement.length));

    if (matcher.onSuggestionAdded != null) {
      matcher.onSuggestionAdded!(matcher.trigger, suggestion);
    }
  }

  void _showSuggestionsOverlay<T>({
    required Matcher matcher,
    required List<T> suggestions,
  }) {
    final renderBox = context.findRenderObject() as RenderBox?;

    if (renderBox != null) {
      var size = renderBox.size;

      _hideSuggestionOverlay();

      _suggestionOverlay = OverlayEntry(
        builder: (context) => Positioned(
          width: size.width,
          height: (MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom) / 2,
          child: CompositedTransformFollower(
            link: _layerLink,
            followerAnchor: widget.suggestionPosition == SuggestionPosition.above ? Alignment.bottomCenter : Alignment.topCenter,
            targetAnchor: widget.suggestionPosition == SuggestionPosition.above ? Alignment.topCenter : Alignment.bottomCenter,
            showWhenUnlinked: false,
            child: Material(
              elevation: 4.0,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: suggestions.length,
                itemBuilder: (BuildContext context, int index) {
                  final suggestion = suggestions[index];

                  if (matcher.suggestionBuilder != null) {
                    return matcher.suggestionBuilder!(
                      matcher,
                      suggestion,
                    );
                  }

                  return ListTile(
                    title: Text('${matcher.trigger}${matcher.displayProp(suggestion)}'),
                    onTap: () => applySuggestion(
                      matcher: matcher,
                      suggestion: suggestion,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

      Overlay.of(context)!.insert(_suggestionOverlay!);
    }
  }

  void _hideSuggestionOverlay() {
    _suggestionOverlay?.remove();
    _suggestionOverlay = null;
  }

  void _suggestionListener() {
    final cursorPos = _controller.selection.baseOffset;

    if (cursorPos > 0) {
      final text = _controller.value.text;
      final lastIndexOfSpace = text.lastIndexOf(RegExp(r'\s'), cursorPos - 1);

      var indexOfMatch = lastIndexOfSpace + 1;

      final token = text.substring(indexOfMatch).split(RegExp(r'(\s)')).first;
      var lengthOfMatch = token.length;

      if (token.isNotEmpty) {
        final matchers = widget.matchers.where((matcher) => matcher.trigger == token[0]);

        if (matchers.length > 1) {
          throw 'Multiple matchers match $token';
        }

        if (matchers.length == 1) {
          final search = token.substring(1).toLowerCase();
          final matcher = matchers.first;

          var matchedSuggestions = matcher.suggestions.where((e) => matcher.displayProp(e).toLowerCase().contains(search)).toList();
          if (widget.suggestionLimit != null) {
            matchedSuggestions = matchedSuggestions.take(widget.suggestionLimit!).toList();
          }

          matcher.indexOfMatch = indexOfMatch;
          matcher.lengthOfMatch = lengthOfMatch;

          if (widget.suggestionMatches != null) {
            widget.suggestionMatches!(matcher, matchedSuggestions);
          }

          if (!widget.disableSuggestionOverlay) {
            _showSuggestionsOverlay(
              matcher: matcher,
              suggestions: matchedSuggestions,
            );
          }

          return;
        }
      }
    }

    if (widget.suggestionMatches != null) {
      widget.suggestionMatches!(null, []);
    }

    _hideSuggestionOverlay();
  }

  void _applySuggestionListener() {
    applySuggestion(
      matcher: context.read<SuggestionApplier>().matcher!,
      suggestion: context.read<SuggestionApplier>().suggestionToApply!,
    );

    _hideSuggestionOverlay();
  }

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? FlutterParsedTextFieldController();
    _controller.matchers = widget.matchers;

    _controller.addListener(_suggestionListener);
  }

  @override
  void didUpdateWidget(covariant FlutterParsedTextField oldWidget) {
    _controller.matchers = widget.matchers;

    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    context.watch<SuggestionApplier?>()?.removeListener(_applySuggestionListener);
    context.watch<SuggestionApplier?>()?.addListener(_applySuggestionListener);
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        decoration: widget.decoration,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        style: widget.style,
        strutStyle: widget.strutStyle,
        textAlign: widget.textAlign,
        textAlignVertical: widget.textAlignVertical,
        textDirection: widget.textDirection,
        readOnly: widget.readOnly,
        toolbarOptions: widget.toolbarOptions,
        showCursor: widget.showCursor,
        autofocus: widget.autofocus,
        obscuringCharacter: widget.obscuringCharacter,
        obscureText: widget.obscureText,
        autocorrect: widget.autocorrect,
        smartDashesType: widget.smartDashesType,
        smartQuotesType: widget.smartQuotesType,
        enableSuggestions: widget.enableSuggestions,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        expands: widget.expands,
        maxLength: widget.maxLength,
        maxLengthEnforcement: widget.maxLengthEnforcement,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        onSubmitted: widget.onSubmitted,
        onAppPrivateCommand: widget.onAppPrivateCommand,
        inputFormatters: widget.inputFormatters,
        enabled: widget.enabled,
        cursorWidth: widget.cursorWidth,
        cursorHeight: widget.cursorHeight,
        cursorRadius: widget.cursorRadius,
        cursorColor: widget.cursorColor,
        selectionHeightStyle: widget.selectionHeightStyle,
        selectionWidthStyle: widget.selectionWidthStyle,
        keyboardAppearance: widget.keyboardAppearance,
        scrollPadding: widget.scrollPadding,
        dragStartBehavior: widget.dragStartBehavior,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        selectionControls: widget.selectionControls,
        onTap: widget.onTap,
        mouseCursor: widget.mouseCursor,
        buildCounter: widget.buildCounter,
        scrollController: widget.scrollController,
        scrollPhysics: widget.scrollPhysics,
        autofillHints: widget.autofillHints,
        restorationId: widget.restorationId,
        enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_suggestionListener);

    super.dispose();
  }
}
