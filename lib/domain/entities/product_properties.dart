import 'package:equatable/equatable.dart';

class Attribute extends Equatable {
  const Attribute({
    this.id,
    this.name,
    this.position,
    this.visible,
    this.variation,
    this.options,
  });

  final int? id;
  final String? name;
  final int? position;
  final bool? visible;
  final bool? variation;
  final List<String>? options;

  @override
  List<Object?> get props => [
        id,
        name,
        position,
        visible,
        variation,
        options,
      ];
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
  });

  final int? id;
  final String? name;
  final String? slug;
}

class DefaultAttribute {
  DefaultAttribute({
    this.id,
    this.name,
    this.option,
  });

  final int? id;
  final String? name;
  final String? option;
}

class Dimensions {
  Dimensions({
    this.length,
    this.width,
    this.height,
  });

  final String? length;
  final String? width;
  final String? height;
}

class ImageProduct {
  ImageProduct({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
  });

  final int? id;
  final DateTime? dateCreated;
  final DateTime? dateCreatedGmt;
  final DateTime? dateModified;
  final DateTime? dateModifiedGmt;
  final String? src;
  final String? name;
  final String? alt;
}

class Links {
  Links({
    this.self,
    this.collection,
  });

  final List<Collection>? self;
  final List<Collection>? collection;
}

class Collection {
  Collection({
    this.href,
  });

  final String? href;
}

class MetaData {
  MetaData({
    this.id,
    this.key,
    this.value,
  });

  final int? id;
  final String? key;
  final String? value;
}
