import 'package:flutter/material.dart';
import 'package:news/model/category_model.dart';
import 'package:news/ui/home/category/source_details_view_model.dart';
import 'package:news/ui/home/category/source_tab_widget.dart';
import 'package:news/utils/app_colors.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourceDetailsViewModel viewModel = SourceDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<SourceDetailsViewModel>(
            builder: (context, viewModel, child) {
          //todo: error
          if (viewModel.errorMessage != null) {
            return Column(
              children: [
                Text(
                  viewModel.errorMessage!,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getSources(widget.category.id);
                    },
                    child: const Text('Try again'))
              ],
            );
          } else if (viewModel.sourcesList == null) {
            //todo: loading
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          } else {
            //todo: success
            return SourceTabWidget(sourceList: viewModel.sourcesList!);
          }
        })
        // FutureBuilder<SourceResponse?>(
        //     future: ApiManager.getSources(widget.category.id),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(
        //           child: CircularProgressIndicator(
        //             color: AppColors.greyColor,
        //           ),
        //         );
        //       }
        //       // error => client
        //       else if (snapshot.hasError) {
        //         return Column(
        //           children: [
        //             const Text('Something went wrong'),
        //             ElevatedButton(
        //                 onPressed: () {
        //                   ApiManager.getSources(widget.category.id);
        //                   setState(() {});
        //                 },
        //                 child: const Text('Try again'))
        //           ],
        //         );
        //       }
        //       // server => response  (success , error )
        //       // error
        //       if (snapshot.data!.status != 'ok') {
        //         return Column(
        //           children: [
        //             Text(snapshot.data!.message!),
        //             ElevatedButton(
        //                 onPressed: () {
        //                   ApiManager.getSources(widget.category.id);
        //                   setState(() {});
        //                 },
        //                 child: const Text('Try again'))
        //           ],
        //         );
        //       }
        //       // server => data
        //       var sourceList = snapshot.data!.sources ?? [];
        //       return SourceTabWidget(sourceList: sourceList);
        //     }),
        );
  }
}
