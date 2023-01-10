import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:library_app/bloc/base_even.dart';
import 'package:library_app/bloc/base_state.dart';
import 'package:library_app/data/models/base_modal.dart';
import 'package:library_app/data/repository/base_list_repository.dart';

class BaseListBloc<M extends BaseModal, R extends BaseListRepository<M>>
    extends Bloc<BaseEvent, BaseState> {
  final R repository;
  final ModalType type;

  BaseListBloc({required this.repository, required this.type}) : super(LoadingState(type)) {
    on<StartedEvent>(_onStarting);
    on<SubmittedEvent<M>>(_inSubmiting);
    on<DeletedEvent>(_onDeleteItem);
  }

  Future<FutureOr<void>> _onStarting(StartedEvent event, Emitter<BaseState> emit) async {
    emit(LoadingState(type));
    final List<M>? profile = await repository.info;
    if (profile != null) {
      emit(LoadedListState(type, info: profile));
    } else {
      emit(ErrorState(type, error: "Có lỗi khi load dữ liệu"));
    }
    try {} catch (e) {
      emit(ErrorState(type, error: e.toString()));
    }
  }

  Future<FutureOr<void>> _inSubmiting(SubmittedEvent<M> event, Emitter<BaseState> emit) async {
    final M updateInfo = event.info;
    final function = event.submitType == SubmitType.update
        ? repository.updateInfo(updateInfo)
        : repository.createNew(updateInfo);
    return _handleSubmission(emit: emit, request: function);
  }

  Future<FutureOr<void>> _onDeleteItem(DeletedEvent event, Emitter<BaseState> emit) async {
    return _handleSubmission(
        emit: emit,
        request: repository.delete(event.id),
        isDelete: true,
        successMessage: "Deleted successfully");
  }

  Future<FutureOr<void>> _handleSubmission(
      {required Emitter<BaseState> emit,
      String? successMessage,
      bool isDelete = false,
      required Future<List<M>> request}) async {
    emit(SendingState(type));
    try {
      final result = await request;
      if (isDelete) {
        emit(DeleteListItemSuccessState(type,
            newInfo: result, successMessage: successMessage, preventRebuild: true));
      } else {
        emit(SubmitListSuccessState(type,
            newInfo: result, successMessage: successMessage, preventRebuild: true));
      }
    } catch (e) {
      emit(ErrorState(type, error: e.toString()));
    }
  }
}
