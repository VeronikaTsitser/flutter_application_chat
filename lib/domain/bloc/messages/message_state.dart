abstract class MessageState {}

class MessageInitial extends MessageState {}

class MessageLoading extends MessageState {}

class MessageSuccess extends MessageState {
  final List<String> messageHistory;
  MessageSuccess(this.messageHistory);
}

class MessageException extends MessageState {
  final String exception;
  MessageException({required this.exception});
}
