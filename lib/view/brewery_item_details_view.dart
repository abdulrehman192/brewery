import 'package:brewery/model/brewery_item_model.dart';
import 'package:brewery/utils/colors.dart';
import 'package:flutter/material.dart';

class BreweryItemDetailsView extends StatelessWidget {
  final BreweryItem item;
  const BreweryItemDetailsView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text("Brewery Details"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          width: double.maxFinite,
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Id : ${item.id}", style: const TextStyle(color: AppColors.primaryColor, fontSize: 18, fontWeight: FontWeight.bold),),
                  Text("Name : ${item.name}", style: const TextStyle(color: AppColors.primaryColor, fontSize: 18, fontWeight: FontWeight.bold),),
                  Text("Phone : ${item.phone}", style: const TextStyle(color: AppColors.primaryColor, fontSize: 18, fontWeight: FontWeight.bold),),
                  Text("Type : ${item.breweryType}", style: const TextStyle(color: AppColors.primaryColor, fontSize: 18, fontWeight: FontWeight.bold),),
                  Text("Web Url : ${item.websiteUrl}", style: const TextStyle(color: AppColors.primaryColor, fontSize: 18, fontWeight: FontWeight.bold),),
                  Text("City : ${item.city}", style: const TextStyle(color: AppColors.primaryColor, fontSize: 18, fontWeight: FontWeight.bold),),
                  Text("State : ${item.state}", style: const TextStyle(color: AppColors.primaryColor, fontSize: 18, fontWeight: FontWeight.bold),),
                  Text("Country : ${item.country}", style: const TextStyle(color: AppColors.primaryColor, fontSize: 18, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
