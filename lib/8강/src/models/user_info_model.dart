import 'package:equatable/equatable.dart';

class UserInfoResultsModel extends Equatable {
  final int currentPage;
  final List<UserInfoModel> userInfoList;
  const UserInfoResultsModel({
    required this.currentPage,
    required this.userInfoList,
  });

  factory UserInfoResultsModel.fromJson(Map<String, dynamic> json) {
    return UserInfoResultsModel(
      currentPage: (json['info']['page'] as int) + 1,
      userInfoList: json['results']
          .map<UserInfoModel>((item) => UserInfoModel.fromJson(item))
          .toList(),
    );
  }

  UserInfoResultsModel copyWithFromJson(Map<String, dynamic> json) {
    return UserInfoResultsModel(
      currentPage: (json['info']['page'] as int) + 1,
      userInfoList: List<UserInfoModel>.from(userInfoList)
        ..addAll(json['results']
            .map<UserInfoModel>((item) => UserInfoModel.fromJson(item))
            .toList()),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        currentPage,
        userInfoList,
      ];
}

class UserInfoModel extends Equatable {
  final String profileImage;
  final String name;
  final String email;
  final String phone;

  const UserInfoModel({
    required this.profileImage,
    required this.name,
    required this.email,
    required this.phone,
  });

  UserInfoModel.fromJson(Map<String, dynamic> json)
      : profileImage = json['picture']['medium'],
        name = json['name']['first'] + json['name']['last'],
        email = json['email'],
        phone = json['phone'];

  @override
  // TODO: implement props
  List<Object?> get props => [
        profileImage,
        name,
        email,
        phone,
      ];
}
