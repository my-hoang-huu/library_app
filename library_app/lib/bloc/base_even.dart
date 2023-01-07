import 'package:equatable/equatable.dart';
import 'package:library_app/bloc/base_state.dart';
import 'package:library_app/data/models/base_modal.dart';

/// evens are sent by client to request something from server

abstract class BaseEvent extends Equatable {
  const BaseEvent();

  @override
  List<Object?> get props => [];
}

class StartedEvent extends BaseEvent {
  final ModalType type;

  const StartedEvent(this.type);
}

class SubmittedEvent<M extends BaseModal> extends BaseEvent {
  final M info;

  const SubmittedEvent(this.info);
  @override
  List<Object?> get props => [info];
}
