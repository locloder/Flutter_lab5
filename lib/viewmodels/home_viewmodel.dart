import 'package:flutter/material.dart';
import 'package:my_personal_app/models/user_profile.dart';
import 'package:my_personal_app/models/repositories/user_profile_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final UserProfileRepository _repository;
  List<UserProfile> _profiles = [];

  HomeViewModel({required UserProfileRepository repository})
      : _repository = repository {
    _profiles = _repository.getAllProfiles();
  }

  List<UserProfile> get profiles => _profiles;
}