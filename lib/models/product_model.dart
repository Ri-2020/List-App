import 'dart:ffi';

class ProductModel {
  String? addedOn;
  int? moq;
  String? type;
  int? increaseQuantity;
  String? name;
  int? productNo;
  String? prodGroupId;
  int? mrp;
  String? quickProductCheck;
  int? txnQuantity;
  int? txnQuantity2;
  List<Rate>? rate;
  List<Rate>? notForSell;
  String? slug;
  String? slug2;
  Gallery? gallery;

  int? ratings;

  ProductModel(
      {this.addedOn,
      this.moq,
      this.type,
      this.increaseQuantity,
      this.name,
      this.productNo,
      this.prodGroupId,
      this.mrp,
      this.quickProductCheck,
      this.txnQuantity,
      this.txnQuantity2,
      this.rate,
      this.notForSell,
      this.slug,
      this.slug2,
      this.gallery,
      this.ratings});

  ProductModel.fromJson(Map<String, dynamic> json) {
    addedOn = json['added_on'];
    moq = json['moq'];
    type = json['type'];
    increaseQuantity = json['increase_quantity'];
    name = json['name'];
    productNo = json['product_no'];
    prodGroupId = json['prod_group_id'];
    mrp = json['mrp'];
    quickProductCheck = json['quick_product_check'];
    txnQuantity = json['txn_quantity'];
    txnQuantity2 = json['txn_quantity2'];
    if (json['rate'] != null) {
      rate = List.generate(0, (index) => Rate());
      json['rate'].forEach((v) {
        rate?.add(Rate.fromJson(v));
      });
    }
    if (json['not_for_sell'] != null) {
      notForSell = List.generate(0, (index) => Rate());
      json['not_for_sell'].forEach((v) {
        notForSell?.add(Rate.fromJson(v));
      });
    }
    slug = json['slug'];
    slug2 = json['slug2'];
    gallery =
        json['gallery'] != null ? Gallery.fromJson(json['gallery']) : null;
    ratings = json['ratings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['added_on'] = addedOn;
    data['moq'] = moq;
    data['type'] = type;
    data['increase_quantity'] = increaseQuantity;
    data['name'] = name;
    data['product_no'] = productNo;
    data['prod_group_id'] = prodGroupId;
    data['mrp'] = mrp;
    data['quick_product_check'] = quickProductCheck;
    data['txn_quantity'] = txnQuantity;
    data['txn_quantity2'] = txnQuantity2;
    if (rate != null) {
      data['rate'] = rate?.map((v) => v.toJson()).toList();
    }
    if (notForSell != null) {
      data['not_for_sell'] = notForSell?.map((v) => v.toJson()).toList();
    }
    data['slug'] = slug;
    data['slug2'] = slug2;
    if (gallery != null) {
      data['gallery'] = gallery?.toJson();
    }
    data['ratings'] = ratings;
    return data;
  }
}

class Rate {
  int? id;
  int? productNo;
  int? rateType;
  int? rate;
  double? discountPercent;
  int? addBy;
  String? addOn;
  String? isMember;
  String? isActive;
  int? companyNum;
  String? name;
  int? isRent;

  Rate(
      {this.id,
      this.productNo,
      this.rateType,
      this.rate,
      this.discountPercent,
      this.addBy,
      this.addOn,
      this.isMember,
      this.isActive,
      this.companyNum,
      this.name,
      this.isRent});

  Rate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productNo = json['product_no'];
    rateType = json['rate_type'];
    rate = json['rate'];
    discountPercent = json['discount_percent'];
    addBy = json['add_by'];
    addOn = json['add_on'];
    isMember = json['is_member'];
    isActive = json['is_active'];
    companyNum = json['company_num'];
    name = json['name'];
    isRent = json['is_rent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_no'] = productNo;
    data['rate_type'] = rateType;
    data['rate'] = rate;
    data['discount_percent'] = discountPercent;
    data['add_by'] = addBy;
    data['add_on'] = addOn;
    data['is_member'] = isMember;
    data['is_active'] = isActive;
    data['company_num'] = companyNum;
    data['name'] = name;
    data['is_rent'] = isRent;
    return data;
  }
}

class Gallery {
  String? smallThumbnailLink;
  String? mediumThumbnailLink;

  Gallery({
    this.smallThumbnailLink,
    this.mediumThumbnailLink,
  });

  Gallery.fromJson(Map<String, dynamic> json) {
    smallThumbnailLink = json['small_thumbnail_link'];
    mediumThumbnailLink = json['medium_thumbnail_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['small_thumbnail_link'] = smallThumbnailLink;
    data['medium_thumbnail_link'] = mediumThumbnailLink;
    return data;
  }
}
