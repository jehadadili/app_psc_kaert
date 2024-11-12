import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/cart/domain/model/cart_model.dart';

class CustomCounterCart extends StatefulWidget {
  const CustomCounterCart({
    super.key,
    required this.cartModel,
  });
  final CartModel cartModel;

  @override
  State<CustomCounterCart> createState() => _CustomCounterCartState();
}

class _CustomCounterCartState extends State<CustomCounterCart> {
  bool isEditing = false;

  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController =
        TextEditingController(text: widget.cartModel.countInStock.toString());
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              if (isEditing) {
                // حفظ التعديلات عندما يكون في وضع الحفظ
                widget.cartModel.countInStock =
                    int.tryParse(_textController.text) ??
                        widget.cartModel.quantity;
              }
              // تبديل حالة التعديل
              isEditing = !isEditing;
            });
          },
          icon: Icon(
            isEditing ? Icons.save : Icons.edit,
            color: ColorApp.blue,
          ),
        ),
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          color: ColorApp.charcoalBlue,
          child: SizedBox(
            width: 35.w,
            height: 35.h,
            child: Center(
              child: isEditing
                  ? TextField(
                      controller: _textController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorApp.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    )
                  : Text(
                      widget.cartModel.countInStock.toString(),
                      style: TextStyle(
                        color: ColorApp.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
