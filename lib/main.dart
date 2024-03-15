//التي توفر وظائف لتحويل البيانات بين تنسيقات مختلفة
import 'dart:convert';
//ومكونات Flutter المتعلقة بالمواد المرئية والتفاعلية، مثل الأزرار والمربعات والنصوص
import 'package:flutter/material.dart';
//خاصه في استدعاء البيانات من السيرفر للتطبيق
import 'package:mubarak_project/helper/data.dart';
//خاصه في استدعاء البيانات من السيرفر للتطبيق
import 'package:mubarak_project/helper/http_helper.dart';
//استدعاء الملف الي اسمه catr=egory_screen
import 'package:mubarak_project/screens/category_screen/category_screen.dart';

void main() {
  runApp(const MyApp());
}

//الصفحه البيضاء للتطبيق الشكل
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //خط لتطبيق كامل
        fontFamily: 'Roboto',
        useMaterial3: true,
        
      ),
      home: const MyAppMubarak(),
    );
  }
}

class MyAppMubarak extends StatefulWidget {
  const MyAppMubarak({super.key});

  @override
  State<MyAppMubarak> createState() => _MyAppMubarakState();
}

class _MyAppMubarakState extends State<MyAppMubarak> {
  // يتم استخدام هذا الكود لتأخير الانتقال إلى شاشة جديدةجلب الفئات المطلوبة من الخادم باستخدام getCategories()، وبعد ذلك يتم استبدال الشاشة الحالية بالشاشة الجديدة.
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(milliseconds: 200), () {
      getCategories().then((result) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => CategoryScreen()));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //لوقو عند تشغيل التطبيق محفوظه في اللجهاز
            Image.asset(
              'assets/images/logo.png',
            ),
            Text(
              'Welcome To',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrange,
                  height: 1,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
            Text(
              'Mubarak Store',
              style: TextStyle(fontSize: 30, color: Colors.lightBlue),
            ),
            SizedBox(
              height: 40,
            ),
            //دائرة على الشاشة لحين وصول البيانات تعلمية لي معرفه انه جاري الوصول للبيانات بالتطبيق من السيرفر
            CircularProgressIndicator(
              color: Colors.deepOrange,
            )
          ],
        ),
      ),
    );
  }

//function تقوم في استدعاء البيانات من السيرفر وتحويله الى لغه دارت وتخزن البيانات من السيرفر في التطبيق
  getCategories() async {
    var result = await HttpHelper.get('products/categories/');
    json.decode(result).forEach((element) {
      AppData.categories.add(element.toString());
    });
  }
}
