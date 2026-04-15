import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
    String? id;
    String title;
    String description;
    DateTime? createdAt;

    Task({
        this.id,
        required this.title,
        required this.description,
        this.createdAt,
    });

    factory Task.fromRawJson(String str) => Task.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdAt: json["createdAt"] == null ? null : (json["createdAt"] as Timestamp).toDate(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "createdAt": createdAt != null ? Timestamp.fromDate(createdAt!) : null,
    };
}
