import 'package:bloc_study/8%EA%B0%95/src/models/user_info_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListControllerCubitCopyWith extends Cubit<UserListControllerCubitCopyWithState> {
  late Dio _dio;
  UserListControllerCubitCopyWith() : super(const UserListControllerCubitCopyWithState.init()) {
    _dio = Dio(BaseOptions(baseUrl: 'https://randomuser.me/'));
    loadUserList();
  }

  loadUserList() async {
    try {
      if (state.status == UserListControllerCubitCopyWithStatus.loading || state.status == UserListControllerCubitCopyWithStatus.error) {
        return;
      }
      emit(state.copyWith(
        status: UserListControllerCubitCopyWithStatus.loading,
      ));
      var response = await _dio.get('api', queryParameters: {
        'results': 10,
        'seed': 'sudar',
        'page': state.userInfoResultsModel.currentPage,
      });
      emit(state.copyWith(
        status: UserListControllerCubitCopyWithStatus.loaded,
        userInfoResultsModel: state.userInfoResultsModel.copyWithFromJson(response.data),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: UserListControllerCubitCopyWithStatus.error,
        errorMessage: e.toString(),
      ));
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
          userInfoResultsModel: const UserInfoResultsModel.init(),
        );
  UserListControllerCubitCopyWithState copyWith({
    UserListControllerCubitCopyWithStatus? status,
    UserInfoResultsModel? userInfoResultsModel,
    String? errorMessage,
  }) {
    return UserListControllerCubitCopyWithState(
      status: status ?? this.status,
      userInfoResultsModel: userInfoResultsModel ?? this.userInfoResultsModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        status,
        userInfoResultsModel,
        errorMessage,
      ];
}
