import 'package:bloc_study/8%EA%B0%95/src/models/user_info_model.dart';
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  final UserInfoModel userInfo;
  const UserInfoWidget({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: Image.network(userInfo.profileImage).image,
            radius: 35,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                userInfo.email,
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 11,
                ),
              ),
              Text(
                userInfo.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    size: 20,
                  ),
                  Text(userInfo.phone),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
