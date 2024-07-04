import 'package:flutter/material.dart';
import '../Widgets/ExampleItemWidget.dart';
import '../Models/ExampleItem.dart';
import '../data/ItemList.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  ScrollController _horizontalScrollController = ScrollController();

  String second_category = category_item[0];
  List<String> categories = category_item;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _horizontalScrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _horizontalScrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      int index = (_scrollController.offset / 444).floor();
      if (index != -1 && index < categories.length) {
        second_category = categories[index];
        double screenWidth = MediaQuery.of(context).size.width;
        double categoryWidth = categories.length * 210;

        double scrollTo = index * 120 - (screenWidth - 120) / 2;
        scrollTo = scrollTo.clamp(0, categoryWidth - screenWidth);

        if (index == categories.length - 1) {
          scrollTo = categoryWidth - screenWidth;
        }

        _horizontalScrollController.animateTo(
          scrollTo,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _selectCategory(String category) {
    setState(() { second_category = category; });

    int index = categories.indexOf(category);
    if (index != -1) _scrollController.jumpTo(index * 450);
  }

  Widget _categoryList(String title, List<Widget> items) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Wrap(
            spacing: 4,
            runSpacing: 2,
            children: items,
          ),
        ],
      ),
    );
  }

  Widget _categoryButton(String category) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () {
          _selectCategory(category);
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: second_category == category ? Colors.lightBlue : Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Text(
              category,
              style: TextStyle(
                color: second_category == category ? Colors.white : Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _horizontalScrollController,
            child: Row(
              children: categories.map((category) => _categoryButton(category)).toList(),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _categoryList(category_item[0], [
                      const SizedBox(height: 5,),
                      Row(
                            children: [
                              ExampleItemWidget(item: ExampleItem(name: "Эспрессо", price: 79, img_url: 'https://avatars.mds.yandex.net/i?id=78af32e3c7419510dd74dc04b8b9704aa7ecb4b3-9856853-images-thumbs&n=13'),),
                              ExampleItemWidget(item: ExampleItem(name: "Американо", price: 49, img_url: 'https://avatars.mds.yandex.net/i?id=03ac23499db6afb7532d376aabfe3f48c167b7c9-5707839-images-thumbs&n=13'),),
                            ],
                          ),
                      Row(
                            children: [
                              ExampleItemWidget(item: ExampleItem(name: "Ристретто", price: 119, img_url: "assets/images/default_coffee.jpg")),
                            ],
                          ),
                      const SizedBox(height: 5,),
                    ],),
                    _categoryList(category_item[1], [
                      const SizedBox(height: 5,),
                      Row(
                          children: [
                            ExampleItemWidget(item: ExampleItem(name: "Латте", price: 99, img_url: 'https://avatars.mds.yandex.net/i?id=98f3c59b4eafd5c39b00b3b2b488f62790b0abb2-4340501-images-thumbs&n=13'),),
                            ExampleItemWidget(item: ExampleItem(name: "Капучино", price: 89, img_url: 'https://static.tildacdn.com/tild6339-6339-4262-b637-323665363166/3_.jpg'),),
                          ],
                        ),
                      const SizedBox(height: 5,),
                    ],),
                    _categoryList(category_item[2], [
                      const SizedBox(height: 5,),
                      Row(
                          children: [
                            ExampleItemWidget(item: ExampleItem(name: "Черный чай", price: 29, img_url: 'https://sun9-52.userapi.com/N9bey1a9rXWTJNjH-VC6hnOLMTpGku3z2JBKPA/HdNWfFa_3Zc.jpg'),),
                            ExampleItemWidget(item: ExampleItem(name: "Зеленый чай", price: 29, img_url: 'https://avatars.dzeninfra.ru/get-zen_doc/1922981/pub_64c0f8187864de744bce1de8_64c0f983c146cc22fbd38a00/scale_1200'),),
                          ],
                        ),
                      Row(
                            children: [
                              ExampleItemWidget(item: ExampleItem(name: "Белый чай", price: 69, img_url: "https://statik.tempo.co/data/2018/04/24/id_700634/700634_720.jpg")),
                              ExampleItemWidget(item: ExampleItem(name: "Красный чай", price: 39, img_url: "https://avatars.mds.yandex.net/get-sprav-products/9896919/2a0000018cf8c836a8aa95cb1d466f2413eb/XXL")),
                            ],
                          ),
                      Row(
                          children: [
                            ExampleItemWidget(item: ExampleItem(name: "Чай улун", price: 69, img_url: "https://ratetea.com/images/u/a84119f72611ed8a27c3e971ccf7cddb-1280.jpg")),
                          ],
                        ),
                      const SizedBox(height: 5,),
                    ],),
                    _categoryList(category_item[3], [
                      const SizedBox(height: 5,),
                      Row(
                          children: [
                            ExampleItemWidget(item: ExampleItem(name: "Кофе 'Capybara'", price: 14, img_url: 'https://prorisuem.ru/foto/2694/kapibara_risunok_cherno_belyi_20.webp'),),
                            ExampleItemWidget(item: ExampleItem(name: "Чай 'Manulik'", price: 1099, img_url: 'https://abrakadabra.fun/uploads/posts/2021-12/1639944698_1-abrakadabra-fun-p-chai-na-prozrachnom-fone-1.jpg'),),
                          ],
                        ),
                      Row(
                            children: [
                              ExampleItemWidget(item: ExampleItem(name: "сон ишака", price: 189, img_url: "https://i.postimg.cc/vmKW70PT/Untitled-2022-09-27-T110229-682.png")),
                              ExampleItemWidget(item: ExampleItem(name: "Кротовуха", price: 200, img_url: "https://i.pinimg.com/originals/bc/8d/b0/bc8db0a99c65f3c9c43b44130f7edc8a.png")),
                            ],
                          ),
                      const SizedBox(height: 5,),
                    ],),
                    _categoryList(category_item[4], [
                      const SizedBox(height: 5,),
                      Row(
                          children: [
                            ExampleItemWidget(item: ExampleItem(name: "мин. вода", price: 19, img_url: 'https://media.leverans.ru/product_images_inactive/tiumen/gruzinskii-dvorik/big_168.jpg'),),
                            ExampleItemWidget(item: ExampleItem(name: "Лимонад", price: 79, img_url: 'https://bonfit.ru/upload/iblock/0b7/0b7a452f2e94acd83159041bc694fc32.jpg'),),
                          ],
                        ),
                      Row(
                          children: [
                            ExampleItemWidget(item: ExampleItem(name: "Тархун", price: 39, img_url: 'assets/images/default_coffee.jpg'),),
                            ExampleItemWidget(item: ExampleItem(name: "Мохито", price: 49, img_url: 'https://static.tildacdn.com/tild6164-6334-4161-a363-626534656432/image.png'),),
                          ],
                        ),
                      Row(
                          children: [
                            ExampleItemWidget(item: ExampleItem(name: "Кола", price: 49, img_url: 'https://ecolife.posthemes.com/demo4/fastfood2/319-large_default/melon-blenheim-orange.jpg'),),
                          ],
                        ),
                      const SizedBox(height: 5,),
                    ],),
                  ]),
            ),
          )],
      ),
    );
  }
}
