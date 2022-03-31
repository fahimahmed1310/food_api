import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_api/models/category_model.dart';
import 'package:food_api/repository/food_repository.dart';

class FoodProvider with ChangeNotifier{
  bool? _isUserExist = false;
  CategoryModel? _categoryModel;

  Future<bool> isUserLogin(String phoneNumber, String password)async{
    Response response = await FoodRepository().isUserLogin(phoneNumber, password);
    if(response.statusCode == 200){
      isUserExist = true;
    }
    else{
      isUserExist = false;
    }
    notifyListeners();
    return isUserExist;
  }


  Future<void> foodCategory()async{
    Response response = await FoodRepository().foodCategory();
    if(response.statusCode == 200){
     _categoryModel = CategoryModel.fromJson(response.data);
     print("done");
    }
    else{
      print("Not found");
    }
  }





  bool get isUserExist => _isUserExist!;
  set isUserExist(bool value) {
    _isUserExist = value;
    notifyListeners();
  }

  CategoryModel get categoryModel => _categoryModel!;


}