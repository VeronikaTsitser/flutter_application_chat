abstract class MessageEvent {}

class MessageSend extends MessageEvent {
  final String text;
  final List<String> messageHistory;
  MessageSend({required this.text, required this.messageHistory});
}

class MessageDelete extends MessageEvent {
  List<String> messageHistory;
  final int messageIndex;
  MessageDelete({required this.messageHistory, required this.messageIndex});
}

class MessageClearAll extends MessageEvent {
  final List<String> messageHistory;
  MessageClearAll({required this.messageHistory});
}

class MessageInitialEvent extends MessageEvent {}
