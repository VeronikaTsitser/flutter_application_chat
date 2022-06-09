import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_chat/data/data.dart';
import 'package:flutter_application_chat/domain/bloc/messages/message_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../domain/bloc/messages/message_bloc.dart';
import '../../domain/bloc/messages/message_event.dart';

class TopNavigationWidget extends StatelessWidget {
  const TopNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageBloc, MessageState>(
      bloc: context.read<MessageBloc>(),
      builder: (context, state) {
        if (state is MessageInitial) {
          context.read<MessageBloc>().add(
                MessageInitialEvent(),
              );
        }
        if (state is MessageSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 12,
            ),
            child: Row(
              children: [
                Text('History', style: Theme.of(context).textTheme.headline3),
                Spacer(),
                TextButton(
                    onPressed: () {
                      context.read<MessageBloc>().add(
                            MessageClearAll(
                              messageHistory: state.messageHistory,
                            ),
                          );
                    },
                    child: Text('Clear all'))
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
