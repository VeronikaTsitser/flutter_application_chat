import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_application_chat/presentation/widgets/history_widget.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../../domain/bloc/messages/message_bloc.dart';
import '../../domain/bloc/messages/message_event.dart';
import '../../domain/bloc/messages/message_state.dart';

class AddInfoWidget extends StatefulWidget {
  const AddInfoWidget({Key? key}) : super(key: key);

  @override
  State<AddInfoWidget> createState() => _AddInfoWidgetState();
}

class _AddInfoWidgetState extends State<AddInfoWidget> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 300,
                child: TextField(
                  onSubmitted: (value) {
                    final text = controller.text.trim();
                    // context.read<Data>().changeList(text);
                  },
                  controller: controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Enter your text',
                  ),
                  maxLines: 3,
                ),
              ),
            ),
            Spacer(),
            FloatingActionButton(
              onPressed: () {
                final text = controller.text.trim();

                MessageState currentState = context.read<MessageBloc>().state;

                if (currentState is MessageInitial) {
                  context.read<MessageBloc>().add(
                        MessageSend(
                          text: text,
                          messageHistory: [],
                        ),
                      );
                }
                if (currentState is MessageSuccess) {
                  context.read<MessageBloc>().add(
                        MessageSend(
                            text: text,
                            messageHistory: currentState.messageHistory),
                      );
                }

                controller.clear();
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Icon(Icons.send_rounded),
              ),
            )
            //
          ],
        ),
      ),
    );
  }
}
