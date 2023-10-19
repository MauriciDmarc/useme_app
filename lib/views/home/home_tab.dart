import 'package:flutter/material.dart';
import 'package:useme_app/config/custom_colors.dart';
import 'package:useme_app/views/components/category_tile.dart';
import 'package:useme_app/config/app_data.dart' as app_data;
import 'package:useme_app/views/components/item_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectCategory = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customContrastColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.customContrastColor,
        title: Center(
          child: Image.asset(
            'image/logo_name.png',
            height: 250,
            width: 250,
          ),
        ),
      ),
      body: Column(
        children: [
          //Campo de Pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Pesquise Aqui...",
                  hintStyle: const TextStyle(color: Colors.grey),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none))),
            ),
          ),
          //Categorias
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SizedBox(
              height: 40,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return CategoryTile(
                      onPress: () {
                        setState(() {
                          selectCategory = app_data.listcategories[index];
                        });
                      },
                      category: app_data.listcategories[index],
                      isSelected:
                          app_data.listcategories[index] == selectCategory,
                    );
                  },
                  separatorBuilder: (_, index) => const SizedBox(width: 10),
                  itemCount: app_data.listcategories.length),
            ),
          ),
          //Grid
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(8),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 9 / 12),
                itemCount: app_data.items.length,
                itemBuilder: (_, index) {
                  return ItemTile(
                    itemModel: app_data.items[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}
