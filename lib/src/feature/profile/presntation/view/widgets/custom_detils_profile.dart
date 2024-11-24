import 'package:flutter/material.dart';
import 'package:market/src/core/style/image/image_app.dart';
import 'package:market/src/feature/auth/domain/model/register_modeal.dart';

class CustomDetailsProfile extends StatelessWidget {
  const CustomDetailsProfile({super.key, required this.authModeal, this.groupValue, this.onChanged});
  final String? groupValue;
  final void Function(String?)? onChanged;
  final AuthModeal authModeal;
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
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(authModeal.user!.profileImage),
          ),
          const SizedBox(height: 10),
          Text(
            authModeal.user!.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            authModeal.user!.email,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            authModeal.user!.nationalId,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 14,
            ),
          ),
          Text(
            authModeal.user!.phone,
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
