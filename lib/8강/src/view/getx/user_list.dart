import 'package:bloc_study/8%EA%B0%95/src/components/user_info.dart';
import 'package:bloc_study/8%EA%B0%95/src/controller/user_list_controller_getx.dart';
import 'package:bloc_study/8%EA%B0%95/src/models/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class UserListGetX extends GetView<UserListControllerGetx> {
  const UserListGetX({super.key});

  Widget _error() {
    return const Center(child: Text('오류 발생'));
  }

  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _userListWidget(List<UserInfoModel> userInfoList) {
    return ListView.separated(
        controller: controller.scrollController,
        separatorBuilder: (context, index) => const Divider(
              color: Colors.grey,
            ),
        itemCount: userInfoList.length + 1,
        itemBuilder: (context, index) {
          if (index == userInfoList.length) {
            return _loading();
          } else {
            return UserInfoWidget(userInfo: userInfoList[index]);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('getx 상태관리'),
      ),
      body: Obx(() {
        return _userListWidget(controller.userInfoResults.value.userInfoList);
      }),
    );
  }
}
