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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Refresh Demo'),
      ),
      body: Center(
        child:
            //Image.network('$_imageUrl+#+$_imageVersion')
            CachedNetworkImage(
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                imageUrl: '$_imageUrl+#+$_imageVersion'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshImage,
        child: const Icon(
          Icons.update,
          color: Colors.white,
        ),
      ),
    );
  }
}
