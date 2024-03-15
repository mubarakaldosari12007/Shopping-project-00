//تحتوي علي المنتجات المحمله من السيرفر
import 'package:flutter/material.dart';
import 'package:mubarak_project/helper/data.dart';
import 'package:mubarak_project/helper/http_helper.dart';
import 'package:mubarak_project/models/product_model.dart';
import 'package:mubarak_project/screens/products_screen/widgets/product_item.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, required this.categoryName});
  final String categoryName;
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool loading = true;
  List<ProductModel> products = [];
//
  @override
  void initState() {
    // TODO: implement initState
    getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          widget.categoryName,
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: SizedBox(
        width: double.infinity,
        child: loading
            //جعل اللودر بالنص الصفه
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.deepOrange,
                ),
              )
            : ListView.builder(
                itemCount: products.length,
                padding: EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: products[index],
                  );
                }),
      ),
    );
  }

  // استدعاء المنتجات من API السيرفر
  getCategories() async {
    //
    var result =
        await HttpHelper.get('products/category/${widget.categoryName}');
    products = productFromJson(result);
    products.forEach((element) {
      if (AppData.favIds.contains(element.id)) {
        element.isFav = true;
      }
    });
    //الانتظر 500 ملي ثانية  بعد  كمل
    Future.delayed(
      Duration(milliseconds: 500),
      () {
        loading = false;
        setState(() {});
      },
    );
  }
}
