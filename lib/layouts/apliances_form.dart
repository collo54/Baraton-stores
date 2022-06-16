import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/constants/text.dart';
import 'package:baraton_stores/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/new_product_model.dart';
import '../services/firebase_storage_service.dart';
import '../services/firestore_service.dart';
import '../services/image_picker.dart';

class Apliancesform extends StatefulWidget {
  const Apliancesform({Key? key, this.newproduct}) : super(key: key);
  final NewProductItem? newproduct;

  @override
  State<Apliancesform> createState() => _ApliancesformState();
}

class _ApliancesformState extends State<Apliancesform> {
  final _formKey = GlobalKey<FormState>();

  double? _price;
  String? _item;
  String? _downloadurl;
  bool? _verify;

  @override
  void initState() {
    super.initState();
    if (widget.newproduct != null) {
      _item = widget.newproduct!.productname;
      // _message = widget.messager.message;
    }
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      form.reset();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      // 1. Get image from picker

      final userId = FirebaseAuth.instance.currentUser!.uid;

      final id = widget.newproduct?.id ?? documentIdFromCurrentDate();
      final time = DateTime.now().toIso8601String();
      final item = NewProductItem(
        downloadUrl: _downloadurl,
        verify: _verify,
        id: id,
        price: _price,
        productname: _item,
        timeStamp: time,
        userId: userId,
      );
      final firestoreservice =
          Provider.of<FirestoreService>(context, listen: false);
      await firestoreservice.setappliance(item);
      // await firestoreservice.setProductAll(item);
    }
  }

  void _addImage(BuildContext context) async {
    /* // Navigator.of(context).pop();
    final imagePicker = Provider.of<ImagePickerService>(context, listen: false);
    final file = await imagePicker.pickImage(source: ImageSource.gallery);
    final storage = Provider.of<FirebaseStorageService>(context, listen: false);
    final downloadUrl = await storage.uploadAvatar(file: file);

    _downloadurl = downloadUrl;
    if (kDebugMode) {
      print(_downloadurl);
    
    }*/
    setState(() {
      _verify = false;
    });
  }

  void _addImage2(BuildContext context) async {
    /* // Navigator.of(context).pop();
    final imagePicker = Provider.of<ImagePickerService>(context, listen: false);
    final file = await imagePicker.pickImage(source: ImageSource.gallery);
    final storage = Provider.of<FirebaseStorageService>(context, listen: false);
    final downloadUrl = await storage.uploadAvatar(file: file);

    _downloadurl = downloadUrl;
    if (kDebugMode) {
      print(_downloadurl);
    
    }*/
    setState(() {
      _verify = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(constraints.biggest.width, context),
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
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: const BoxDecoration(
          color: kpagewhite,
        ),
        width: width,
        height: 680,
        child: _buildMessage(context),
      ),
    ];
  }

  Widget _buildMessage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        Card(
          color: kwhite,
          child: _buildForm(),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Add a product',
            style: theadlinetext,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildAddCartButton(context),
        ),
      ],
    );
  }

  _buildAddCartButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MaterialButton(
          color: kPrimaryOrange,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(1.0))),
          onPressed: () {
            _addImage(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Text(
              " false",
              style: GoogleFonts.abhayaLibre(
                textStyle: const TextStyle(
                  height: 1.2,
                  color: kwhite,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        MaterialButton(
          color: kPrimaryOrange,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(1.0))),
          onPressed: () {
            _addImage2(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Text(
              " true",
              style: GoogleFonts.abhayaLibre(
                textStyle: const TextStyle(
                  height: 1.2,
                  color: kwhite,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        MaterialButton(
          color: kcartbutton,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(1.0))),
          onPressed: () {
            _submit();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Text(
              "add product",
              style: GoogleFonts.abhayaLibre(
                textStyle: const TextStyle(
                  height: 1.2,
                  color: kwhite,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
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
      const SizedBox(
        height: 30,
      ),
      Text(
        'Product',
        style: GoogleFonts.ptMono(
          textStyle: const TextStyle(
            color: kgreytext,
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
            return 'enter Item';
          }
          return null;
        },
        //initialValue: _name,
        onSaved: (value) => _item = value,
        style: const TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          fillColor: kpagewhite,
          filled: true,
          labelText: 'product',
          labelStyle: const TextStyle(color: kgreytext),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: kwhite),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusColor: const Color.fromRGBO(243, 242, 242, 1),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 1.0),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 1.0),
            borderRadius: BorderRadius.circular(9.0),
          ),
          hintStyle: const TextStyle(color: kgreytext),
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 30,
      ),
      Text(
        'Item Cost',
        style: GoogleFonts.ptMono(
          textStyle: const TextStyle(
            color: kgreytext,
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
            return 'product price';
          }
          return null;
        },
        //initialValue: _name,
        onSaved: (value) => _price = double.parse(value!),
        style: const TextStyle(fontWeight: FontWeight.w600),
        //keyboardType: TextInputType.visiblePassword,
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
          decimal: true,
        ),
        decoration: InputDecoration(
          fillColor: kpagewhite,
          filled: true,
          labelText: 'product price',
          labelStyle: const TextStyle(color: kgreytext),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: kwhite),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusColor: const Color.fromRGBO(243, 242, 242, 1),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 1.0),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 2.0),
            borderRadius: BorderRadius.circular(9.0),
          ),
          hintStyle: const TextStyle(color: kgreytext),
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    ];
  }
}
