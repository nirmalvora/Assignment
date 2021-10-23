import 'package:flutter/cupertino.dart';
import 'package:sequoiacapdemo/core/constants/constants.dart';
import 'package:sequoiacapdemo/core/model/product_model.dart';

class ProductViewModel extends ChangeNotifier {
  List<ProductModel> _productList = products;

  List<ProductModel> get productList => _productList;

  set productList(List<ProductModel> value) {
    _productList = value;
    notifyListeners();
  }

  void addProduct(product) {
    productList.add(product);
    notifyListeners();
  }

  void editProduct(ProductModel productModel) {
    print("datataa");
    print(productModel.id);
    int index = productList.indexWhere((element) {
      print(element.id);
      return element.id == productModel.id;
    });
    productList[index] = productModel;
    notifyListeners();
  }
}
