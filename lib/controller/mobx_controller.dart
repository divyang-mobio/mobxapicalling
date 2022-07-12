import 'package:mobx/mobx.dart';
import '../models/api_model.dart';
import '../utils/api_calling.dart';

part 'mobx_controller.g.dart';

enum ApiState{loading , loaded , error}

class ApiController extends _ApiController with _$ApiController {
  ApiController(HttpServices httpServices) : super(httpServices);
}

abstract class _ApiController with Store {
  HttpServices httpServices;

  _ApiController(this.httpServices);

  @observable
  ApiState state =  ApiState.loading;

  @observable
  List<DataModel> data = [];

  List<DataModel> allData = [];


  @action
  searchTitle(String title){
    data = allData.where((element) {
      final titlelower = element.title.toLowerCase();
      final searchtext = title.toLowerCase();
      return titlelower.contains(searchtext);
    }).toList();
  }


  @action
  Future<void> getData() async {
    try {
      data = await httpServices
          .getCall("https://jsonplaceholder.typicode.com/posts");
      allData = data;
      state = ApiState.loaded;
    } catch(e) {
      state = ApiState.error;
    }
  }
}
