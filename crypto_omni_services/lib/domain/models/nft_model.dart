import 'dart:convert';

class NftListModel {
  List<NftModel>? nfts;
  NftListModel({
    this.nfts,
  });

  factory NftListModel.fromJson(String data) => NftListModel.fromMap(
        jsonDecode(data) as Map<String, dynamic>,
      );

  factory NftListModel.fromMap(Map<String, dynamic> map) => NftListModel(
        nfts: (map['nfts'] as List<dynamic>)
            .map(
              (nft) => NftModel.fromMap(
                nft as Map<String, dynamic>,
              ),
            )
            .toList(),
      );
}

class NftModel {
  String? imageUrl;
  dynamic createdAt;
  String? description;

  NftModel({
    this.createdAt,
    this.description,
    this.imageUrl,
  });

  factory NftModel.fromMap(Map<String, dynamic> map) => NftModel(
        createdAt: map['created_at'],
        description: map['description'],
        imageUrl: map['image_url'],
      );

  factory NftModel.fromJson(String data) => NftModel.fromMap(
        jsonDecode(data) as Map<String, dynamic>,
      );
}
