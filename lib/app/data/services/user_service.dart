import 'dart:convert';
import 'package:dangos/app/data/data_export.dart';
import 'package:dangos/common/helpers/storage_helper.dart';
import 'package:dangos/core/constants/api.dart';
import 'package:dangos/core/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;

class UserService {
  final dioClient = DioClient();
  final storageHelper = StorageHelper();

  Future<DefaultResponse> createUser(UserRequest request) async {
    try {
      final uuid = await storageHelper.getStorage('uuid');
      final formData = FormData.fromMap({
        "uuid": uuid,
        "name": request.name,
      });
      final response = await dioClient.post(
        "/create-user",
        options: Options(headers: headersFormDataNoToken),
        data: formData,
      );

      return defaultResponseFromJson(jsonEncode(response.data));
    } on DioException catch (e) {
      await storageHelper.removeStorage('uuid');
      if (e.response != null && e.response?.data != null) {
        return defaultResponseFromJson(jsonEncode(e.response?.data));
      }
      return DefaultResponse(
        status: 500,
        message: e.message ?? "Something went wrong",
      );
    }
  }

  Future<UserResponse> fetchProfile() async {
    try {
      final uuid = await storageHelper.getStorage('uuid');
      final response = await dioClient.get(
        "/fetch-user?uuid=$uuid",
        options: Options(headers: headersNoToken),
      );

      return userResponseFromJson(jsonEncode(response.data));
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return userResponseFromJson(jsonEncode(e.response?.data));
      }
      return UserResponse(
        status: 500,
        message: e.message ?? "Something went wrong",
      );
    }
  }

  Future<DefaultResponse> updateProfile(UserRequest request) async {
    try {
      final uuid = await storageHelper.getStorage('uuid');

      final formData = FormData.fromMap({
        "uuid": uuid,
        "name": request.name,
        "bio": request.bio,
        if (request.imageUrl?.isNotEmpty ?? false) 
          "image_url": await MultipartFile.fromFile(request.imageUrl ?? "", filename: path.basename(request.imageUrl ?? "")),
      });
      final response = await dioClient.put(
        "/update-user",
        options: Options(headers: headersFormDataNoToken),
        data: formData,
      );

      return defaultResponseFromJson(jsonEncode(response.data));
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return defaultResponseFromJson(jsonEncode(e.response?.data));
      }
      return DefaultResponse(
        status: 500,
        message: e.message ?? "Something went wrong",
      );
    }
  }
}
