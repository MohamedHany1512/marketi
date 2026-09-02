import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/routing/app_routes.dart';

import '../view_model/products_cubit.dart';
import '../view_model/products_states.dart';
import 'widgets/brand_item_widget.dart';
import 'widgets/category_item_widget.dart';
import 'widgets/home_section_header_widget.dart';
import 'widgets/product_card_widget.dart';
import 'widgets/search_field_widget.dart';
import 'widgets/special_deal_banner_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().fetchHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            const SizedBox(width: 8),
            const Text(
              'Hi Youssef !',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.blue),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state.paginationErrorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.paginationErrorMessage!)),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorMessage!),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<ProductsCubit>().fetchHomeData(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchFieldWidget(),
                const SizedBox(height: 16),
                const SpecialDealBannerWidget(),
                const SizedBox(height: 20),
                HomeSectionHeaderWidget(
                  title: 'Popular Product',
                  onViewAllPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.products,
                      arguments: {
                        'title': 'Popular Products',
                        'products': state.products,
                      },
                    );
                  },
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.take(1).length,
                    itemBuilder: (context, index) => SizedBox(
                      width: 160,
                      child: ProductCardWidget(product: state.products[index]),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                HomeSectionHeaderWidget(
                  title: 'Category',
                  onViewAllPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.categories,
                      arguments: state.categories,
                    );
                  },
                ),
                const SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: state.categories.take(6).length,
                  itemBuilder: (context, index) =>
                      CategoryItemWidget(category: state.categories[index]),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 12),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.take(2).length,
                    itemBuilder: (context, index) => SizedBox(
                      width: 160,
                      child: ProductCardWidget(product: state.products[index]),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                HomeSectionHeaderWidget(
                  title: 'Brands',
                  onViewAllPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.brands,
                      arguments: state.brands,
                    );
                  },
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.brands.take(3).length,
                    itemBuilder: (context, index) =>
                        BrandItemWidget(brand: state.brands[index]),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 12),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.take(2).length,
                    itemBuilder: (context, index) => SizedBox(
                      width: 160,
                      child: ProductCardWidget(product: state.products[index]),
                    ),
                  ),
                ),
                if (state.isLoadingMore)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(child: CircularProgressIndicator()),
                  ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
      ),
    );
  }
}
