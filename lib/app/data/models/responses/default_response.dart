import 'dart:convert';

DefaultResponse defaultResponseFromJson(String str) => DefaultResponse.fromJson(json.decode(str));

String defaultResponseToJson(DefaultResponse data) => json.encode(data.toJson());

class DefaultResponse {
    final int? status;
    final String? message;
    final int? totalItem;

    DefaultResponse({
        this.status,
        this.message,
        this.totalItem,
    });

    factory DefaultResponse.fromJson(Map<String, dynamic> json) => DefaultResponse(
        status: json["status"],
        message: json["message"],
        totalItem: json["total_item"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "total_item": totalItem,
    };
}
