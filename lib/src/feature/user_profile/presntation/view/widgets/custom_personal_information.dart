import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/feature/auth/domain/model/register_modeal.dart';
import 'package:market/src/feature/user_profile/presntation/cubit/cubit.dart';
import 'package:market/src/feature/user_profile/presntation/view/widgets/custom_detils_profilei.dart';
import 'package:intl/intl.dart';
import 'package:market/src/feature/user_profile/presntation/view/widgets/custom_section_title.dart'; // مكتبة لعرض التاريخ

class CustomPersonalInformation extends StatefulWidget {
  const CustomPersonalInformation({super.key, required this.authModeal});
  final AuthModeal authModeal;

  @override
  State<CustomPersonalInformation> createState() =>
      _CustomPersonalInformationState();
}

class _CustomPersonalInformationState extends State<CustomPersonalInformation> {
  bool edit = true;
  TextEditingController textusernameController = TextEditingController();
  TextEditingController textemailController = TextEditingController();
  TextEditingController textnumperController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProfileCubit ubdatecubit = BlocProvider.of<ProfileCubit>(context);
    final String currentDate =
        DateFormat('EEEE, dd MMM, yyyy').format(DateTime.now());

    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 50.r,
            backgroundColor: Colors.pinkAccent,
            child: CircleAvatar(
              radius: 48.r,
              backgroundImage:
                  NetworkImage(widget.authModeal.user?.profileImage),
            ),
          ),
        ),
        SizedBox(height: 15.h),
        // اسم المستخدم
        Text(
          widget.authModeal.user?.name ?? "User Name",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5.h),
        // التاريخ الحالي
        Text(
          currentDate,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 30.h),
        // المعلومات الشخصية
        CustomSectionTitle(
          savedata: edit,
          title: "Personal Information",
          onPressed: () {
            ubdatecubit.ubdateProfile(
                name: textnumperController.text,
                email: textemailController.text,
                phone: textnumperController.text,
                password: "");
          },
        ),
        SizedBox(height: 10.h),
        CustomDetilsProfilei(
          icon: Icons.person,
          title: "Name",
          value: widget.authModeal.user?.name ?? "Unknown",
          iconedit: Icons.edit,
          onPressed: () {
            setState(() {
              edit = !edit;
            });
          },
          editprofile: edit,
          controller: textusernameController,
        ),
        // CustomDetilsProfilei(
        //   icon: Icons.email,
        //   iconedit: Icons.edit,
        //   onPressed: () {
        //     setState(() {
        //       edit = !edit;
        //     });
        //   },
        //   controller: textemailController,
        //   editprofile: edit,
        //   title: "Email",
        //   value: widget.authModeal.user?.email ?? "",
        // ),
        // CustomDetilsProfilei(
        //   icon: Icons.phone,
        //   title: "Phone",
        //   value: widget.authModeal.user?.phone ?? "",
        // ),
        // CustomDetilsProfilei(
        //   icon: Icons.insert_drive_file,
        //   title: "National ID",
        //   value: widget.authModeal.user?.nationalId ?? "",
        // ),
        // CustomDetilsProfilei(
        //   icon: Icons.insert_drive_file,
        //   title: "Gender",
        //   value: widget.authModeal.user?.gender ?? "",
        // ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
