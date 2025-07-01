import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/home/news/news_item.dart';
import 'package:news/ui/home/news/news_widget_view_model.dart';
import 'package:news/utils/app_colors.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsWidgetViewModel>(
          child: Text(
            'Hello',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          builder: (context, viewModel, child) {
            if (viewModel.errorMessage != null) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      viewModel.errorMessage!,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          ApiManager.getNewsBySourceId(widget.source.id ?? '');
                          setState(() {});
                        },
                        child: const Text('Try again!'))
                  ],
                ),
              );
            } else if (viewModel.newsList == null) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.greyColor,
                ),
              );
            } else {
              return ListView.builder(
            itemBuilder: (context, index) {
                  return Column(
                    children: [
                      child!,
                      NewsItem(news: viewModel.newsList![index]),
                    ],
                  );
                },
                itemCount: viewModel.newsList!.length,
              );
            }
          }),
    );
    // FutureBuilder<NewsResponse?>(
    //     future: ApiManager.getNewsBySourceId(widget.source.id ?? ""),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(
    //           child: CircularProgressIndicator(
    //             color: AppColors.greyColor,
    //           ),
    //         );
    //       } else if (snapshot.hasError) {
    //         return Center(
    //           child: Column(
    //             children: [
    //               const Text('Something went wrong.'),
    //               ElevatedButton(
    //                   onPressed: () {
    //                     ApiManager.getNewsBySourceId(widget.source.id ?? '');
    //                     setState(() {});
    //                   },
    //                   child: const Text('Try again!'))
    //             ],
    //           ),
    //         );
    //       }
    //       //server => response (success , error )
    //       if (snapshot.data!.status != 'ok') {
    //         return Center(
    //           child: Column(
    //             children: [
    //               Text(snapshot.data!.message!),
    //               ElevatedButton(
    //                   onPressed: () {
    //                     ApiManager.getNewsBySourceId(widget.source.id ?? '');
    //                     setState(() {});
    //                   },
    //                   child: const Text('Try again!'))
    //             ],
    //           ),
    //         );
    //       }
    //       var newsList = snapshot.data!.articles!;
    //       return ListView.builder(
    //         itemBuilder: (context, index) {
    //           return NewsItem(news: newsList[index]);
    //         },
    //         itemCount: newsList.length,
    //       );
    //     }),
  }
}
