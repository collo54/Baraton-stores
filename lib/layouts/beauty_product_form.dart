import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/constants/text.dart';
import 'package:baraton_stores/models/product_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../services/firebase_storage_service.dart';
import '../services/firestore_service.dart';
import '../services/image_picker.dart';

class BeautyProductform extends StatefulWidget {
  const BeautyProductform({Key? key, this.product}) : super(key: key);
  final ProductItem? product;

  @override
  State<BeautyProductform> createState() => _BeautyProductformState();
}

class _BeautyProductformState extends State<BeautyProductform> {
  final _formKey = GlobalKey<FormState>();
  PlatformFile? _pickedFile;
  UploadTask? uploadTask;
  String? _downloadurl;
  double? _price;
  String? _item;

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      _item = widget.product!.productname;
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
      final userId = FirebaseAuth.instance.currentUser!.uid;
      //final timeStamp = DateTime.now().millisecondsSinceEpoch;
      final id = widget.product?.id ?? documentIdFromCurrentDate();
      final time = DateTime.now().toIso8601String();
      final item = ProductItem(
        id: id,
        downloadUrl: _downloadurl,
        price: _price,
        productname: _item,
        timeStamp: time,
        userId: userId,
      );
      final firestoreservice =
          Provider.of<FirestoreService>(context, listen: false);
      await firestoreservice.addprod(item);
      await firestoreservice.setProductAll(item);
    }
  }

  Future<void> _pickfile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles();

    setState(() {
      _pickedFile = result?.files.first;
    });
  }

  Future<void> _addImage(BuildContext context) async {
    if (kIsWeb) {
      final bytes = _pickedFile!.bytes;
      final path = _pickedFile!.name;
      Reference ref = await FirebaseStorage.instance.ref('uploads/$path');
      setState(() {
        uploadTask = ref.putData(bytes!);
      });

      final snapshot = await uploadTask!.snapshot;
      final url = await snapshot.ref.getDownloadURL();

      _downloadurl = url;
    } else {
      //write a code for android or ios
    }

    if (kDebugMode) {
      print(_downloadurl);
    }
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
        height: 900,
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
        SizedBox(
          height: 15,
        ),
        if (uploadTask != null) buildProgress(),
        SizedBox(
          height: 15,
        ),
        if (_pickedFile != null)
          Text(
            _pickedFile!.name,
            style: tcapacityother,
          ),
        SizedBox(
          height: 15,
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
            _pickfile(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Text(
              "pick product image",
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
        const SizedBox(
          height: 15,
        ),
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
              "upload product image",
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
        const SizedBox(
          height: 15,
        ),
        MaterialButton(
          color: kcartbutton,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(1.0))),
          onPressed: () {
            _gobackPage(context);
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

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask!.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          double progress = data!.bytesTransferred / data.totalBytes;
          return SizedBox(
            height: 50,
            child: Stack(
              fit: StackFit.expand,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: kgreytext,
                  color: kPrimaryOrange,
                ),
                Center(
                  child: Text(
                    '${(100 * progress).roundToDouble()}%',
                    style: tprogress,
                  ),
                )
              ],
            ),
          );
        }
        return Text(
          'retry',
          style: tcheckoutprice,
        );
      });

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

  _gobackPage(BuildContext context) {
    _submit();
    Navigator.of(context).pop();
  }
}
