import 'package:flutter/material.dart';
import 'package:projeto/main/factories/pages/category/category_page_factory.dart';
import 'package:projeto/main/factories/pages/home/home_page_factory.dart';
import 'package:projeto/main/factories/pages/login/login_page_factory.dart';
import 'package:projeto/main/factories/pages/user/user_page_factory.dart';
import 'package:projeto/main/factories/usecases/authentication_factory.dart';
import 'package:projeto/main/factories/usecases/create_category_factory.dart';
import 'package:projeto/main/factories/usecases/create_user_factory.dart';
import 'package:projeto/main/factories/usecases/list_category_factory.dart';
import 'package:projeto/main/factories/usecases/list_product_factory.dart';
import 'package:projeto/main/factories/usecases/save_current_account_factory.dart';
import 'package:projeto/pages/category/category_presentation.dart';
import 'package:projeto/pages/login/login.dart';
import 'package:projeto/pages/login/login_presentation.dart';
import 'package:projeto/pages/product/product_presentation.dart';
import 'package:projeto/pages/user/user_presentation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => LoginPresentation(
            authentication: makeRemoteAuthentication(),
            saveCurrentAccount: makeLocalSaveCurrentAccount()),
      ),
      ChangeNotifierProvider(
        create: (context) => UserPresentation(
          userRemote: makeRemoteCreateUser(),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => CategoryPresentation(
            categoryRemote: makeRemoteCreateCategory(),
            listCategoryRemote: makeRemoteListCategory()),
      ),
      ChangeNotifierProvider(
        create: (context) =>
            ProductPresentation(listProductRemote: makeRemoteListProduct()),
      ),
    ],
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Front',
      initialRoute: '/',
      routes: {
        "/": (context) => makeLoginPage(),
        "/home": (context) => makeHomePage(),
        "/user": (context) => makeUserPage(),
        "/category": (context) => makeCategoryPage()
      },
    );
  }
}
