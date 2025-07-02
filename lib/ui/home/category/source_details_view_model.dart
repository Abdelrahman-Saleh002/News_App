import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/SourceResponse.dart';

class SourceDetailsViewModel extends ChangeNotifier {
  //todo: hold data - handle logic
  List<Source>? sourcesList;

  String? errorMessage;

  void getSources(String categoryId) async {
    //todo: reinitialize
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSources(categoryId);
      if (response?.status == 'error') {
        //todo: error
        errorMessage = response!.message!;
      } else {
        //todo: success
        sourcesList = response!.sources;
      }
    } catch (e) {
      errorMessage = 'Error load source list.';
    }
    notifyListeners();
  }
}
