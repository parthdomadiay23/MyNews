import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:prodt/api/api_provider.dart';
import 'package:prodt/model/MyNewsModel.dart';

class NewsController extends GetxController {
  var lstMovie = <Data>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  fetchData({String category = "all"}) async {
    MyNewsModel objMyNewsModel = await ApiProvider().getNewsList(category: category);
    if (objMyNewsModel.success == true) {
      lstMovie.clear();
      for (var i = 0; i < objMyNewsModel.data!.length; i++) {
        lstMovie.add(objMyNewsModel.data![i]);
      }
    }
  }
}
