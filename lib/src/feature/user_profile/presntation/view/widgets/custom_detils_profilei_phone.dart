import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/feature/user_profile/presntation/view/widgets/custom_text_field_profile.dart';

import '../../../../../core/validator/validater.dart';

class CustomDetilsProfileiPhone extends StatelessWidget {
  const CustomDetilsProfileiPhone({
    super.key,
    required this.value,
    this.onPressed,
    this.iconedit,
    required this.editprofile,
    required this.phoneController,
  });

  final TextEditingController phoneController;
  final IconData? iconedit;
  final String value;
  final void Function()? onPressed;
  final bool editprofile;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E3E),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Icon(
            Icons.phone,
            color: Colors.white,
            size: 24.sp,
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Phone",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 5.h),
                editprofile
                    ? Text(
                        value,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : SizedBox(
                        height: 50.h,
                        child: CustomTextFieldProfile(
                          controller: phoneController,
                          hintText: "Enter your phone",
                          validator: (phone) {
                            return MyValidator.phoneValidator(phone);
                          },
                        ),
                      ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              iconedit,
              color: Colors.blue,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
