import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
    final int? status;
    final String? message;
    final int? totalPost;
    final Data? data;

    UserResponse({
        this.status,
        this.message,
        this.totalPost,
        this.data,
    });

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        status: json["status"],
        message: json["message"],
        totalPost: json["total_post"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "total_post": totalPost,
        "data": data?.toJson(),
    };
}

class Data {
    final int? id;
    final String? imageUrl;
    final String? uuid;
    final String? email;
    final String? name;
    final dynamic bio;
    final int? point;
    final int? likesCount;
    final int? postsCount;
    final List<Comment>? comments;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Data({
        this.id,
        this.imageUrl,
        this.uuid,
        this.email,
        this.name,
        this.bio,
        this.point,
        this.likesCount,
        this.postsCount,
        this.comments,
        this.createdAt,
        this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        imageUrl: json["image_url"],
        uuid: json["uuid"],
        email: json["email"],
        name: json["name"],
        bio: json["bio"],
        point: json["point"],
        postsCount: json["posts_count"],
        likesCount: json["likes_count"],
        comments: json["comments"] == null ? [] : List<Comment>.from(json["comments"]!.map((x) => Comment.fromJson(x))),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
        "uuid": uuid,
        "email": email,
        "name": name,
        "bio": bio,
        "point": point,
        "likes_count": likesCount,
        "posts_count": postsCount,
        "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x.toJson())),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Comment {
    final int? id;
    final int? postId;
    final String? name;
    final String? text;
    final DateTime? createdAt;

    Comment({
        this.id,
        this.postId,
        this.name,
        this.text,
        this.createdAt,
    });

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        postId: json["post_id"],
        name: json["name"],
        text: json["text"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "post_id": postId,
        "name": name,
        "text": text,
        "created_at": createdAt?.toIso8601String(),
    };
}