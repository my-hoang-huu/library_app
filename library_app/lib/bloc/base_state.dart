import 'package:equatable/equatable.dart';
import 'package:library_app/data/models/base_modal.dart';

enum UpdateProfileType { updateDetailInfo, identification, changePassword, twoStepAuth }

enum ResponseMessageType { successDialog, informationDialog }

abstract class UpdateProfileState extends Equatable {
  final UpdateProfileType type;
  const UpdateProfileState(this.type);

  @override
  List<Object?> get props => [type];
}

class UpdateProfileLoading extends UpdateProfileState {
  final UpdateProfileType type;

  UpdateProfileLoading(this.type) : super(type);
}

class UpdateProfileSending extends UpdateProfileState {
  final UpdateProfileType type;

  UpdateProfileSending(this.type) : super(type);
}

class UpdateProfileLoaded<M extends ProfileDetail> extends UpdateProfileState {
  final M profileDetail;
  final UpdateProfileType type;

  UpdateProfileLoaded({
    required this.profileDetail,
    required this.type,
  }) : super(type);

  @override
  List<Object> get props => [profileDetail, type];
}

class UpdateProfileSuccess<M extends ProfileDetail> extends UpdateProfileState {
  final M profileDetail;
  final UpdateProfileType type;
  final String? successMessage;
  final String? dialogMessage;
  final String? dialogTitle;
  final ResponseMessageType messageType;
  final bool preventRebuild;

  UpdateProfileSuccess({
    required this.profileDetail,
    required this.type,
    this.successMessage,
    this.dialogTitle,
    this.dialogMessage,
    this.messageType = ResponseMessageType.successDialog,
    this.preventRebuild = false,
  }) : super(type);

  @override
  List<Object?> get props => [profileDetail, type, successMessage, messageType, preventRebuild];
}

class UpdateProfileError extends UpdateProfileState {
  final String? error;
  final UpdateProfileType type;

  UpdateProfileError({this.error, required this.type}) : super(UpdateProfileType.updateDetailInfo);
  List<Object?> get props => [error, type];
}
