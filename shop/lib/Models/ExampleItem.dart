
class ExampleItem{
  final String name;
  final String img_url;
  final int price;

  ExampleItem({
    required this.name,
    required this.img_url,
    required this.price,
  });

  @override
  List<Object> get props => [
    name,
    img_url,
    price,
  ];
}
