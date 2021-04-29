import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopsolutions_admin/screens/admin.dart';
import 'package:provider/provider.dart';
import 'providers/app_states.dart';
import 'providers/product_provider.dart';
import 'package:shopsolutions_admin/screens/dashboard.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: AppState()),
      ChangeNotifierProvider.value(value: ProductProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    ),
  ));
}