import 'package:bloc_study/8%EA%B0%95/src/models/user_info_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class UserListControllerGetx extends GetxController {
  ScrollController scrollController = ScrollController();

  late Dio _dio;
  final Rx<UserInfoResultsModel> userInfoResults =
      UserInfoResultsModel.init().obs;
  int nextPage = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _dio = Dio(BaseOptions(baseUrl: 'https://randomuser.me/'));

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent * 0.7 <=
              scrollController.offset &&
          nextPage != userInfoResults.value.currentPage) {
        nextPage = userInfoResults.value.currentPage;
        _loadUserList();
      }
    });
    _loadUserList();
  }

  Future<UserInfoResultsModel> _loadUserList() async {
    try {
      var response = await _dio.get('api', queryParameters: {
        'results': 10,
        'seed': 'sudar',
        'page': userInfoResults.value.currentPage,
      });
      userInfoResults(userInfoResults.value.copyWithFromJson(response.data));
      return userInfoResults.value;
    } catch (e) {
      throw e.toString();
    }
  }
}
