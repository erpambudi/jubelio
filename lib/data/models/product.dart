import 'package:jubelio/data/models/product_cache.dart';
import 'package:jubelio/domain/entities/product.dart';
import 'product_properties.dart';

class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.slug,
    this.permalink,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.type,
    this.status,
    this.featured,
    this.catalogVisibility,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
    this.onSale,
    this.purchasable,
    this.totalSales,
    this.virtual,
    this.downloadable,
    this.downloads,
    this.downloadLimit,
    this.downloadExpiry,
    this.externalUrl,
    this.buttonText,
    this.taxStatus,
    this.taxClass,
    this.manageStock,
    this.stockQuantity,
    this.backorders,
    this.backordersAllowed,
    this.backordered,
    this.lowStockAmount,
    this.soldIndividually,
    this.weight,
    this.dimensions,
    this.shipping,
    this.shippingTaxable,
    this.shippingClass,
    this.shippingClassId,
    this.reviewsAllowed,
    this.averageRating,
    this.ratingCount,
    this.upsellIds,
    this.crossSellIds,
    this.parentId,
    this.purchaseNote,
    this.categories,
    this.tags,
    this.images,
    this.attributes,
    this.defaultAttributes,
    this.variations,
    this.groupedProducts,
    this.menuOrder,
    this.priceHtml,
    this.relatedIds,
    this.metaData,
    this.stockStatus,
    this.hasOptions,
    this.links,
  });

  int? id;
  String? name;
  String? slug;
  String? permalink;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  String? type;
  String? status;
  bool? featured;
  String? catalogVisibility;
  String? description;
  String? shortDescription;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleFromGmt;
  dynamic dateOnSaleTo;
  dynamic dateOnSaleToGmt;
  bool? onSale;
  bool? purchasable;
  int? totalSales;
  bool? virtual;
  bool? downloadable;
  List<dynamic>? downloads;
  int? downloadLimit;
  int? downloadExpiry;
  String? externalUrl;
  String? buttonText;
  String? taxStatus;
  String? taxClass;
  bool? manageStock;
  dynamic stockQuantity;
  String? backorders;
  bool? backordersAllowed;
  bool? backordered;
  dynamic lowStockAmount;
  bool? soldIndividually;
  String? weight;
  DimensionsModel? dimensions;
  bool? shipping;
  bool? shippingTaxable;
  String? shippingClass;
  int? shippingClassId;
  bool? reviewsAllowed;
  String? averageRating;
  int? ratingCount;
  List<dynamic>? upsellIds;
  List<dynamic>? crossSellIds;
  int? parentId;
  String? purchaseNote;
  List<CategoryModel>? categories;
  List<dynamic>? tags;
  List<ImageModel>? images;
  List<AttributeModel>? attributes;
  List<DefaultAttributeModel>? defaultAttributes;
  List<int>? variations;
  List<dynamic>? groupedProducts;
  int? menuOrder;
  String? priceHtml;
  List<int>? relatedIds;
  List<MetaDataModel>? metaData;
  String? stockStatus;
  bool? hasOptions;
  LinksModel? links;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        permalink: json["permalink"],
        dateCreated: json["date_created"] != null
            ? DateTime.parse(json["date_created"])
            : null,
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        type: json["type"],
        status: json["status"],
        featured: json["featured"],
        catalogVisibility: json["catalog_visibility"],
        description: json["description"],
        shortDescription: json["short_description"],
        sku: json["sku"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        dateOnSaleFrom: json["date_on_sale_from"],
        dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
        dateOnSaleTo: json["date_on_sale_to"],
        dateOnSaleToGmt: json["date_on_sale_to_gmt"],
        onSale: json["on_sale"],
        purchasable: json["purchasable"],
        totalSales: json["total_sales"],
        virtual: json["virtual"],
        downloadable: json["downloadable"],
        downloads: List<dynamic>.from(json["downloads"].map((x) => x)),
        downloadLimit: json["download_limit"],
        downloadExpiry: json["download_expiry"],
        externalUrl: json["external_url"],
        buttonText: json["button_text"],
        taxStatus: json["tax_status"],
        taxClass: json["tax_class"],
        manageStock: json["manage_stock"],
        stockQuantity: json["stock_quantity"],
        backorders: json["backorders"],
        backordersAllowed: json["backorders_allowed"],
        backordered: json["backordered"],
        lowStockAmount: json["low_stock_amount"],
        soldIndividually: json["sold_individually"],
        weight: json["weight"],
        dimensions: DimensionsModel.fromJson(json["dimensions"]),
        shipping: json["shipping_"],
        shippingTaxable: json["shipping_taxable"],
        shippingClass: json["shipping_class"],
        shippingClassId: json["shipping_class_id"],
        reviewsAllowed: json["reviews_allowed"],
        averageRating: json["average_rating"],
        ratingCount: json["rating_count"],
        upsellIds: List<dynamic>.from(json["upsell_ids"].map((x) => x)),
        crossSellIds: List<dynamic>.from(json["cross_sell_ids"].map((x) => x)),
        parentId: json["parent_id"],
        purchaseNote: json["purchase_note"],
        categories: List<CategoryModel>.from(
            json["categories"].map((x) => CategoryModel.fromJson(x))),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        images: List<ImageModel>.from(
            json["images"].map((x) => ImageModel.fromJson(x))),
        attributes: List<AttributeModel>.from(
            json["attributes"].map((x) => AttributeModel.fromJson(x))),
        defaultAttributes: List<DefaultAttributeModel>.from(
            json["default_attributes"]
                .map((x) => DefaultAttributeModel.fromJson(x))),
        variations: List<int>.from(json["variations"].map((x) => x)),
        groupedProducts:
            List<dynamic>.from(json["grouped_products"].map((x) => x)),
        menuOrder: json["menu_order"],
        priceHtml: json["price_html"],
        relatedIds: List<int>.from(json["related_ids"].map((x) => x)),
        metaData: List<MetaDataModel>.from(
            json["meta_data"].map((x) => MetaDataModel.fromJson(x))),
        stockStatus: json["stock_status"],
        hasOptions: json["has_options"],
        links: LinksModel.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "permalink": permalink,
        "date_created": dateCreated?.toIso8601String(),
        "date_created_gmt": dateCreatedGmt?.toIso8601String(),
        "date_modified": dateModified?.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
        "type": type,
        "status": status,
        "featured": featured,
        "catalog_visibility": catalogVisibility,
        "description": description,
        "short_description": shortDescription,
        "sku": sku,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "date_on_sale_from": dateOnSaleFrom,
        "date_on_sale_from_gmt": dateOnSaleFromGmt,
        "date_on_sale_to": dateOnSaleTo,
        "date_on_sale_to_gmt": dateOnSaleToGmt,
        "on_sale": onSale,
        "purchasable": purchasable,
        "total_sales": totalSales,
        "virtual": virtual,
        "downloadable": downloadable,
        "downloads": downloads != null
            ? List<dynamic>.from(downloads!.map((x) => x))
            : null,
        "download_limit": downloadLimit,
        "download_expiry": downloadExpiry,
        "external_url": externalUrl,
        "button_text": buttonText,
        "tax_status": taxStatus,
        "tax_class": taxClass,
        "manage_stock": manageStock,
        "stock_quantity": stockQuantity,
        "backorders": backorders,
        "backorders_allowed": backordersAllowed,
        "backordered": backordered,
        "low_stock_amount": lowStockAmount,
        "sold_individually": soldIndividually,
        "weight": weight,
        "dimensions": dimensions != null ? dimensions!.toJson() : null,
        "shipping_": shipping,
        "shipping_taxable": shippingTaxable,
        "shipping_class": shippingClass,
        "shipping_class_id": shippingClassId,
        "reviews_allowed": reviewsAllowed,
        "average_rating": averageRating,
        "rating_count": ratingCount,
        "upsell_ids": upsellIds != null
            ? List<dynamic>.from(upsellIds!.map((x) => x))
            : null,
        "cross_sell_ids": crossSellIds != null
            ? List<dynamic>.from(crossSellIds!.map((x) => x))
            : null,
        "parent_id": parentId,
        "purchase_note": purchaseNote,
        "categories": categories != null
            ? List<dynamic>.from(categories!.map((x) => x.toJson()))
            : null,
        "tags": tags != null ? List<dynamic>.from(tags!.map((x) => x)) : null,
        "images": images != null
            ? List<dynamic>.from(images!.map((x) => x.toJson()))
            : null,
        "attributes": attributes != null
            ? List<dynamic>.from(attributes!.map((x) => x.toJson()))
            : null,
        "default_attributes": defaultAttributes != null
            ? List<dynamic>.from(defaultAttributes!.map((x) => x.toJson()))
            : null,
        "variations": variations != null
            ? List<dynamic>.from(variations!.map((x) => x))
            : null,
        "grouped_products": groupedProducts != null
            ? List<dynamic>.from(groupedProducts!.map((x) => x))
            : null,
        "menu_order": menuOrder,
        "price_html": priceHtml,
        "related_ids": relatedIds != null
            ? List<dynamic>.from(relatedIds!.map((x) => x))
            : null,
        "meta_data": metaData != null
            ? List<dynamic>.from(metaData!.map((x) => x.toJson()))
            : null,
        "stock_status": stockStatus,
        "has_options": hasOptions,
        "_links": links != null ? links!.toJson() : null,
      };

  ProductCacheModel toProductCache() => ProductCacheModel(
        id: id ?? 0,
        name: name ?? "",
        price: price ?? "0.0",
        image: images != null && images!.isNotEmpty ? images!.first.src! : '',
      );

  Product toEntity() {
    return Product(
      id: id,
      name: name,
      slug: slug,
      permalink: permalink,
      dateCreated: dateCreated,
      dateCreatedGmt: dateCreatedGmt,
      dateModified: dateModified,
      dateModifiedGmt: dateModifiedGmt,
      type: type,
      status: status,
      featured: featured,
      catalogVisibility: catalogVisibility,
      description: description,
      shortDescription: shortDescription,
      sku: sku,
      price: price,
      regularPrice: regularPrice,
      salePrice: salePrice,
      dateOnSaleFrom: dateOnSaleFrom,
      dateOnSaleFromGmt: dateOnSaleFromGmt,
      dateOnSaleTo: dateOnSaleTo,
      dateOnSaleToGmt: dateOnSaleToGmt,
      onSale: onSale,
      purchasable: purchasable,
      totalSales: totalSales,
      virtual: virtual,
      downloadable: downloadable,
      downloads: downloads,
      downloadLimit: downloadLimit,
      downloadExpiry: downloadExpiry,
      externalUrl: externalUrl,
      buttonText: buttonText,
      taxStatus: taxStatus,
      taxClass: taxClass,
      manageStock: manageStock,
      stockQuantity: stockQuantity,
      backorders: backorders,
      backordersAllowed: backordersAllowed,
      backordered: backordered,
      lowStockAmount: lowStockAmount,
      soldIndividually: soldIndividually,
      weight: weight,
      dimensions: dimensions != null ? dimensions!.toEntity() : null,
      shipping: shipping,
      shippingTaxable: shippingTaxable,
      shippingClass: shippingClass,
      shippingClassId: shippingClassId,
      reviewsAllowed: reviewsAllowed,
      averageRating: averageRating,
      ratingCount: ratingCount,
      upsellIds: upsellIds,
      crossSellIds: crossSellIds,
      parentId: parentId,
      purchaseNote: purchaseNote,
      categories: categories!.map((e) => e.toEntity()).toList(),
      tags: tags,
      images: images!.map((e) => e.toEntity()).toList(),
      attributes: attributes!.map((e) => e.toEntity()).toList(),
      defaultAttributes: defaultAttributes!.map((e) => e.toEntity()).toList(),
      variations: variations,
      groupedProducts: groupedProducts,
      menuOrder: menuOrder,
      priceHtml: priceHtml,
      relatedIds: relatedIds,
      metaData: metaData!.map((e) => e.toEntity()).toList(),
      stockStatus: stockStatus,
      hasOptions: hasOptions,
      links: links!.toEntity(),
    );
  }
}
