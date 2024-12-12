import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDate extends StatefulWidget {
  const CustomDate({super.key});

  @override
  State<CustomDate> createState() => _CustomDateState();
}

class _CustomDateState extends State<CustomDate> {
  DateTime selectedDate = DateTime.now();

  // فتح نافذة اختيار التاريخ
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2999),
    ).then((value) {
      // التحقق من أن القيمة ليست فارغة
      if (value != null) {
        setState(() {
          selectedDate = value; // تحديث الحالة
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40, // ضبط الارتفاع
      padding: EdgeInsets.symmetric(horizontal: 17), // إضافة الهوامش
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6), // حواف دائرية
        color: Colors.purple.withOpacity(0.15), // لون الخلفية
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: _showDatePicker,
            icon: Icon(Icons.calendar_today, size: 20),
          ),
          SizedBox(width: 10), // إضافة مسافة بين العناصر

          // جعل النص قابلاً للتوسع لتجنب Overflow
          Material(
            child: Text(
              DateFormat('yyyy-MM-dd').format(selectedDate),
              style: TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
