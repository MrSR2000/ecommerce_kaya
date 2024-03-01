// import 'package:flutter/material.dart';

// import '../search_product_page/search_product_page.dart';

// class Search extends SearchDelegate {
//   @override
//   TextStyle? get searchFieldStyle => TextStyle(
//         fontSize: 17,
//         color: Colors.grey[700],
//         fontFamily: 'Poppins',
//       );

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: const Icon(
//           Icons.close,
//           size: 19,
//         ),
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(
//         Icons.arrow_back_ios,
//         size: 18,
//       ),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     Widget _sortingType({required title, required icon}) {
//       return TextButton.icon(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => SearchProductPage(query: query),
//             ),
//           );
//         },
//         icon: Icon(icon),
//         label: Text(title),
//       );
//     }

//     return SingleChildScrollView(child: SearchProductPage(query: query));
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return const Center(
//       child: Text('Search for Products'),
//     );
//   }

//   void onChanged(String query) {
//     // Handle changes in the search query
//     print('Search query changed: $query');
//     // You can perform additional logic here, such as filtering suggestions
//   }
// }

//   // Widget buildSearchField(BuildContext context) {
//   //   return TextField(
//   //     style: const TextStyle(fontSize: 13.0), // Set the desired text size here
//   //     decoration: const InputDecoration(
//   //       hintText: 'Search...',
//   //     ),
//   //     onChanged: (value) {
//   //       log("debounce here ");
//   //       _debouncer.run(() {
//   //         Navigator.push(
//   //           context,
//   //           MaterialPageRoute(
//   //             builder: (context) => SearchProductPage(query: value),
//   //           ),
//   //         );
//   //       });
//   //     },
//   //   );
//   // }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaya/bloc/product/bloc/product_bloc.dart';
import 'package:kaya/core/resources/components/gaps.dart';
import 'package:kaya/core/resources/components/text_widget.dart';
import 'package:kaya/core/resources/debouncer.dart';
import 'package:kaya/core/resources/screen_size.dart';
import 'package:kaya/features/products/pages/home_page/widgets/products_grid_widget.dart';

import '../../../../injection_container.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;
  late Debouncer _debouncer;
  late ProductBloc _searchProductBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 25,
            color: Colors.black,
          ),
        ),
        title: Row(
          children: [
            SizedBox(
              width: getDeviceSize(context: context).deviceWidth / 1.6,
              child: TextField(
                controller: _searchController,
                autofocus: true,
                style: mediumTextStyle,
                decoration: const InputDecoration(
                  hintText: 'Search ...',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onChanged: (text) {
                  if (text.isNotEmpty) {
                    log("called from onchanged");
                    _debouncer.run(() {
                      _searchProductBloc.add(SearchProductsEvent(
                        searchQuery: text,
                        newQuery: true,
                      ));
                    });
                  }
                },
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  log("called from onsubmit");

                  if (value.isNotEmpty) {
                    _searchProductBloc.add(
                      SearchProductsEvent(
                        searchQuery: value,
                        newQuery: true,
                      ),
                    );
                  }
                },
              ),
            ),
            gap10,
            IconButton(
              onPressed: () {
                _searchController.clear();
              },
              icon: const Icon(
                Icons.close,
                size: 18,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => _searchProductBloc,
        child: ProductsGrid(
          reCallApi: () {
            _searchProductBloc
                .add(SearchProductsEvent(searchQuery: _searchController.text));
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _debouncer = Debouncer(milliseconds: 800);
    _searchProductBloc = sl<ProductBloc>();
  }
}
