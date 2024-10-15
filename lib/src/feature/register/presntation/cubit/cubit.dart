import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:market/src/feature/register/domain/use_case/use_case_login.dart';
import 'package:market/src/feature/register/presntation/cubit/state.dart';

import '../../domain/use_case/use_case_register.dart';

class RegisterCubit extends Cubit<RegisterState> {
  static RegisterCubit get(context) => BlocProvider.of(context);
  final UseCaseLogin useCaseLogin;

  final AddUserUseCase addUserUseCase;
  RegisterCubit({
    required this.addUserUseCase,
    required this.useCaseLogin,
  }) : super(RegisterInitial());
  addUserRegister({
    required name,
    required email,
    required phone,
    required nationalId,
    required gender,
    required password,
    required token,
  }) async {
    try {
      emit(RegisterLoading());
      var respone = await addUserUseCase.addUserUsecaseRegister(
        name: name,
        email: email,
        phone: phone,
        nationalId: nationalId,
        gender: gender,
        profileImage: userimage,
        password: password,
        token: token,
      );
      if (kDebugMode) {
        log(respone.user!.name.toString());
        log(respone.status.toString());
      }
      emit(RegisterSuccess(registerModeal: respone));
    } catch (error) {
      log(error.toString());
      emit(RegisterError(error: "failure error this $error ".toString()));
    }
  }

  ImagePicker picker = ImagePicker();

  File? image;

  Uint8List? bytas;

  String userimage = "";

  addImage() async {
    final pickedfile = await picker.pickImage(source: ImageSource.camera);

    if (pickedfile != null) {
      image = File(pickedfile.path);
      bytas = File(image!.path).readAsBytesSync();
      userimage = base64Encode(bytas!);
      log(userimage.toString());
      emit(ChoesImage());
    } else {
      emit(ChoesImageError(error: "Image loading failed"));
    }
  }

  logincubit({
    required email,
    required password,
  }) async {
    emit(RegisterLoading());
    var data = await useCaseLogin.usecaselogin(
      email: email,
      password: password,
    );
    data.fold((success) {
      log(success.toString());
      emit(LoginSuccess(message: success.toString()));
    }, (error) {
      log(error.message.toString());
      emit(LoginError(registerModeal: error));
    });
  }
}
