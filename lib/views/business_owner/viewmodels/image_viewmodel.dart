import 'package:flutter/material.dart';
import 'package:food_panda/data/response/api_response.dart';

import '../repository/image_repo.dart';

class ImageViewModel extends ChangeNotifier{
  final _imageRepo = ImageRepository();
  ApiResponse<dynamic> response = ApiResponse();

  setImageData(response){
    this.response = response;
    notifyListeners();
  }


  Future<dynamic> uploadImage(image) async{
    setImageData(ApiResponse.loading());
    await _imageRepo.uploadImage(image)
        .then((imageList) => setImageData(ApiResponse.completed(imageList)))
        .onError((error, stackTrace) => setImageData(ApiResponse.error(stackTrace.toString())));
  }
}