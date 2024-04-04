// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.

// All Attributes or Constants Here.

class CustomAlphabetScrollView extends StatelessWidget {
  final List<String> alphabet;
  final Function(int) onSelected;

  const CustomAlphabetScrollView({
    Key? key,
    required this.alphabet,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: alphabet
          .map(
            (letter) => InkWell(
              onTap: () {
                int index = alphabet.indexOf(letter);
                onSelected(index);
              },
              child: Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                child: Text(letter),
              ),
            ),
          )
          .toList(),
    );
  }
}
