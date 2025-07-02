import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/home/category/source_name_widget.dart';
import 'package:news/ui/home/news/news_widget.dart';
import 'package:news/utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  List<Source> sourceList;

  SourceTabWidget({required this.sourceList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
                isScrollable: true,
                // labelPadding: EdgeInsets.zero,
                tabAlignment: TabAlignment.start,
                indicatorColor: Theme.of(context).indicatorColor,
                dividerColor: AppColors.transparentColor,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                tabs: widget.sourceList.map((source) {
                  return SourceNameWidget(
                      source: source,
                      isSelected:
                          selectedIndex == widget.sourceList.indexOf(source));
                }).toList()),
            Expanded(
                child: NewsWidget(source: widget.sourceList[selectedIndex]))
          ],
        ));
  }
}
