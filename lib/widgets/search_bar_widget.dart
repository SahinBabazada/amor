import 'package:amor/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        onSubmitted: (String value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchScreen(searchString: value),
            ),
          );
        },
        decoration: InputDecoration(
            hintText: "What are you looking for?",
            fillColor: const Color.fromRGBO(240, 240, 240, 1),
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.white),
            ),
            prefixIcon: const Icon(LineIcons.search)),
      ),
    );
  }
}
