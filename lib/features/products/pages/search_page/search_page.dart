import 'package:flutter/material.dart';

import '../search_product_page/search_product_page.dart';

class Search extends SearchDelegate {
  @override
  TextStyle? get searchFieldStyle => TextStyle(
        fontSize: 17,
        color: Colors.grey[700],
        fontFamily: 'Poppins',
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.close,
          size: 19,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 18,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Widget _sortingType({required title, required icon}) {
      return TextButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchProductPage(query: query),
            ),
          );
        },
        icon: Icon(icon),
        label: Text(title),
      );
    }

    return SingleChildScrollView(child: SearchProductPage(query: query));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search for Products'),
    );
  }

  Widget buildSearchField(BuildContext context) {
    return const TextField(
      style: TextStyle(fontSize: 13.0), // Set the desired text size here
      decoration: InputDecoration(
        hintText: 'Search...',
      ),
    );
  }
}
