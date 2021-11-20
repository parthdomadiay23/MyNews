// ignore_for_file: unnecessary_new, avoid_print

import 'package:dio/dio.dart';
import 'package:prodt/model/MyNewsModel.dart';

class ApiProvider {
  Future<MyNewsModel> getNewsList({String category = "all"}) async {
    MyNewsModel objMovieModel = new MyNewsModel();

    String query = "https://inshortsapi.vercel.app/news?category=$category";

    Map<String, dynamic> head = {
      "Content-Type": "application/json",
    };
    try {
      var response = await Dio().get(
        query,
        options: Options(
          headers: head,
        ),
      );
      if (response.statusCode == 200) {
        objMovieModel = MyNewsModel.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return objMovieModel;
  }
}
