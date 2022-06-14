import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/constants/text.dart';
import 'package:baraton_stores/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../services/firestore_service.dart';

class ComputerProductForm extends StatefulWidget {
  const ComputerProductForm({Key? key, this.product}) : super(key: key);
  final ProductItem? product;

  @override
  State<ComputerProductForm> createState() => _ComputerProductFormState();
}

class _ComputerProductFormState extends State<ComputerProductForm> {
  final _formKey = GlobalKey<FormState>();

  late String? _price;
  late String? _item;

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
      final time = DateTime.now().toIso8601String();
      final item = ProductItem(
        price: _price,
        productname: _item,
        timeStamp: time,
        userId: userId,
      );
      final firestoreservice =
          Provider.of<FirestoreService>(context, listen: false);
      await firestoreservice.setProduct(item);
      await firestoreservice.setProductAll(item);
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
        onSaved: (value) => _price = value,
        style: const TextStyle(fontWeight: FontWeight.w600),
        keyboardType: TextInputType.visiblePassword,
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
