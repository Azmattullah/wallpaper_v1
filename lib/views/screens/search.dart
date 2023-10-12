import 'package:flutter/material.dart';
import 'package:wallpaper01/controller/apiOper.dart';
import 'package:wallpaper01/model/photosModel.dart';
import 'package:wallpaper01/views/screens/fullScreen.dart';
import 'package:wallpaper01/views/widgets/customAppBar.dart';
import 'package:wallpaper01/views/widgets/searchBar2.dart';

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  String query;
  SearchScreen({super.key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<PhotosModel> searchResults = [];

  GetSearchResult() async {
    searchResults = await ApiOperations.searchWallpapers(widget.query);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    GetSearchResult();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: CustomAppBar(
          word1: 'Wallpaper',
          word2: 'App',
        ),
        iconTheme: IconThemeData(
          color: Colors.orangeAccent, // Change the color to your desired color
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: SearchBar2()),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 350,
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 10),
                itemCount: searchResults.length,
                itemBuilder: (context, index) => GridTile(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FullScreen(imgUrl: searchResults[index].imgSrc),
                        ),
                      );
                    },
                    child: Hero(
                      tag: searchResults[index].imgSrc,
                      child: Container(
                        height: 800,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                              fit: BoxFit.cover, searchResults[index].imgSrc),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
