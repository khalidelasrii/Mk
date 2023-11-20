import 'package:flutter/material.dart';

/// Flutter code sample for pinned [SearchAnchor] while scrolling.

class PinnedSearchBarApp extends StatefulWidget {
  const PinnedSearchBarApp({super.key});

  @override
  State<PinnedSearchBarApp> createState() => _PinnedSearchBarAppState();
}

class _PinnedSearchBarAppState extends State<PinnedSearchBarApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true, colorSchemeSeed: const Color(0xff6750a4)),
      home: Scaffold(
        body: SafeArea(
          child: SearchAnchor(
            searchController: SearchController(),
            builder: (context, controller) {
              return SearchBar(
                controller: controller,
                onChanged: (value) {
                  controller.openView();
                  print(value);
                },
              );
            },
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return List<Widget>.generate(
                5,
                (int index) {
                  return ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text('Initial list item $index'),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
