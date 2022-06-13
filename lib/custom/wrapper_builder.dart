import 'package:baraton_stores/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/authentication_service.dart';
import '../services/firestore_service.dart';

class WrapperBuilder extends StatelessWidget {
  const WrapperBuilder({Key? key, required this.builder}) : super(key: key);
  final Widget Function(BuildContext, AsyncSnapshot<UserModel?>) builder;
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthenticationService>(context, listen: false);

    return StreamBuilder<UserModel?>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          final user = snapshot.data;
          if (user != null) {
            return MultiProvider(
              providers: [
                Provider<UserModel>.value(value: user),
                // Provider<FirebaseStorageService>(
                //  create: (_) => FirebaseStorageService(uid: user.uid!),
                // ),
                Provider<FirestoreService>(
                  create: (_) => FirestoreService(uid: user.uid!),
                ),
              ],
              child: builder(context, snapshot), //HomePage(),
            );
          }
          return builder(context, snapshot); //LandingPage();
        });
  }
}
