// مكتبة لي استيراد البيانات  
import 'package:http/http.dart' as http;



  //تخزين الرابط الاساسي الموقع الي نجيب منه البيانات 
class HttpHelper {
  static String baseUrl = 'https://fakestoreapi.com';




 // function مسئول عن جلب البيانات من السيرفر 
  static Future<dynamic> get(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
      return _handleResponse(response);
    } catch (error) {
      throw Exception('Error during HTTP GET request: $error');
    }
  }



 // function مسئوله عن التاكد من رجوك البيانات  بشكل صحيح 
  static dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(
          'HTTP request failed with status: ${response.statusCode}');
    }
 
  }



}
