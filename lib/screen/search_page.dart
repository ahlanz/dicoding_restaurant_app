import 'package:dicoding_restaurant_app/model/produk_model.dart';
import 'package:dicoding_restaurant_app/provider/search_provider.dart';
import 'package:dicoding_restaurant_app/theme/theme.dart';
import 'package:dicoding_restaurant_app/widget/list_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search-page';
  SearchPage({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context);
    Future<void> _refreshData() async {
      await Future.delayed(const Duration(seconds: 2));
      if (_searchController.text == '') {
        searchProvider.searchRestaurant(_searchController.text);
      } else {
        searchProvider.searchRestaurant('');
      }
    }

    String localSearchQuery = '';
    Widget searchBar() {
      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: primaryTextColor,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 3,
                  left: 20,
                ),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.2),
                    borderRadius: BorderRadius.circular(12)),
                child: TextFormField(
                  controller: _searchController,
                  onChanged: (query) {
                    localSearchQuery = query;
                    if (query.isEmpty) {
                      context.read<SearchProvider>().searchRestaurant('');
                    } else {
                      context
                          .read<SearchProvider>()
                          .searchRestaurant(localSearchQuery);
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'search....',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () async {
                        String restaurantName = _searchController.text;
                        await context
                            .read<SearchProvider>()
                            .searchRestaurant(restaurantName);
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(top: 30),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                expandedHeight: 60,
                collapsedHeight: 60,
                backgroundColor: Colors.white,
                elevation: 0,
                flexibleSpace: searchBar(),
              ),
              const SliverToBoxAdapter(
                child: Divider(
                  thickness: 1,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Consumer<SearchProvider>(
                        builder: (context, searchProvider, _) {
                      Future.delayed(const Duration(seconds: 4));
                      if (context.watch<SearchProvider>().hasilSearch.isEmpty) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Item yang kamu cari tidak dapat ditemukan',
                                  textAlign: TextAlign.center,
                                  style: primaryTextStyle.copyWith(
                                    color: Colors.grey.shade400,
                                    fontSize: 20,
                                    fontWeight: semiBold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else if (searchProvider.isLoading) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (searchProvider.isError) {
                        return Center(
                          child: Text(
                            'Error internet tidak ada',
                            style: primaryTextStyle.copyWith(
                              fontSize: 30,
                            ),
                          ),
                        );
                      } else {
                        ProdukModel restaurant =
                            Provider.of<SearchProvider>(context)
                                .hasilSearch[index];
                        print('hasil search restaurant : $restaurant');
                        return ListCardRestaurant(restaurant: restaurant);
                      }
                    });
                  },
                  childCount:
                      context.watch<SearchProvider>().hasilSearch.isNotEmpty
                          ? context.watch<SearchProvider>().hasilSearch.length
                          : 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
