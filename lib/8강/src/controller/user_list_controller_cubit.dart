import 'package:bloc_study/8%EA%B0%95/src/models/user_info_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListControllerCubit extends Cubit<UserListControllerCubitState> {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://randomuser.me/'));
  UserListControllerCubit() : super(InitUserListControllerCubitState()) {
    loadUserList();
  }
  loadUserList() async {
    try {
      if (state is LoadingUserListControllerCubitState ||
          state is ErrorUserListControllerCubitState) {
        return;
      }
      emit(LoadingUserListControllerCubitState(
          userInfoResultsModel: state.userInfoResultsModel));
      var response = await _dio.get('api', queryParameters: {
        'results': 10,
        'seed': 'sudar',
        'page': state.userInfoResultsModel.currentPage,
      });
      emit(LoadedUserListControllerCubitState(
          userInfoResultsModel:
              state.userInfoResultsModel.copyWithFromJson(response.data)));
    } catch (e) {
      emit(ErrorUserListControllerCubitState(
          errorMessage: e.toString(),
          userInfoResultsModel: state.userInfoResultsModel));
    }
  }
}

abstract class UserListControllerCubitState extends Equatable {
  final UserInfoResultsModel userInfoResultsModel;
  const UserListControllerCubitState({required this.userInfoResultsModel});
}

class InitUserListControllerCubitState extends UserListControllerCubitState {
  InitUserListControllerCubitState()
      : super(userInfoResultsModel: UserInfoResultsModel.init());

  @override
  List<Object?> get props => [userInfoResultsModel];
}

class LoadingUserListControllerCubitState extends UserListControllerCubitState {
  const LoadingUserListControllerCubitState(
      {required super.userInfoResultsModel});

  @override
  List<Object?> get props => [userInfoResultsModel];
}

class LoadedUserListControllerCubitState extends UserListControllerCubitState {
  const LoadedUserListControllerCubitState(
      {required super.userInfoResultsModel});

  @override
  List<Object?> get props => [userInfoResultsModel];
}

class ErrorUserListControllerCubitState extends UserListControllerCubitState {
  String errorMessage;
  ErrorUserListControllerCubitState(
      {required this.errorMessage, required super.userInfoResultsModel});

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage, userInfoResultsModel];
}
