//تحتوي علي التصنيفات الخاصه بالمنتجات
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mubarak_project/helper/data.dart';
import 'package:mubarak_project/screens/fav_products/fav_screen.dart';
import 'package:mubarak_project/screens/products_screen/products_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mubark Store',
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: AppData.categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => ProductsScreen(
                        categoryName: AppData.categories[index])));
              },
              //خصائص التطبيق
              child: Card(
                color: Colors.white,
                elevation: 5,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Container(
                  padding: EdgeInsets.all(30),
                  color: Colors.white,
                  child: Center(
                      child: Text(
                    AppData.categories[index],
                    style: TextStyle(
                        color: getRandomColor(),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            );
          },
        ),
      ),
      //زر المفضله او حفظ المنتجات
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => FavScreen()));
        },
        backgroundColor: Colors.lightBlue,
        child: Icon(
          Icons.favorite,
          color: Colors.white,
        ),
      ),
    );
  }

  //تغير اللون النصوص بشكل عشوائي
  Color getRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }
}
