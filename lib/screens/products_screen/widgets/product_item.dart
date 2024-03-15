//والوصف والسعر. يوفر أيضًا زرًا لإضافة أو إزالة المنتج من قائمة المفضلة. عند النقر على الزر، يتم تغيير حالة المفضلة وتحديث واجهة المستخدم وإضافة أو إزالة المنتج من قائمة المفضلة.
import 'package:flutter/material.dart';
import 'package:mubarak_project/helper/data.dart';
import 'package:mubarak_project/models/product_model.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.grey.shade100,
      ),
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            height: 160,
            width: double.infinity,
            color: Colors.grey.shade200,
            child: Center(
              child: Image.network(
                widget.product.image ?? '',
                height: 150,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.product.title ?? '',
                  maxLines: 1,
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  widget.product.description ?? '',
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      '${widget.product.price} \$',
                      maxLines: 3,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue),
                    ),
                    Spacer(),
                    if (widget.product.isFav!)
                      GestureDetector(
                        onTap: () {
                          widget.product.isFav = false;
                          setState(() {});
                          AppData.favProducts.remove(widget.product);
                          AppData.favIds.remove(widget.product.id ?? '');
                        },
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    if (!widget.product.isFav!)
                      GestureDetector(
                        onTap: () {
                          widget.product.isFav = true;
                          setState(() {});
                          AppData.favProducts.add(widget.product);
                          AppData.favIds.add(widget.product.id ?? '');
                        },
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.deepOrange,
                        ),
                      )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
