import 'package:flutter/material.dart';
import 'package:flutter_application_chat/domain/bloc/messages/message_bloc.dart';
import 'package:flutter_application_chat/domain/bloc/messages/message_state.dart';
import 'package:flutter_application_chat/presentation/widgets/add_info_widget.dart';
import 'package:flutter_application_chat/presentation/widgets/top_navigation_widget.dart';
import 'package:flutter_application_chat/presentation/widgets/history_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopNavigationWidget(),
            HistoryWidget(),
            AddInfoWidget(),
          ],
        ),
      ),
    );
  }
}
