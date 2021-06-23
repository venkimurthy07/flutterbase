import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/utils.dart';
import 'package:flutter_app/features/presentation/BreedsEvent.dart';
import 'package:flutter_app/features/presentation/breeds_bloc.dart';
import 'package:flutter_app/features/presentation/pages/breeds_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/network/MyHttpOverrides.dart';
import 'injector_container.dart' as di;
import 'injector_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BreedsBloc>(
      create: (context) => BreedsBloc()..add(AppStarted()),
      child: MaterialApp(
        theme: ThemeData(fontFamily: Utils.FONT_FAMILY),
        initialRoute: BreedsScreen.routeName,
        routes: {
          BreedsScreen.routeName: (context) => BlocProvider<BreedsBloc>(
                create: (context) => sl<BreedsBloc>(),
                child: BreedsScreen(),
              )
        },
      ),
    );
  }
}
