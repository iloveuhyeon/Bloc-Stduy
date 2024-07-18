import 'package:bloc_study/8%EA%B0%95/src/components/user_info.dart';
import 'package:bloc_study/8%EA%B0%95/src/controller/user_list_controller_cubit.dart';
import 'package:bloc_study/8%EA%B0%95/src/models/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListCubit extends StatefulWidget {
  const UserListCubit({super.key});

  @override
  State<UserListCubit> createState() => _UserListCubitState();
}

class _UserListCubitState extends State<UserListCubit> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent - 200 <=
          _scrollController.offset) {
        context.read<UserListControllerCubit>().loadUserList();
      }
    });
  }

  Widget _error() {
    return const Center(child: Text('오류 발생'));
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('cubit 상태관리'),
      ),
      body: BlocBuilder<UserListControllerCubit, UserListControllerCubitState>(
        builder: (context, state) {
          if (state is ErrorUserListControllerCubitState) {
            return _error();
          }
          if (state is LoadingUserListControllerCubitState ||
              state is LoadedUserListControllerCubitState) {
            return _userListWidget(state.userInfoResultsModel.userInfoList);
          }
          return Container();
        },
      ),
    );
  }
}
