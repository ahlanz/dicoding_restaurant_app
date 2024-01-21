import 'package:dicoding_restaurant_app/theme/theme.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search-page';
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget searchBar() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
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
                  onChanged: (query) {},
                  decoration: InputDecoration(
                      hintText: 'search....', border: InputBorder.none),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
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
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
