import 'package:brewery/model/brewery_item_model.dart';
import 'package:flutter/material.dart';

import '../network/network.dart';

class BreweryViewModel extends ChangeNotifier
{
  ApiResponse<List<BreweryItem>> _apiResponse = ApiResponse.initial('Empty data');
  List<BreweryItem> _items = [];
  List<BreweryItem> get items => _items;

  getItems() async
  {
    _apiResponse = ApiResponse.loading('Fetching data');
    try {
      //code to get items
        var api = ApiProvider();
        dynamic list = await api.get(url: "${ApiEndpoints.apiBaseUrl}${ApiEndpoints.breweries}") ;
        dynamic data = list.data;
        data.map((e)
        {
          _items.add(BreweryItem.fromJson(e));
        }).toList();
        _apiResponse = ApiResponse.completed(_items);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      debugPrint(e.toString());
    }
    notifyListeners();
  }
}