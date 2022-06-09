import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_chat/domain/bloc/messages/message_bloc.dart';
import 'package:flutter_application_chat/domain/bloc/messages/message_event.dart';
import 'package:flutter_application_chat/domain/bloc/messages/message_state.dart';
import 'package:flutter_application_chat/presentation/Theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/data.dart';
import '../Theme/colors.dart';

class HistoryWidget extends StatefulWidget {
  HistoryWidget({Key? key}) : super(key: key);

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageBloc, MessageState>(
      bloc: context.read<MessageBloc>(),
      builder: (context, state) {
        if (state is MessageInitial) {
          return Expanded(
            child: Container(),
          );
        }
        if (state is MessageLoading) {
          return const CircularProgressIndicator();
        }
        if (state is MessageSuccess) {
          return Expanded(
            child: state.messageHistory.isNotEmpty
                ? ListView.builder(
                    itemCount: state.messageHistory.length,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemBuilder: (BuildContext context, int index) {
                      return Slidable(
                        key: UniqueKey(),
                        endActionPane: ActionPane(
                          motion: const DrawerMotion(),
                          dismissible: DismissiblePane(onDismissed: () {
                            setState(() {
                              context.read<MessageBloc>().add(MessageDelete(
                                  messageHistory: state.messageHistory,
                                  messageIndex: index));
                            });
                          }),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                context.read<MessageBloc>().add(MessageDelete(
                                    messageHistory: state.messageHistory,
                                    messageIndex: index));
                              },
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).colorScheme.shadow,
                                  blurRadius: 2,
                                )
                              ],
                            ),
                            width: double.infinity,
                            child: Text(
                              state.messageHistory[index],
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Container(),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
