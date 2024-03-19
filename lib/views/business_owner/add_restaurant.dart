import 'package:flutter/material.dart';
import 'package:food_panda/data/response/status.dart';
import 'package:food_panda/views/business_owner/models/request/restaurant_request.dart';
import 'package:food_panda/views/business_owner/models/restaurant_viewmodel/restaurant_viewmodel.dart';
import 'package:food_panda/views/home/models/restaurant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'viewmodels/image_viewmodel.dart';

class AddRestaurant extends StatefulWidget {
  AddRestaurant({this.isFromUpdate, this.restaurant});

  bool? isFromUpdate;
  Datum? restaurant;

  @override
  State<AddRestaurant> createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {
  bool isPicked = false;
  var imageFile;
  final _imageViewModel = ImageViewModel();
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final discountController = TextEditingController();
  final deliveryFeeController = TextEditingController();
  final deliveryTimeController = TextEditingController();
  final _restaurantViewModel = RestaurantViewmodel();
  var imageId;
  var restaurantId;

  @override
  void initState() {
    super.initState();
    checkIfFromUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.pink,
        title: const Text('Add Restaurant'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Icon button (Gallery , Camera)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      _getImageFromGallery();
                    },
                    icon: const Icon(
                      Icons.image,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _getImageFromSource(source: "camera");
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 40,
                    ),
                  ),
                ],
              ),

              //Picture box
              Align(
                alignment: Alignment.center,
                child: ChangeNotifierProvider(
                  create: (context) => _imageViewModel,
                  child: Consumer<ImageViewModel>(
                    builder: (context, viewModel, _) {
                      if(widget.isFromUpdate!){
                        return Image.network(
                          'https://cms.istad.co${widget.restaurant!.attributes!.picture!.data!.attributes!.url!}',
                          fit: BoxFit.contain,
                        );
                      }
                      if (viewModel.response.status == null) {
                        return Image.network(
                          'https://www.shutterstock.com/image-vector/user-profile-icon-vector-avatar-600nw-2220431045.jpg',
                          fit: BoxFit.contain,
                        );
                      }
                      switch (viewModel.response.status!) {
                        case Status.LOADING:
                          return const Center(
                              child: CircularProgressIndicator());
                        case Status.COMPLETED:
                          imageId = viewModel.response.data[0].id;
                          return SizedBox(
                            width: 350,
                            height: 250,
                            child: Image.network(
                                'https://cms.istad.co${viewModel.response.data[0].url!}'),
                          );
                        case Status.ERROR:
                          return Text(viewModel.response.message!);
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),

              //Name, category, discount, delivery_fee, delivery_time
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(
                  hintText: 'category',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: discountController,
                decoration: const InputDecoration(
                  hintText: 'discount',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: deliveryFeeController,
                decoration: const InputDecoration(
                  hintText: 'deliveryFee',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: deliveryTimeController,
                decoration: const InputDecoration(
                  hintText: 'deliveryTime',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ChangeNotifierProvider(
                create: (context) => _restaurantViewModel,
                child: Consumer<RestaurantViewmodel>(
                  builder: (context, viewModel, _){
                    if (viewModel.response.status == null) {
                      return ElevatedButton(
                        onPressed: () {
                          _saveRestaurant();
                        },
                        child: widget.isFromUpdate! ? Text('Update') : Text('Save'),
                      );
                    }
                    switch(viewModel.response.status!){
                      case Status.LOADING:
                        return Center(child: CircularProgressIndicator());
                      case Status.COMPLETED:
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Save Success'))
                          );
                        });
                        return ElevatedButton(
                          onPressed: () {
                            _saveRestaurant();
                          },
                          child: const Text('Save'),
                        );
                      case Status.ERROR:
                        return Text(viewModel.response.message!);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getImageFromSource({source}) async {
    XFile? pickedFile = await ImagePicker().pickImage(
        source: source == "gallery" ? ImageSource.gallery : ImageSource.camera);
    if (pickedFile != null) {
      // uploading image to server
      _imageViewModel.uploadImage(pickedFile.path);

      // setState(() {
      //   isPicked = true;
      //   imageFile = File(pickedFile.path);
      // });
    }
  }

  _getImageFromGallery() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // uploading image to server
      _imageViewModel.uploadImage(pickedFile.path);
    }
  }

  void _saveRestaurant() {
    var restaurantRequest = RestaurantRequest(
      data: DataRequest(
        name: nameController.text,
        category: categoryController.text,
        discount: int.parse(discountController.text),
        deliveryFee: double.parse(deliveryFeeController.text),
        deliveryTime: int.parse(deliveryTimeController.text),
        picture: imageId.toString()
      )
    );
    _restaurantViewModel.postRestaurant(restaurantRequest, isUpdate: widget.isFromUpdate, id: restaurantId);
  }

  void checkIfFromUpdate(){
    if(widget.isFromUpdate!){
      nameController.text = widget.restaurant!.attributes!.name!;
      categoryController.text = widget.restaurant!.attributes!.category!;
      discountController.text = widget.restaurant!.attributes!.discount!.toString();
      deliveryFeeController.text = widget.restaurant!.attributes!.deliveryFee!.toString();
      deliveryTimeController.text = widget.restaurant!.attributes!.deliveryTime!.toString();
      imageId = widget.restaurant!.attributes!.picture!.data!.id;
      restaurantId = widget.restaurant!.id;
    }
  }
}
