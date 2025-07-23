import 'dart:convert';

PostsResponse postsResponseFromJson(String str) => PostsResponse.fromJson(json.decode(str));

String postsResponseToJson(PostsResponse data) => json.encode(data.toJson());

class PostsResponse {
    final int? status;
    final String? message;
    final int? totalItem;
    final List<DatumPost>? data;

    PostsResponse({
        this.status,
        this.message,
        this.totalItem,
        this.data,
    });

    factory PostsResponse.fromJson(Map<String, dynamic> json) => PostsResponse(
        status: json["status"],
        message: json["message"],
        totalItem: json["total_item"],
        data: json["data"] == null ? [] : List<DatumPost>.from(json["data"]!.map((x) => DatumPost.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "total_item": totalItem,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class DatumPost {
    final int? id;
    final User? user;
    final String? caption;
    final int? totalDuration;
    final String? deviceUsage;
    final List<App>? apps;
    final int? likesCount;
    final int? commentsCount;
    final bool? isLike;
    final DateTime? createdAt;

    DatumPost({
        this.id,
        this.user,
        this.caption,
        this.totalDuration,
        this.deviceUsage,
        this.apps,
        this.likesCount,
        this.commentsCount,
        this.isLike,
        this.createdAt,
    });

    factory DatumPost.fromJson(Map<String, dynamic> json) => DatumPost(
        id: json["id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        caption: json["caption"],
        totalDuration: json["total_duration"],
        deviceUsage: json["device_usage"],
        apps: json["apps"] == null ? [] : List<App>.from(json["apps"]!.map((x) => App.fromJson(x))),
        likesCount: json["likes_count"],
        commentsCount: json["comments_count"],
        isLike: json["is_like"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "caption": caption,
        "total_duration": totalDuration,
        "device_usage": deviceUsage,
        "apps": apps == null ? [] : List<dynamic>.from(apps!.map((x) => x.toJson())),
        "likes_count": likesCount,
        "comments_count": commentsCount,
        "is_like": isLike,
        "created_at": createdAt?.toIso8601String(),
    };
}

class App {
    final String? name;
    final int? duration;

    App({
        this.name,
        this.duration,
    });

    factory App.fromJson(Map<String, dynamic> json) => App(
        name: json["name"],
        duration: json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "duration": duration,
    };
}

class User {
    final int? id;
    final String? imageUrl;
    final String? uuid;
    final String? email;
    final String? name;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    User({
        this.id,
        this.imageUrl,
        this.uuid,
        this.email,
        this.name,
        this.createdAt,
        this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        imageUrl: json["image_url"],
        uuid: json["uuid"],
        email: json["email"],
        name: json["name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
        "uuid": uuid,
        "email": email,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
