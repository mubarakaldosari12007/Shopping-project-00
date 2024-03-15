//تحتوي علي المنتجات المفضله
import 'package:flutter/material.dart';
import 'package:mubarak_project/helper/data.dart';
import 'package:mubarak_project/screens/products_screen/widgets/product_item.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}
//تصميم الصفحه 
class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Favourites',
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView.builder(
            itemCount: AppData.favProducts.length,
            padding: EdgeInsets.all(20),
            itemBuilder: (context, index) {
              return ProductItem(
                product: AppData.favProducts[index],
              );
            }),
      ),
    );
  }
}
