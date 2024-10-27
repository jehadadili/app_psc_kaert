import 'package:flutter/material.dart';
import 'package:market/src/core/style/image/image_app.dart';

class CustomDetailsProfile extends StatelessWidget {
  const CustomDetailsProfile({super.key, this.groupValue, this.onChanged});
  
  final String? groupValue;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(ImageApp.logo), // تأكد من أن المرجع صحيح
          ),
          const SizedBox(height: 10),
          const Text(
            'Jehad Adili',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'JacobMichael@gmail.com',
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'ID: 1789-12345688',
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 14,
            ),
          ),
          Text(
            '010 454684354',
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Radio<String>(
                    value: 'Male',
                    groupValue: groupValue,
                    onChanged: onChanged,
                    activeColor: Colors.indigo,
                  ),
                  const Text('Male', style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'Female',
                    groupValue: groupValue,
                    onChanged: onChanged,
                    activeColor: Colors.indigo,
                  ),
                  const Text('Female', style: TextStyle(color: Colors.black)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
