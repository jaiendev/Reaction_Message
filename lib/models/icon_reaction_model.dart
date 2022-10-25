// Dart imports:
import 'dart:convert';

class IconReactionModel {
  final int id;
  final String iconAsset;
  final int page;
  IconReactionModel(
      {required this.id, required this.iconAsset, required this.page});

  IconReactionModel copyWith({int? id, String? iconAsset, int? page}) {
    return IconReactionModel(
      id: id ?? this.id,
      iconAsset: iconAsset ?? this.iconAsset,
      page: page ?? this.page,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'iconAsset': iconAsset,
      'page': page,
    };
  }

  factory IconReactionModel.fromMap(Map<String, dynamic> map) {
    return IconReactionModel(
        id: map['id']?.toInt() ?? 0,
        iconAsset: map['iconAsset'] ?? '',
        page: map['page'] ?? 0);
  }

  String toJson() => json.encode(toMap());

  factory IconReactionModel.fromJson(String source) =>
      IconReactionModel.fromMap(json.decode(source));

  @override
  String toString() => 'IconReactionModel(id: $id, iconAsset: $iconAsset)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IconReactionModel &&
        other.id == id &&
        other.iconAsset == iconAsset;
  }

  @override
  int get hashCode => id.hashCode ^ iconAsset.hashCode;
}

List<IconReactionModel> listFake0 = [
  IconReactionModel(id: 1, page: 0, iconAsset: 'assets/images/like.png'),
  IconReactionModel(id: 2, page: 0, iconAsset: 'assets/images/heart.png'),
  IconReactionModel(id: 3, page: 0, iconAsset: 'assets/images/surprise1.png'),
  IconReactionModel(id: 4, page: 0, iconAsset: 'assets/images/surprise2.png'),
  IconReactionModel(id: 5, page: 0, iconAsset: 'assets/images/angry.png'),
  IconReactionModel(id: 6, page: 0, iconAsset: 'assets/images/crying.png'),
];

List<IconReactionModel> listFake1 = [
  IconReactionModel(id: 1, page: 1, iconAsset: 'assets/images/smile1.png'),
  IconReactionModel(id: 2, page: 1, iconAsset: 'assets/images/smile2.png'),
  IconReactionModel(id: 3, page: 1, iconAsset: 'assets/images/smile3.png'),
  IconReactionModel(id: 4, page: 1, iconAsset: 'assets/images/smile4.png'),
  IconReactionModel(id: 5, page: 1, iconAsset: 'assets/images/smile5.png'),
  IconReactionModel(id: 6, page: 1, iconAsset: 'assets/images/smile6.png'),
];

List<IconReactionModel> listFake2 = [
  IconReactionModel(id: 1, page: 2, iconAsset: 'assets/images/sad1.png'),
  IconReactionModel(id: 2, page: 2, iconAsset: 'assets/images/sad2.png'),
  IconReactionModel(id: 3, page: 2, iconAsset: 'assets/images/sad3.png'),
  IconReactionModel(id: 4, page: 2, iconAsset: 'assets/images/sad4.png'),
  IconReactionModel(id: 5, page: 2, iconAsset: 'assets/images/sad5.png'),
  IconReactionModel(id: 6, page: 2, iconAsset: 'assets/images/sad6.png'),
];
