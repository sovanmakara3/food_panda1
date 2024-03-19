import 'package:flutter/cupertino.dart';
import 'package:food_panda/views/home/repository/restaurant_repo.dart';

import '../../../data/response/api_response.dart';

class RestaurantViewModel extends ChangeNotifier {
  final _restaurantRepo = RestaurantRepository();
  var response = ApiResponse.loading();
  var deleteResponse = ApiResponse();

  setRestaurantList(response) {
    this.response = response;
    notifyListeners();
  }
  setDeleteResponse(response) {
    deleteResponse = response;
    notifyListeners();
  }

  Future<dynamic> deleteRestaurant(id) async{
    await _restaurantRepo.deleteRestaurant(id)
        .then((data) => setDeleteResponse(ApiResponse.completed(data)))
        .onError((error, stackTrace) => setDeleteResponse(ApiResponse.error(stackTrace.toString())));
  }

  Future<dynamic> getAllRestaurant() async {
    await _restaurantRepo
        .getAllRestaurants()
        .then((restaurant) => setRestaurantList(ApiResponse.completed(restaurant)))
        .onError((error, stackTrace) => setRestaurantList(ApiResponse.error(stackTrace.toString())));
  }
}
