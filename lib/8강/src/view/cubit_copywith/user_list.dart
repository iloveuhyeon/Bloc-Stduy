import 'package:bloc_study/8%EA%B0%95/src/components/user_info.dart';
import 'package:bloc_study/8%EA%B0%95/src/controller/user_list_controller_cubit_copy_with.dart';
import 'package:bloc_study/8%EA%B0%95/src/models/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListCubitCoptWith extends StatefulWidget {
  const UserListCubitCoptWith({super.key});

  @override
  State<UserListCubitCoptWith> createState() => _UserListCubitCoptWithState();
}

class _UserListCubitCoptWithState extends State<UserListCubitCoptWith> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent - 200 <= _scrollController.offset) {
        context.read<UserListControllerCubitCopyWith>().loadUserList();
      }
    });
  }

  Widget _error(String? error) {
    return Center(child: Text('오류 발생$error'));
  }

  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _userListWidget(List<UserInfoModel> userInfoList) {
    return ListView.separated(
      controller: _scrollController,
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('copywith 상태관리'),
      ),
      body: BlocBuilder<UserListControllerCubitCopyWith, UserListControllerCubitCopyWithState>(
        builder: (context, state) {
          _userListWidget(state.userInfoResultsModel.userInfoList);

          switch (state.status) {
            case UserListControllerCubitCopyWithStatus.loading:
            case UserListControllerCubitCopyWithStatus.loaded:
            case UserListControllerCubitCopyWithStatus.init:
              return _userListWidget(state.userInfoResultsModel.userInfoList);
            case UserListControllerCubitCopyWithStatus.error:
              return _error(state.errorMessage);
          }
        },
      ),
    );
  }
}
