import 'package:equatable/equatable.dart';

import 'product_properties.dart';

class Product extends Equatable {
  const Product({
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

  final int? id;
  final String? name;
  final String? slug;
  final String? permalink;
  final DateTime? dateCreated;
  final DateTime? dateCreatedGmt;
  final DateTime? dateModified;
  final DateTime? dateModifiedGmt;
  final String? type;
  final String? status;
  final bool? featured;
  final String? catalogVisibility;
  final String? description;
  final String? shortDescription;
  final String? sku;
  final String? price;
  final String? regularPrice;
  final String? salePrice;
  final dynamic dateOnSaleFrom;
  final dynamic dateOnSaleFromGmt;
  final dynamic dateOnSaleTo;
  final dynamic dateOnSaleToGmt;
  final bool? onSale;
  final bool? purchasable;
  final int? totalSales;
  final bool? virtual;
  final bool? downloadable;
  final List<dynamic>? downloads;
  final int? downloadLimit;
  final int? downloadExpiry;
  final String? externalUrl;
  final String? buttonText;
  final String? taxStatus;
  final String? taxClass;
  final bool? manageStock;
  final dynamic stockQuantity;
  final String? backorders;
  final bool? backordersAllowed;
  final bool? backordered;
  final dynamic lowStockAmount;
  final bool? soldIndividually;
  final String? weight;
  final Dimensions? dimensions;
  final bool? shipping;
  final bool? shippingTaxable;
  final String? shippingClass;
  final int? shippingClassId;
  final bool? reviewsAllowed;
  final String? averageRating;
  final int? ratingCount;
  final List<dynamic>? upsellIds;
  final List<dynamic>? crossSellIds;
  final int? parentId;
  final String? purchaseNote;
  final List<Category>? categories;
  final List<dynamic>? tags;
  final List<ImageProduct>? images;
  final List<Attribute>? attributes;
  final List<DefaultAttribute>? defaultAttributes;
  final List<int>? variations;
  final List<dynamic>? groupedProducts;
  final int? menuOrder;
  final String? priceHtml;
  final List<int>? relatedIds;
  final List<MetaData>? metaData;
  final String? stockStatus;
  final bool? hasOptions;
  final Links? links;

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        permalink,
        dateCreated,
        dateCreatedGmt,
        dateModified,
        dateModifiedGmt,
        type,
        status,
        featured,
        catalogVisibility,
        description,
        shortDescription,
        sku,
        price,
        regularPrice,
        salePrice,
        dateOnSaleFrom,
        dateOnSaleFromGmt,
        dateOnSaleTo,
        dateOnSaleToGmt,
        onSale,
        purchasable,
        totalSales,
        virtual,
        downloadable,
        downloads,
        downloadLimit,
        downloadExpiry,
        externalUrl,
        buttonText,
        taxStatus,
        taxClass,
        manageStock,
        stockQuantity,
        backorders,
        backordersAllowed,
        backordered,
        lowStockAmount,
        soldIndividually,
        weight,
        dimensions,
        shipping,
        shippingTaxable,
        shippingClass,
        shippingClassId,
        reviewsAllowed,
        averageRating,
        ratingCount,
        upsellIds,
        crossSellIds,
        parentId,
        purchaseNote,
        categories,
        tags,
        images,
        attributes,
        defaultAttributes,
        variations,
        groupedProducts,
        menuOrder,
        priceHtml,
        relatedIds,
        metaData,
        stockStatus,
        hasOptions,
        links,
      ];
}
