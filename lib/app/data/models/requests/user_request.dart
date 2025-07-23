import 'dart:convert';

String userRequestToJson(UserRequest data) => json.encode(data.toJson());

class UserRequest {
  final String? uuid;
  final String? name;
  final String? bio;
  final String? imageUrl;

  UserRequest({
      this.uuid,
      this.name,
      this.bio,
      this.imageUrl,
  });

  Map<String, dynamic> toJson() => {
      "uuid": uuid,
      "name": name,
      "bio": bio,
      "image_url": imageUrl,
  };
}
