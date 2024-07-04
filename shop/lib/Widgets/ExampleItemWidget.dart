import 'package:flutter/material.dart';
import '../Models/ExampleItem.dart';


class ExampleItemWidget extends StatefulWidget{
  final ExampleItem item;

  ExampleItemWidget({
    super.key,
    required this.item
  });

  @override
  _ExampleItemWidgetState createState() => _ExampleItemWidgetState();
}


class _ExampleItemWidgetState extends State<ExampleItemWidget>{
  int _count = 0;

  void _increment() {
    if (_count < 10) setState(() { _count++; });
  }

  void _decrement() {
    if (_count > 0) setState(() { _count--; });
  }

  bool _isImageUrl(String url) {
    return url.startsWith('http');
  }

  @override
  Widget build(BuildContext context){
    return Container(
      width: 179,
      height: 240,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: _isImageUrl(widget.item.img_url)
                    ? Image.network(
                  widget.item.img_url,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.contain,
                )
                    : Image.asset(
                  widget.item.img_url,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            const SizedBox(height: 8),
            Text(
                widget.item.name,
                style: const TextStyle(
                  fontSize: 19,
                  fontStyle: FontStyle.italic,
            )),
            const SizedBox(height: 8),
            _count == 0
                ? ElevatedButton(
              onPressed: _increment,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                minimumSize: const Size(110, 35),
              ),
              child: Text(
                '${widget.item.price} руб',
                style: const TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                ),
              ),
            )
                : Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        minimumSize: const Size(30, 30),
                      ),
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      onPressed: _decrement,
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '  ${_count}  ',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
                    IconButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        minimumSize: const Size(30, 30),
                      ),
                      icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                      ),
                      onPressed: _increment,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
