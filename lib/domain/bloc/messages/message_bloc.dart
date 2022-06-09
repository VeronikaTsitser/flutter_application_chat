import 'package:flutter_application_chat/domain/bloc/messages/message_event.dart';
import 'package:flutter_application_chat/domain/bloc/messages/message_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final _storage = SharedPreferences.getInstance();
  MessageBloc() : super(MessageInitial()) {
    on<MessageInitialEvent>(
      (event, emit) async {
        emit(MessageLoading());

        try {
          final currentStorage = await _storage;
          final storageList = currentStorage.getStringList("MessageHistory");

          emit(
            MessageSuccess(storageList ?? []),
          );
        } catch (e) {
          emit(MessageException(exception: e.toString()));
        }
      },
    );
    on<MessageSend>(
      (event, emit) async {
        emit(MessageLoading());

        try {
          final String newText = event.text;
          final List<String> currentMessageHistory = event.messageHistory;
          currentMessageHistory.add(newText);
          final currentStorage = await _storage;
          currentStorage.setStringList("MessageHistory", currentMessageHistory);

          emit(
            MessageSuccess(currentMessageHistory),
          );
        } catch (e) {
          emit(MessageException(exception: e.toString()));
        }
      },
    );
    on<MessageDelete>(
      (event, emit) async {
        emit(MessageLoading());
        try {
          final int messageIndex = event.messageIndex;
          final List<String> currentMessageHistory = event.messageHistory;
          currentMessageHistory.removeAt(messageIndex);
          final currentStorage = await _storage;
          currentStorage.setStringList("MessageHistory", currentMessageHistory);
          emit(
            MessageSuccess(currentMessageHistory),
          );
        } catch (e) {
          emit(MessageException(exception: e.toString()));
        }
      },
    );
    on<MessageClearAll>(
      (event, emit) async {
        emit(MessageLoading());
        try {
          final List<String> currentMessageHistory = event.messageHistory;
          currentMessageHistory.clear();
          emit(
            MessageSuccess(currentMessageHistory),
          );
        } catch (e) {
          emit(MessageException(exception: e.toString()));
        }
      },
    );
  }
}
