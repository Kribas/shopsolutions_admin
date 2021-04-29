import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopsolutions_admin/db/category.dart';
import 'package:shopsolutions_admin/db/brand.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  Color white = Colors.white;
  Color black = Colors.black;
  Color grey = Colors.grey;
  Color red = Colors.red;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController productNameController = TextEditingController();
  List<DocumentSnapshot> brands = <DocumentSnapshot>[];
  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DropdownMenuItem<String>> categoriesDropDown = <DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> brandDropDown = <DropdownMenuItem<String>>[];
  String _currentCategory;
  String _curentBrand;


  @override
  void initState() {
   categoriesDropDown = getCategoriesDropdown();
  }

  List<DropdownMenuItem<String>> getCategoriesDropdown() {
    List<DropdownMenuItem<String>> items = List();
    for(DocumentSnapshot category in categories) {
      items.add(DropdownMenuItem(child: Text(category['brand']),
      value: category['brand'],
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: white,
        leading: Icon(Icons.close,color: black,),
        title: Text('add product',
        style: TextStyle(
          color: Colors.black
        ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                        borderSide: BorderSide(
                          color: grey.withOpacity(0.5),
                          width: 2.5
                        ),
                        onPressed: () {

                        },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14.0,40.0,14.0,40.0),
                        child: Icon(Icons.add,color: grey,),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      borderSide: BorderSide(
                          color: grey.withOpacity(0.5),
                          width: 2.5
                      ),
                      onPressed: () {

                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14.0,40.0,14.0,40.0),
                        child: Icon(Icons.add,color: grey,),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      borderSide: BorderSide(
                          color: grey.withOpacity(0.5),
                          width: 2.5
                      ),
                      onPressed: () {

                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14.0,40.0,14.0,40.0),
                        child: Icon(Icons.add,color: grey,),
                      ),
                    ),
                  ),
                )
              ],
            ),

            Text('Enter a product name with 10 characters at maximum',
            style: TextStyle(
              color: red,
              fontSize: 12,

            ),
              textAlign: TextAlign.center,
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: productNameController,
                decoration: InputDecoration(
                  hintText: 'Product Name'
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'You must enter the product name';
                  }else if(value.length > 10) {
                    return 'Product name cant have more than 10 letters';
                  }else {
                    return null;
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
