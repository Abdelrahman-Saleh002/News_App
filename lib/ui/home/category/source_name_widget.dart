import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';

class SourceNameWidget extends StatelessWidget {
  bool isSelected;

  Source source;

  SourceNameWidget({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(
      source.name ?? '',
      style: isSelected
          ? Theme.of(context).textTheme.headlineLarge
          : Theme.of(context).textTheme.headlineMedium,
    );
  }
}
