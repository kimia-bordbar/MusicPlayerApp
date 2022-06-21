import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/api/rest_client.dart';
import 'package:music_player/models/category_base_model.dart';
import 'package:music_player/view/item_category_gridview.dart';
import 'package:music_player/view/item_gridview.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<CategoryBaseModel> getCategories;
  @override
  void initState() {
    super.initState();
    final dio = Dio();
    var client = RestClient(dio);
    getCategories = client.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 8.0),
        child: FutureBuilder<CategoryBaseModel>(
            future: getCategories,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.70,
                  ),
                  itemCount: snapshot.data!.ONLINE_MP3.length,
                  primary: false,
                  itemBuilder: (context, index) {
                    return ItemCategoryGridView(
                      image: snapshot.data!.ONLINE_MP3[index].category_image,
                      catTitle: snapshot.data!.ONLINE_MP3[index].category_name,
                      catId: snapshot.data!.ONLINE_MP3[index].cid,
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return const Text(
                    'از اتصال دستگاه خود به اینترنت اطمینان حاصل شوید.');
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
