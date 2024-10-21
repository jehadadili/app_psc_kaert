import 'package:flutter/material.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class CustomDesinFavor extends StatelessWidget {
  const CustomDesinFavor({super.key, required this.homeModel});
  final HomeModel homeModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // لتحسين المحاذاة الرأسية
          children: [
            Image.network(
              homeModel.image,
              width: 110,
              height: 110,
              fit: BoxFit.fill, // لتعديل حجم الصورة بما يناسب المساحة
            ),
            const SizedBox(width: 16), // المسافة بين الصورة والنصوص
            Expanded(
              // يضمن أن النص يأخذ المساحة المتاحة فقط
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // محاذاة النص إلى اليسار
                  children: [
                    Text(
                      homeModel.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      homeModel.description,
                      maxLines: 1, // الحد الأقصى لعدد الأسطر للوصف
                      overflow: TextOverflow
                          .ellipsis, // إضافة ثلاث نقاط إذا كان النص طويلًا
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 15), // المسافة بين النصوص
                    Row(
                      children: [
                        Text(
                          '\$${homeModel.price}', // تنسيق السعر
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
