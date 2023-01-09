import 'package:equatable/equatable.dart';
import 'package:library_app/data/models/base_modal.dart';
import 'package:library_app/data/models/book.dart';

/// evens are sent by client to request something from server

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

  const SubmittedEvent(this.info);
  @override
  List<Object?> get props => [info];
}

class DeletedEvent extends BaseEvent {
  final int id;
  const DeletedEvent(this.id);
}
