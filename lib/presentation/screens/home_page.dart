import 'package:flutter/material.dart';
import 'package:pixabay_app/presentation/providers/pixabay_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final photos = Provider.of<PixabayProvider>(context);
    final searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pixabay"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Buscar imágenes",
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                photos.getImages(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: photos.pixabayList.length,
              itemBuilder: (context, index) {
                final res = photos.pixabayList[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      width: 170,
                      height: 250,
                      placeholder: const AssetImage('assets/loading.gif'),
                      image: NetworkImage(
                        res.largeImageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
