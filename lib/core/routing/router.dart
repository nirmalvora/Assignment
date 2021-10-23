import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sequoiacapdemo/core/model/add_product_request_model.dart';
import 'package:sequoiacapdemo/core/routing/routes.dart';
import 'package:sequoiacapdemo/ui/view/add_product_screen.dart';
import 'package:sequoiacapdemo/ui/view/home_screen.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HomeScreen:
        return MaterialPageRoute(
            builder: (context) => HomeScreen(), settings: settings);
      case Routes.AddProduct:
        AddProductArgument addProductArgument = settings.arguments != null
            ? settings.arguments as AddProductArgument
            : AddProductArgument();
        return MaterialPageRoute(
            builder: (context) => AddProduct(
                  addProductArgument: addProductArgument,
                ),
            settings: settings);
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text('The Page ${settings.name} does not exists.'),
            ),
          ),
        );
    }
  }
}
