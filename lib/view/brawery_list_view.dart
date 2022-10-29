import 'package:brewery/utils/colors.dart';
import 'package:brewery/utils/common.dart';
import 'package:brewery/view/brewery_item_details_view.dart';
import 'package:brewery/viewModel/brewery_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreweryListView extends StatelessWidget {
   BreweryListView({Key? key}) : super(key: key);
  final _viewModel = BreweryViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brewery List"),
        backgroundColor: AppColors.primaryColor,
      ),
      body:
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Consumer<BreweryViewModel>(
          builder: (_, data, __){
            data.getItems();
            return data.items.isEmpty ? const Center(child: CircularProgressIndicator(),) :
              ListView.builder(
                itemCount: data.items.length,
                itemBuilder: (context, index)
                    {
                      return Card(
                        elevation: 8,
                        child: ListTile(
                          title: Text(data.items[index].name.toString()),
                          subtitle: Text(data.items[index].phone.toString()),
                          onTap: (){
                            Common.openScreen(context: context, screen:  BreweryItemDetailsView(item: data.items[index]));
                          },
                        ),
                      );
                    }
            );
          },
        ),
      )
    );
  }
}
