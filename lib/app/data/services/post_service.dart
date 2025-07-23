import 'dart:convert';
import 'package:dangos/app/data/data_export.dart';
import 'package:dangos/common/helpers/storage_helper.dart';
import 'package:dangos/core/constants/api.dart';
import 'package:dangos/core/network/dio_client.dart';
import 'package:dio/dio.dart';

class PostService {
  final dioClient = DioClient();
  final storageHelper = StorageHelper();

  Future<PostsResponse> fetchPosts() async {
    try {
      final uuid = await storageHelper.getStorage('uuid');
      final response = await dioClient.get(
        "/fetch-posts?uuid=$uuid",
        options: Options(headers: headersNoToken),
      );

      return postsResponseFromJson(jsonEncode(response.data));
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return postsResponseFromJson(jsonEncode(e.response?.data));
      }
      return PostsResponse(
        status: 500,
        message: e.message ?? "Something went wrong",
      );
    }
  }

  Future<DefaultResponse> toggleLike(int id) async {
    try {
      final uuid = await storageHelper.getStorage('uuid');
      final response = await dioClient.post(
        "/like",
        options: Options(headers: headersNoToken),
        data: {
          "uuid": uuid,
          "post_id": id
        },
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
