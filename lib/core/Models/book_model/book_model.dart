import 'package:bookly_app/core/entities/book_entity.dart';

import 'access_info.dart';
import 'sale_info.dart';
import 'volume_info.dart';

class BookModel extends BookEntity {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo? volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;

  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
  }) : super(
         bookId: id ?? '',
         image: volumeInfo?.imageLinks?.thumbnail ?? '',
         title: volumeInfo?.title ?? 'Untitled',
         authorName:
             (volumeInfo?.authors != null && volumeInfo!.authors!.isNotEmpty)
                 ? volumeInfo.authors!.first
                 : 'Unknown',
         price: 0.0,
         rating: null,
       );

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    kind: json['kind'] as String?,
    id: json['id'] as String?,
    etag: json['etag'] as String?,
    selfLink: json['selfLink'] as String?,
    volumeInfo:
        json['volumeInfo'] != null
            ? VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>)
            : null,
    saleInfo:
        json['saleInfo'] != null
            ? SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>)
            : null,
    accessInfo:
        json['accessInfo'] != null
            ? AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>)
            : null,
  );

  Map<String, dynamic> toJson() => {
    'kind': kind,
    'id': id,
    'etag': etag,
    'selfLink': selfLink,
    'volumeInfo': volumeInfo?.toJson(),
    'saleInfo': saleInfo?.toJson(),
    'accessInfo': accessInfo?.toJson(),
  };
}
