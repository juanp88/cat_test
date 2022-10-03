import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final String _imageUrl = 'https://cataas.com/cat/gif';

  int _imageVersion = 1;

  Future<void> _refreshImage() async {
    //update the URl and the image
    _imageVersion++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final deviceRatio = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Refresh Demo'),
      ),
      body: Card(
        elevation: deviceRatio * 10,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ListTile(
                leading: Image.asset('assets/images/cat-anime.png'),
                title: const Center(child: Text('Get your cat')),
              ),

              const SizedBox(
                height: 20,
              ),
              //Image.network('$_imageUrl+#+$_imageVersion')
              SizedBox(
                width: deviceRatio * 200,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: CachedNetworkImage(
                      placeholder: (context, url) => SizedBox(
                          width: deviceRatio * 50,
                          child:
                              const Center(child: CircularProgressIndicator())),
                      imageUrl: '$_imageUrl+#+$_imageVersion'),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(16.0),
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: _refreshImage,
        child: const Text('Meow'),
      ),
    );
  }
}
