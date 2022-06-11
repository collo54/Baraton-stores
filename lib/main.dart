import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom/wrapper.dart';
import 'custom/wrapper_builder.dart';
import 'firebase_options.dart';
import 'services/authentication_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(),
        ),
        // Provider<ImagePickerService>(
        //   create: (_) => ImagePickerService(),
        //  ),
      ],
      child: WrapperBuilder(
        builder: (context, userSnapshot) {
          return MaterialApp(
            title: 'Baraton stores',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Roboto'),
            home: Wrapper(
              userSnapshot: userSnapshot,
            ),
          );
        },
      ),
    );
  }
}
