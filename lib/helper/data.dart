import 'package:mubarak_project/models/product_model.dart';
//يخزن البيانات الخاصه بالتطبيق 
class AppData {
  //لتخزين فئات المنتجات 
  static List<String> categories = [];
  //هذه القائمة تُستخدم لتخزين المنتجات المفضلة في التطبيق
  static List<ProductModel> favProducts = [];
  //هدف إلى تخزين معرّفات المنتجات فقط دون تخزين التفاصيل الكاملة للمنتج. هذا يمكن أن يُستخدم لأغراض مثل تحميل معرفات المنتجات المفضلة بسرعة أو مزامنتها مع قاعدة البيانات على الخادم.

  static List<String> favIds = [];
}
