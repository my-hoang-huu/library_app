import 'package:equatable/equatable.dart';
import 'package:library_app/data/models/base_modal.dart';

/// evens are sent by client to request something from server
///
///
enum SubmitType { create, update }

abstract class BaseEvent extends Equatable {
  const BaseEvent();

  @override
  List<Object?> get props => [];
}

class StartedEvent extends BaseEvent {
  const StartedEvent();
}

class SubmittedEvent<M extends BaseModal> extends BaseEvent {
  final M info;
  final SubmitType submitType;

  const SubmittedEvent(this.info, {this.submitType = SubmitType.update});
  @override
  List<Object?> get props => [info];
}

class DeletedEvent extends BaseEvent {
  final int id;
  const DeletedEvent(this.id);
}
