import 'package:baraton_stores/models/user_model.dart';
import 'package:baraton_stores/pages/account_pic_page.dart';
import 'package:baraton_stores/services/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/authentication_service.dart';
import '../services/firebase_storage_service.dart';
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
                Provider<ImagePickerService>(
                  create: (_) => ImagePickerService(),
                ),
                Provider<FirebaseStorageService>(
                  create: (_) => FirebaseStorageService(uid: user.uid!),
                ),
                Provider<FirestoreService>(
                  create: (_) => FirestoreService(uid: user.uid!),
                ),
                Provider<Widget>(
                  create: (_) => AccountPicPage(uid: user.uid!),
                ),
              ],
              child: builder(context, snapshot), //HomePage(),
            );
          }
          return builder(context, snapshot); //LandingPage();
        });
  }
}
