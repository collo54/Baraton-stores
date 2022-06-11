import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/pages/onboarding_page_one.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../pages/onboarding_page_five_b.dart';
import '../services/authentication_service.dart';

class OnboardingLayoutFiveA extends StatefulWidget {
  const OnboardingLayoutFiveA({Key? key}) : super(key: key);

  @override
  State<OnboardingLayoutFiveA> createState() => _OnboardingLayoutFiveAState();
}

class _OnboardingLayoutFiveAState extends State<OnboardingLayoutFiveA> {
  final _formKey = GlobalKey<FormState>();

  late final String? _name;
  late String? _email;
  late String? _password;

  //A future asynchronous field that implements authservice to sign in anonymously when
  // user clicks anonymous button
  Future<void> _signInAnonymously() async {
    try {
      //  final auth = ref.read(authenticate);
      // final user = await auth.signInAnonymously();
      // print('uid: ${user!.uid}');
    } catch (e) {
      print(e);
    }
  }

  Future<void> _submit() async {
    try {
      if (_validateAndSaveForm()) {
        print('$_email');
        final auth = Provider.of<AuthenticationService>(context, listen: false);
        await auth.createUserWithEmailAndPassword(_email!, _password!);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Flex(
            direction: Axis.vertical,
            children: pageChildren(constraints.biggest.width / 2, context),
          );
        } else {
          return Flex(
            direction: Axis.vertical,
            children: pageChildren(constraints.biggest.width, context),
          );
        }
      },
    );
  }

  List<Widget> pageChildren(double width, BuildContext context) {
    return <Widget>[
      Container(
        // color: Colors.white70,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: const BoxDecoration(
          color: kPrimaryOrange,
        ),
        width: width,
        child: _buildMessage(context),
      ),
    ];
  }

  Widget _buildMessage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Create an account',
            style: GoogleFonts.ptMono(
              textStyle: const TextStyle(
                height: 1.1,
                color: kwhite,
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: _buildForm()),
        const SizedBox(
          height: 30,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: _buildButtons()),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const OnboardingPageFiveB()),
              );
            },
            child: Text(
              'Already have an account? log in',
              style: GoogleFonts.abhayaLibre(
                textStyle: const TextStyle(
                  height: 1.2,
                  color: kwhite,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'Skip for now',
              style: GoogleFonts.abhayaLibre(
                textStyle: const TextStyle(
                  height: 1.2,
                  color: kwhite,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget _buildButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MaterialButton(
          // minWidth: 90,
          elevation: 2,
          color: kwhite,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(9.0))),
          onPressed: () {
            _submit();
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
            child: Text(
              'validate',
              style: TextStyle(
                  color: kbluefacebook,
                  fontSize: 14,
                  fontStyle: FontStyle.normal),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFormChildren(),
      ),
    );
  }

  List<Widget> _buildFormChildren() {
    return [
      const SizedBox(
        height: 8,
      ),
      Text(
        'full name',
        style: GoogleFonts.ptMono(
          textStyle: const TextStyle(
            color: kwhite,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'enter your full name';
          }
          return null;
        },
        //initialValue: _name,
        onSaved: (value) => _name = value,
        style: const TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          fillColor: kPrimaryOrange,
          filled: true,
          labelText: 'full name',
          labelStyle: const TextStyle(color: kwhite),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: kwhite,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusColor: const Color.fromRGBO(243, 242, 242, 1),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 2.0),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 2.0),
            borderRadius: BorderRadius.circular(9.0),
          ),
          hintStyle: const TextStyle(color: kwhite),
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 30,
      ),
      Text(
        'Email',
        style: GoogleFonts.ptMono(
          textStyle: const TextStyle(
            color: kwhite,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'enter email';
          }
          return null;
        },
        //initialValue: _name,
        onSaved: (value) => _email = value!,
        style: const TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          fillColor: kPrimaryOrange,
          filled: true,
          labelText: 'email',
          labelStyle: const TextStyle(color: kwhite),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: kwhite),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusColor: const Color.fromRGBO(243, 242, 242, 1),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 2.0),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 2.0),
            borderRadius: BorderRadius.circular(9.0),
          ),
          hintStyle: const TextStyle(color: kwhite),
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 30,
      ),
      Text(
        'password',
        style: GoogleFonts.ptMono(
          textStyle: const TextStyle(
            color: kwhite,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'enter password';
          }
          return null;
        },
        //initialValue: _name,
        onSaved: (value) => _password = value,
        style: const TextStyle(fontWeight: FontWeight.w600),
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          fillColor: kPrimaryOrange,
          filled: true,
          labelText: 'password',
          labelStyle: const TextStyle(color: kwhite),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: kwhite),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusColor: const Color.fromRGBO(243, 242, 242, 1),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 2.0),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 2.0),
            borderRadius: BorderRadius.circular(9.0),
          ),
          hintStyle: const TextStyle(color: kwhite),
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    ];
  }
}
