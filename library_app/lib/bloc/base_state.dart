import 'package:equatable/equatable.dart';
import 'package:library_app/data/models/base_modal.dart';

enum ModalType { book, owner, reader, bookDetails }

enum ResponseMessageType { successDialog, informationDialog }

abstract class BaseState extends Equatable {
  final ModalType type;
  const BaseState(this.type);

  @override
  List<Object?> get props => [type];
}

class LoadingState extends BaseState {
  const LoadingState(super.type);
}

class SendingState extends BaseState {
  const SendingState(super.type);
}

class LoadedState<M extends BaseModal> extends BaseState {
  final M profileDetail;

  const LoadedState(
    super.type, {
    required this.profileDetail,
  });

  @override
  List<Object> get props => [profileDetail, type];
}

class SubmitSuccessState<M extends BaseModal> extends BaseState {
  final M newInfo;
  final String? successMessage;
  final String? dialogMessage;
  final String? dialogTitle;
  final ResponseMessageType messageType;
  final bool preventRebuild;

  const SubmitSuccessState(
    super.type, {
    required this.newInfo,
    this.successMessage,
    this.dialogTitle,
    this.dialogMessage,
    this.messageType = ResponseMessageType.successDialog,
    this.preventRebuild = false,
  });

  @override
  List<Object?> get props => [newInfo, type, successMessage, messageType, preventRebuild];
}

class ErrorState extends BaseState {
  final String? error;

  const ErrorState(super.type, {this.error});

  @override
  List<Object?> get props => [error, type];
}
