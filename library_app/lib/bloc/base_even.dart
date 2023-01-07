import 'package:equatable/equatable.dart';
import 'package:library_app/bloc/base_state.dart';
import 'package:library_app/data/models/base_modal.dart';

abstract class UpdateProfileEvent extends Equatable {
  const UpdateProfileEvent();

  @override
  List<Object?> get props => [];
}

class UpdateProfileStarted extends UpdateProfileEvent {
  final UpdateProfileType type;

  UpdateProfileStarted(this.type);
}

class UpdateProfileDetailSubmitted extends UpdateProfileEvent {
  final UserUpdateInfo userInfo;

  UpdateProfileDetailSubmitted(this.userInfo);
  List<Object?> get props => [userInfo];
}

class UpdateProfileUnfocused extends UpdateProfileEvent {}
