// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:library_app/bloc/base_even.dart';
// import 'package:library_app/bloc/base_state.dart';
// import 'package:library_app/data/models/base_modal.dart';
// import 'package:library_app/data/repository/base_list_repository.dart';

// class BaseBloc<M extends BaseModal, R extends BaseRepository<M>>
//     extends Bloc<BaseEvent, BaseState> {
//   final R repository;
//   final ModalType type;

//   BaseBloc({required this.repository, required this.type}) : super(LoadingState(type)) {
//     on<StartedEvent>(_onStarting);
//     on<SubmittedEvent<M>>(_inSubmiting);
//   }

//   Future<FutureOr<void>> _onStarting(StartedEvent event, Emitter<BaseState> emit) async {
//     emit(LoadingState(type));
//     final M? profile = await repository.info;
//     if (profile != null) {
//       emit(LoadedState(type, info: profile));
//     } else {
//       emit(ErrorState(type, error: "Có lỗi khi load dữ liệu"));
//     }
//     try {} catch (e) {
//       emit(ErrorState(type, error: e.toString()));
//     }
//   }

//   Future<FutureOr<void>> _inSubmiting(SubmittedEvent<M> event, Emitter<BaseState> emit) async {
//     final M updateInfo = event.info;
//     return _handleSubmission(
//       updateInfo: updateInfo,
//       emit: emit,
//     );
//   }

//   Future<FutureOr<void>> _handleSubmission({
//     required M updateInfo,
//     required Emitter<BaseState> emit,
//     String? successMessage,
//   }) async {
//     emit(SendingState(type));
//     try {
//       final result = await repository.updateInfo(updateInfo);
//       if (result == true) {
//         emit(SubmitSuccessState(type,
//             newInfo: updateInfo, successMessage: successMessage, preventRebuild: true));
//       }
//     } catch (e) {
//       emit(ErrorState(type));
//     }
//   }
// }
