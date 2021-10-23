import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:sequoiacapdemo/core/constants/color_constants.dart';
import 'package:sequoiacapdemo/core/model/add_product_request_model.dart';
import 'package:sequoiacapdemo/core/routing/routes.dart';
import 'package:sequoiacapdemo/core/utils/utils.dart';
import 'package:sequoiacapdemo/core/viewmodels/product_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isList = true;
  ProductViewModel? productViewModel;
  @override
  Widget build(BuildContext context) {
    productViewModel = Provider.of<ProductViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Home",
          style: Utils.H5Bold16(color: ColorConstants.appBarTitleColor),
        ),
        backgroundColor: ColorConstants.appBarColor,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isList = !isList;
              });
            },
            icon: Icon(
              isList ? Icons.grid_view : Icons.list,
              color: ColorConstants.actionBarIconColor,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.AddProduct,
                  arguments: AddProductArgument(previousScreen: "home"));
            },
            icon: Icon(
              Icons.add,
              color: ColorConstants.actionBarIconColor,
            ),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth <= 600;
          return isList
              ? ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      color: Colors.white,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: constraints.maxWidth > 600
                                  ? Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(productViewModel!
                                                      .productList[index]
                                                      .name!),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    productViewModel!
                                                        .productList[index]
                                                        .launchedAt!,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    productViewModel!
                                                        .productList[index]
                                                        .launchSite!,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: RatingBar.builder(
                                                    updateOnDrag: false,
                                                    ignoreGestures: true,
                                                    initialRating:
                                                        productViewModel!
                                                            .productList[index]
                                                            .popularity!,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.0),
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                    itemSize:
                                                        constraints.maxWidth <=
                                                                800
                                                            ? 16
                                                            : 20,
                                                    onRatingUpdate: (rating) {
                                                      print(rating);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                productViewModel!
                                                    .productList[index].name!,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                productViewModel!
                                                    .productList[index]
                                                    .launchedAt!,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                productViewModel!
                                                    .productList[index]
                                                    .launchSite!,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: RatingBar.builder(
                                                initialRating: productViewModel!
                                                    .productList[index]
                                                    .popularity!,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                updateOnDrag: false,
                                                ignoreGestures: true,
                                                itemCount: 5,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 10,
                                                ),
                                                itemSize: isMobile ? 18 : 20,
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                            ),
                            _buildActionIcons(index: index)
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: productViewModel!.productList.length,
                )
              : GridView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8),
                  itemCount: productViewModel!.productList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    productViewModel!.productList[index].name!,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    productViewModel!
                                        .productList[index].launchedAt!,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    productViewModel!
                                        .productList[index].launchSite!,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Expanded(
                                  child: RatingBar.builder(
                                    updateOnDrag: false,
                                    ignoreGestures: true,
                                    initialRating: productViewModel!
                                        .productList[index].popularity!,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 10,
                                    ),
                                    itemSize: isMobile ? 16 : 18,
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            _buildActionIcons(index: index)
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }

  _buildActionIcons({required int index}) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.AddProduct,
                arguments: AddProductArgument(
                    previousScreen: "home",
                    productModel: productViewModel!.productList[index]));
          },
          child: Container(
            child: Icon(Icons.edit),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            _showDeleteAlert(index: index);
          },
          child: Container(
            child: Icon(
              Icons.delete,
              color: ColorConstants.deleteIconColor,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Future<void> _showDeleteAlert({required int index}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: Row(
            children: [Expanded(child: Text('Do you really want to delete?'))],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                productViewModel!.productList.removeAt(index);
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
