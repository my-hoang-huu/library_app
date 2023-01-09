import 'package:equatable/equatable.dart';
import 'package:library_app/data/models/base_modal.dart';

enum ModalType { book, owner, reader, bookDetails, bookList }

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

class ErrorState extends BaseState {
  final String? error;

  const ErrorState(super.type, {this.error});

  @override
  List<Object?> get props => [error, type];
}

class LoadedState<M extends BaseModal> extends BaseState {
  final M info;

  const LoadedState(
    super.type, {
    required this.info,
  });

  @override
  List<Object> get props => [info, type];
}

class LoadedListState<M extends BaseModal> extends BaseState {
  final List<M> info;

  const LoadedListState(
    super.type, {
    required this.info,
  });

  @override
  List<Object> get props => [info, type];
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

abstract class ListSuccessBaseState<M extends BaseModal> extends BaseState {
  final List<M> newInfo;
  final String? successMessage;
  final String? dialogMessage;
  final String? dialogTitle;
  final ResponseMessageType messageType;
  final bool preventRebuild;

  const ListSuccessBaseState(
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

class SubmitListSuccessState<M extends BaseModal> extends ListSuccessBaseState<M> {
  const SubmitListSuccessState(
    super.type, {
    required super.newInfo,
    super.successMessage,
    super.dialogTitle,
    super.dialogMessage,
    super.messageType = ResponseMessageType.successDialog,
    super.preventRebuild = false,
  });

  @override
  List<Object?> get props => [newInfo, type, successMessage, messageType, preventRebuild];
}

class DeleteListItemSuccessState<M extends BaseModal> extends ListSuccessBaseState<M> {
  const DeleteListItemSuccessState(
    super.type, {
    required super.newInfo,
    super.successMessage,
    super.dialogTitle,
    super.dialogMessage,
    super.messageType = ResponseMessageType.successDialog,
    super.preventRebuild = false,
  });

  @override
  List<Object?> get props => [newInfo, type, successMessage, messageType, preventRebuild];
}
