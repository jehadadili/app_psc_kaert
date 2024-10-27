import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';
import 'package:market/src/feature/search/cubit/cubit.dart';
import 'package:market/src/feature/search/view/widgets/custom_search_product.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.homemodel});
  final List<HomeModel> homemodel;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<HomeModel> search = [];
  @override
  void initState() {
    search = widget.homemodel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, List<HomeModel>>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
            ),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0xffF2F2F2),
                    ),
                    onChanged: (value) {
                      searchProduct(name: value);
                    },
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: search.length,
                    itemBuilder: (context, index) {
                      return CustomSearchProduct(homeModel: search[index]);
                    },
                  ),
                )
              ],
            ));
      },
    );
  }

  searchProduct({required String name}) {
    setState(() {
      search = widget.homemodel.where((element) {
        return element.name.toLowerCase().contains(name.toLowerCase());
      }).toList();
    });
  }
}
