import 'package:bloc_study/8%EA%B0%95/src/models/user_info_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListControllerCubitCopyWith
    extends Cubit<UserListControllerCubitCopyWithState> {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://randomuser.me/'));
  UserListControllerCubitCopyWith()
      : super(const UserListControllerCubitCopyWithState.init()) {
    loadUserList();
  }

  loadUserList() async {
    try {
      if (state.status == UserListControllerCubitCopyWithStatus.loading ||
          state.status == UserListControllerCubitCopyWithStatus.error) {
        return;
      } else {
        emit(state.status = UserListControllerCubitCopyWithStatus.loading);
        var response = _dio.get('api', queryParameters: {
          'results': 10,
          'seed': 'sudar',
          'page': state.userInfoResultsModel.currentPage,
        });
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

enum UserListControllerCubitCopyWithStatus {
  loading,
  loaded,
  init,
  error,
}

class UserListControllerCubitCopyWithState extends Equatable {
  final UserListControllerCubitCopyWithStatus status;
  final UserInfoResultsModel userInfoResultsModel;
  final String? errorMessage;
  const UserListControllerCubitCopyWithState({
    required this.status,
    required this.userInfoResultsModel,
    this.errorMessage,
  });
  const UserListControllerCubitCopyWithState.init()
      : this(
            status: UserListControllerCubitCopyWithStatus.init,
            userInfoResultsModel: const UserInfoResultsModel.init());

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
