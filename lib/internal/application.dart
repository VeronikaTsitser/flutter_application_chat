import 'package:flutter/material.dart';
import 'package:flutter_application_chat/data/data.dart';
import 'package:flutter_application_chat/domain/bloc/messages/message_bloc.dart';
import 'package:flutter_application_chat/presentation/Theme/basic_theme.dart';
import 'package:flutter_application_chat/presentation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return MessageBloc();
      },
      child: MaterialApp(
        theme: basicTheme(),
        home: HomePage(),
      ),
    );
  }
}
