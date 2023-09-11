import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seban_app/ui/inputpage.dart';
import 'package:seban_app/ui/login.dart';
import 'package:seban_app/ui/predict.dart';
import 'bloc/loginbloc.dart';
import 'bloc/logoutBloc.dart';
import 'bloc/logoutUserBloc.dart';
import 'bloc/regBloc.dart';

void main() => runApp(const AppHome());

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  var token, role;

  void initState() {

    super.initState();
  }


  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<RegBloc>(create: (context) => RegBloc()),
        BlocProvider<LogOutBloc>(create: (context) => LogOutBloc()),
        BlocProvider<LogOutUserBloc>(create: (context) => LogOutUserBloc()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SEF',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: Login()),
    );
  }
}