import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sequoiacapdemo/core/constants/color_constants.dart';
import 'package:sequoiacapdemo/core/model/add_product_request_model.dart';
import 'package:sequoiacapdemo/core/utils/utils.dart';
import 'package:sequoiacapdemo/core/viewmodels/add_product_view_model.dart';
import 'package:sequoiacapdemo/core/viewmodels/product_view_model.dart';
import 'package:sequoiacapdemo/ui/view/base_view.dart';
import 'package:sequoiacapdemo/ui/widget/common_button.dart';
import 'package:sequoiacapdemo/ui/widget/common_scroll_view.dart';

class AddProduct extends StatefulWidget {
  final AddProductArgument? addProductArgument;

  const AddProduct({Key? key, required this.addProductArgument})
      : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  void initState() {
    super.initState();
    checkRoute();
  }

  AddProductViewModel? model;
  ProductViewModel? productViewModel;
  @override
  Widget build(BuildContext context) {
    productViewModel = Provider.of<ProductViewModel>(context);
    return BaseView<AddProductViewModel>(
      onModelReady: (model) {
        this.model = model;
        if (widget.addProductArgument!.productModel != null) {
          model.id = widget.addProductArgument!.productModel!.id!;
          model.nameController.text =
              widget.addProductArgument!.productModel!.name!;
          model.launchedAt.text = DateFormat("yyyy-MM-dd").format(
              DateFormat("dd-MM-yyyy")
                  .parse(widget.addProductArgument!.productModel!.launchedAt!));
          model.launchSiteController.text =
              widget.addProductArgument!.productModel!.launchSite!;
          model.rating = widget.addProductArgument!.productModel!.popularity!;
        }
      },
      builder: (context, model, child) {
        return CommonScrollView(
          appBar: AppBar(
            title: Text(
              "Add Product",
              style: Utils.H5Bold16(color: ColorConstants.appBarTitleColor),
            ),
            backgroundColor: ColorConstants.appBarColor,
            actions: [],
            iconTheme: IconThemeData(color: Colors.black),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width > 400
                      ? 400
                      : MediaQuery.of(context).size.width,
                  child: Card(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Form(
                        key: model.formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: model.nameController,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == "") {
                                  return 'Please enter name';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: "Name",
                              ),
                              style: Utils.regularTextStyle(
                                fontSize: 16,
                                color: ColorConstants.primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DateTimePicker(
                              initialDate:
                                  widget.addProductArgument!.productModel !=
                                          null
                                      ? DateFormat("dd-MM-yyyy").parse(widget
                                          .addProductArgument!
                                          .productModel!
                                          .launchedAt!)
                                      : null,
                              controller: model.launchedAt,
                              type: DateTimePickerType.date,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              dateMask: 'dd-MM-yyyy',
                              validator: (value) {
                                if (value == "") {
                                  return 'Please select date';
                                }
                                return null;
                              },
                              icon: Icon(Icons.event),
                              dateLabelText: 'Date',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: model.launchSiteController,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == "") {
                                  return 'Please enter launch site';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                              decoration:
                                  InputDecoration(labelText: "Launch Site"),
                              style: Utils.regularTextStyle(
                                fontSize: 16,
                                color: ColorConstants.primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RatingBar.builder(
                              initialRating: model.rating,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemSize: 20,
                              onRatingUpdate: (rating) {
                                model.rating = rating;
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 24, bottom: 10),
                              child: Hero(
                                tag: "login-button",
                                child: CustomButton(
                                  onPress: () {
                                    model.addProduct(
                                        productViewModel!,
                                        widget.addProductArgument!
                                                .productModel !=
                                            null);
                                  },
                                  text:
                                      widget.addProductArgument!.productModel !=
                                              null
                                          ? "Edit"
                                          : "Add",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer()
            ],
          ),
        );
      },
    );
  }

  Future<void> checkRoute() async {
    await Future.delayed(Duration(milliseconds: 20));
    if (widget.addProductArgument!.previousScreen == null ||
        widget.addProductArgument!.previousScreen! != "home") {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    model!.resetData();
    super.dispose();
  }
}
