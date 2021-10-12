import 'package:flutter/material.dart';
import 'package:flutter_parsed_text_field/flutter_parsed_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Parsed Text Field',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class Avenger {
  final String userId;
  final String displayName;

  Avenger({
    required this.userId,
    required this.displayName,
  });
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final flutterParsedTextFieldController = FlutterParsedTextFieldController();

  /// this is what sends the selected suggestion down to FlutterParsedTextField
  final suggestionApplier = SuggestionApplier();

  Matcher? matcher;
  List? matchedSuggestions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Parsed Text Field'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ChangeNotifierProvider<SuggestionApplier>.value(
              value: suggestionApplier,
              builder: (_, __) => FlutterParsedTextField(
                controller: flutterParsedTextFieldController,
                disableSuggestionOverlay: true,
                suggestionLimit: 5,
                suggestionMatches: (matcher, suggestions) {
                  /// returns the matcher and suggestions based on your input
                  setState(() {
                    this.matcher = matcher;
                    matchedSuggestions = suggestions;
                  });
                },
                matchers: [
                  Matcher<Avenger>(
                    trigger: "@",
                    suggestions: [
                      Avenger(userId: '3000', displayName: 'Ironman'),
                      Avenger(userId: '4000', displayName: 'Hulk'),
                      Avenger(userId: '5000', displayName: 'Black Widow'),
                    ],
                    idProp: (avenger) => avenger.userId,
                    displayProp: (avenger) => avenger.displayName,
                    style: const TextStyle(color: Colors.red),
                    stringify: (trigger, avenger) {
                      return '[$trigger${avenger.displayName}:${avenger.userId}]';
                    },
                    parse: (avengerString) {
                      final avenger = RegExp(r"\[(@([^\]]+)):([^\]]+)\]").firstMatch(avengerString);

                      if (avenger != null) {
                        return Avenger(
                          userId: avenger.group(3)!,
                          displayName: avenger.group(2)!,
                        );
                      }

                      throw 'Avenger not found';
                    },
                  ),
                ],
              ),
            ),
            if (matcher != null && matchedSuggestions != null)
            /// ugly UI, but it illustrates the point
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 4,
                    child: ListView.builder(
                      itemCount: matchedSuggestions!.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        final suggestion = matchedSuggestions![index] as Avenger;

                        return ListTile(
                          title: Text('@${suggestion.displayName}'),
                          subtitle: Text(suggestion.userId),
                          onTap: () {
                            /// send the tapped suggestion down to FlutterParsedTextField for processing
                            suggestionApplier.updateSuggestion(
                              matcher: matcher!,
                              suggestionToApply: suggestion,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            TextButton(
              child: const Text('Clear'),
              onPressed: () => flutterParsedTextFieldController.clear(),
            )
          ],
        ),
      ),
    );
  }
}
