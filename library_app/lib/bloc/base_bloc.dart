import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:library_app/bloc/base_even.dart';
import 'package:library_app/bloc/base_state.dart';
import 'package:library_app/data/models/base_modal.dart';
import 'package:library_app/data/repository/base_repository.dart';

class UpdateProfileBloc<T extends ProfileDetail, R extends ProfileDetailRepository<T>>
    extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  final R profileDetailRepository;
  final UpdateProfileType type;

  UpdateProfileBloc({required this.profileDetailRepository, required this.type})
      : super(UpdateProfileLoading(type)) {
    on<UpdateProfileStarted>(_onStarted);
    on<UpdateProfileDetailSubmitted>(_onProfileInfoSubmitted);
  }

  Future<FutureOr<void>> _onStarted(
      UpdateProfileStarted event, Emitter<UpdateProfileState> emit) async {
    emit(UpdateProfileLoading(event.type));
    try {
      final T? profile = await profileDetailRepository.info;
      if (profile == null) throw Exception("profile response is empty");
      emit(UpdateProfileLoaded(profileDetail: profile, type: event.type));
    } catch (e) {
      emit(UpdateProfileError(type: event.type, error: e.toString()));
    }
  }

  Future<FutureOr<void>> _onProfileInfoSubmitted(
      UpdateProfileDetailSubmitted event, Emitter<UpdateProfileState> emit) async {
    final T profileUpdate = event.userInfo as T;
    return _onSubmitted(
      profileUpdate: profileUpdate,
      emit: emit,
    );
  }

  Future<FutureOr<void>> _onSubmitted({
    required T profileUpdate,
    required Emitter<UpdateProfileState> emit,
    String? successMessage,
  }) async {
    emit(UpdateProfileSending(type));

    try {
      final T? newProfile = await profileDetailRepository.updateInfo(profileUpdate);
      if (newProfile == null) throw Exception("New profile update failed");

      emit(UpdateProfileSuccess(
          profileDetail: newProfile,
          type: type,
          successMessage: successMessage,
          preventRebuild: true));
    } catch (e) {
      emit(UpdateProfileError(type: type));
    }
  }
}
