import 'package:bloc_study/8%EA%B0%95/src/components/user_info.dart';
import 'package:bloc_study/8%EA%B0%95/src/models/user_info_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserListPageSetState extends StatefulWidget {
  const UserListPageSetState({super.key});

  @override
  State<UserListPageSetState> createState() => _UserListPageSetStateState();
}

class _UserListPageSetStateState extends State<UserListPageSetState> {
  late Dio _dio;
  final ScrollController _scrollController = ScrollController();
  late UserInfoResultsModel userInfoResultsModel;
  int _nextPage = -1;
  @override
  void initState() {
    super.initState();
    userInfoResultsModel =
        const UserInfoResultsModel(currentPage: 0, userInfoList: []);
    _dio = Dio(BaseOptions(baseUrl: 'https://randomuser.me/'));
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent * 0.7 <=
              _scrollController.offset &&
          _nextPage != userInfoResultsModel.currentPage) {
        _nextPage = userInfoResultsModel.currentPage;
        setState(() {});
      }
    });
  }

  Future<UserInfoResultsModel> _loadUserList() async {
    try {
      var response = await _dio.get('api', queryParameters: {
        'results': 10,
        'seed': 'sudar',
        'page': userInfoResultsModel.currentPage,
      });
      userInfoResultsModel =
          userInfoResultsModel.copyWithFromJson(response.data);
      return userInfoResultsModel;
    } catch (e) {
      throw e.toString();
    }
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _error() {
    return const Center(
      child: Text('오류 발생'),
    );
  }

  Widget _userListWidget(List<UserInfoModel> userInfo) {
    return ListView.separated(
      controller: _scrollController,
      itemBuilder: (context, index) =>
          UserInfoWidget(userInfo: userInfo[index]),
      separatorBuilder: (context, index) => const Divider(color: Colors.grey),
      itemCount: userInfo.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SetState 상태관리'),
      ),
      body: FutureBuilder<UserInfoResultsModel>(
        future: _loadUserList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return _error();
          } else if (snapshot.hasData) {
            return _userListWidget(snapshot.data!.userInfoList);
          }
          return _loading();
        },
      ),
    );
  }
}
