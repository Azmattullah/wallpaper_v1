// import 'package:flutter/material.dart';
// import 'package:wallpaper01/controller/apiOper.dart';
// import 'package:wallpaper01/model/categoryModel.dart';
// import 'package:wallpaper01/model/photosModel.dart';
// import 'package:wallpaper01/views/screens/fullScreen.dart';
// import 'package:wallpaper01/views/widgets/catBlock.dart';
// import 'package:wallpaper01/views/widgets/customAppBar.dart';
// import 'package:wallpaper01/views/widgets/searchBar2.dart';

// class HomeScreen extends StatefulWidget {
//   HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late List<PhotosModel> trendingWallList = [];
//   late List<CategoryModel> CatModList = [];
//   bool isLoading = true;

//   GetCatDetails() async {
//     CatModList = await ApiOperations.getCategoriesList();
//     print("Getting CAT MOD LIST");
//     print(CatModList);
//     setState(() {
//       CatModList = CatModList;
//     });
//   }

//   GetTrendingWallpapers() async {
//     trendingWallList = await ApiOperations.getTrendingWallpapers();
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     GetCatDetails();
//     GetTrendingWallpapers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('Build...');
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0.0,
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         title: CustomAppBar(
//           word1: 'Wallpaper',
//           word2: 'App',
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 child: SearchBar2()),
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 20),
//               child: SizedBox(
//                 height: 50,
//                 width: MediaQuery.of(context).size.width,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: CatModList.length,
//                   itemBuilder: (context, index) => CatBlock(
//                     categoryImgSrc: CatModList[index].catImgUrl,
//                     categoryName: CatModList[index].categoryName,
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 10),
//               height: 700,
//               child: RefreshIndicator(
//                 onRefresh: () async {
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (context) => HomeScreen()));
//                 },
//                 child: GridView.builder(
//                   physics: BouncingScrollPhysics(),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       mainAxisExtent: 350,
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 12,
//                       mainAxisSpacing: 10),
//                   itemCount: trendingWallList.length,
//                   itemBuilder: (context, index) => GridTile(
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => FullScreen(
//                                     imgUrl: trendingWallList[index].imgSrc)));
//                       },
//                       child: Hero(
//                         tag: trendingWallList[index].imgSrc,
//                         child: Container(
//                           height: 800,
//                           width: 50,
//                           decoration: BoxDecoration(
//                               color: Colors.grey.shade300,
//                               borderRadius: BorderRadius.circular(20)),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: Image.network(
//                                 height: 800,
//                                 width: 50,
//                                 fit: BoxFit.cover,
//                                 trendingWallList[index].imgSrc),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
