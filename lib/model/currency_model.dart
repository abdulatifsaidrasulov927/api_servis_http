class CurrencyModel {
  //   "title": "Swiss Franc",
  //   "code": "CHF",
  //   "cb_price": "13611.18",
  //   "nbu_buy_price": "12900.00",
  //   "nbu_cell_price": "14100.00",
  //   "date": "10/20/2023 11:00:01 am"
  // },
//   {
//     "next": null,
//     "prev": null,
//     "count": 2,
//     "results": [
  //         {
//             "id": "528b2300-387a-4186-91b2-ed20679c6e29",
//             "user": {
//                 "id": "5a46ee4b-583b-4be8-aca6-bec63419d4a2",
//                 "username": "user",
//                 "photo": null
//             },
//             "pic": "http://5a46-84-54-71-84.ngrok-free.app/media/job_photos/bmc.PNG",
//             "description": "python developer need for create a django site",
//             "name": "python developer need",
//             "created_time": "2023-11-05T15:02:00.945622+05:00",
//             "job_type": "work_need",
//             "post_comments_count": 0,
//             "post_likes_count": 1,
//             "me_liked": false
  //         },

  //         {
//             "id": "db7d280b-7c16-4d64-a1fb-4fd8a03ce03b",
//             "user": {
//                 "id": "5a46ee4b-583b-4be8-aca6-bec63419d4a2",
//                 "username": "user",
//                 "photo": null
//             },
//             "pic": "http://5a46-84-54-71-84.ngrok-free.app/media/job_photos/bmc_xfoNdJR.PNG",
//             "description": "python developer need for create a django site",
//             "name": "python developer need",
//             "created_time": "2023-11-05T15:04:00.234886+05:00",
//             "job_type": "worker_need",
//             "post_comments_count": 3,
//             "post_likes_count": 0,
//             "me_liked": false
  //         }

//     ]
// }
  final String id;
  final UseModel user;
  final String pic;
  final String description;
  final String name;
  final String created_time;
  final String job_type;
  final int post_comments_count;
  final bool me_liked;
  final int post_likes_count;

  CurrencyModel({
    required this.pic,
    required this.user,
    required this.created_time,
    required this.description,
    required this.name,
    required this.id,
    required this.job_type,
    required this.post_comments_count,
    required this.post_likes_count,
    required this.me_liked,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      pic: json['pic'] as String? ?? "",
      user: UseModel.fromJson(json['user']),
      created_time: json['created_time'] as String? ?? "",
      description: json['description'] as String? ?? "",
      name: json['name'] as String? ?? "",
      id: json['id'] as String? ?? "",
      job_type: json['job_type'] as String? ?? "",
      post_comments_count: json['post_comments_count'] as int? ?? 0,
      post_likes_count: json['post_likes_count'] as int? ?? 0,
      me_liked: json['me_liked'] as bool? ?? false,
    );
  }
}

class UseModel {
  final String id;
  final String username;
  final String photo;

  UseModel({
    required this.id,
    required this.username,
    required this.photo,
  });

  factory UseModel.fromJson(Map<String, dynamic> json) {
    return UseModel(
      id: json['id'] ?? "",
      username: json['username'] ?? "",
      photo: json['photo'] ?? "",
      // times: TimesModel.fromJson(json['times']),
    );
  }
}

class WeatherMainModel {
  final List<CurrencyModel> weatherModel;
  final String? prev;

  final String? next;
  final int count;

  WeatherMainModel({
    required this.next,
    required this.count,
    required this.prev,
    required this.weatherModel,
  });

  factory WeatherMainModel.fromJson(Map<String, dynamic> json) {
    return WeatherMainModel(
      next: json["next"],
      count: json["count"],
      prev: json["prev"],
      weatherModel: (json["results"] as List?)
              ?.map((e) => CurrencyModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}
