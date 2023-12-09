//
// class Meals {
//   final String strMeal;
//   final String strMealThumb;
//   final double idMeal;
//
//   Meals({
//     required this.strMeal,
//     required this.strMealThumb,
//     required this.idMeal,
//   });
//
//   factory Meals.fromJson(dynamic json) {
//     return Meals(
//       strMeal: json['strMeal'] as String? ?? 'No Name',
//       strMealThumb: json['strMealThumb'] != null && json['strMealThumb'].isNotEmpty
//           ? json['strMealThumb'][0]['hostedLargeUrl'] as String? ?? 'No Image'
//           : 'No Image',
//       idMeal: (json['idMeal'] as int?)?.toDouble() ?? 0,
//     );
//   }
//
//   static List<Meals> recipesFromSnapshot(List snapshot) {
//     return snapshot.map(
//           (data) {
//         return Meals.fromJson(data);
//       },
//     ).toList();
//   }
// }
// //
// // class Meals {
// //   int? code;
// //   String? message;
// //   List<Data>? data;
// //
// //   Meals({
// //     this.code,
// //     this.message,
// //     this.data,
// //   });
// //
// //   Meals.fromJson(Map<String, dynamic> json) {
// //     code = json['code'] as int?;
// //     message = json['message'] as String?;
// //     data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> json = <String, dynamic>{};
// //     json['code'] = code;
// //     json['message'] = message;
// //     json['data'] = data?.map((e) => e.toJson()).toList();
// //     return json;
// //   }
// // }
// //
// // class Data {
// //   String? strMeal;
// //   String? strMealThumb;
// //   String? key;
// //
// //   Data({
// //     this.strMeal,
// //     this.strMealThumb,
// //     this.key,
// //   });
// //
// //   Data.fromJson(Map<String, dynamic> json) {
// //     strMeal = json['strMeal'] as String?;
// //     heroid = json['strMealThumb'] as String?;
// //     key = json['key'] as String?;
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> json = <String, dynamic>{};
// //     json['strMeal'] = strMeal;
// //     json['heroid'] = heroid;
// //     json['key'] = key;
// //     return json;
// //   }
// // }

class ListMeal {
  List<Meals>? meals;

  ListMeal({this.meals});

  ListMeal.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = <Meals>[];
      json['meals'].forEach((v) {
        meals!.add(new Meals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meals != null) {
      data['meals'] = this.meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meals {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  Meals({this.strMeal, this.strMealThumb, this.idMeal});

  Meals.fromJson(Map<String, dynamic> json) {
    strMeal = json['strMeal'];
    strMealThumb = json['strMealThumb'];
    idMeal = json['idMeal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strMeal'] = this.strMeal;
    data['strMealThumb'] = this.strMealThumb;
    data['idMeal'] = this.idMeal;
    return data;
  }
}