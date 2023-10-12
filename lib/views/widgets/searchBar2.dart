import 'package:flutter/material.dart';
import 'package:wallpaper01/views/screens/search.dart';

// ignore: must_be_immutable
class SearchBar2 extends StatelessWidget {
  SearchBar2({super.key});

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _handleSearch(String query) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchScreen(query: query),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Color.fromARGB(14, 154, 153, 153),
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                errorBorder: InputBorder.none,
                hintText: "Search Wallpapers",
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
              ),
              onSubmitted: (value) {
                // Handle the enter key press here
                _handleSearch(value);
              },
            ),
          ),
          InkWell(
            onTap: () {
              _handleSearch(_searchController.text);
            },
            child: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
