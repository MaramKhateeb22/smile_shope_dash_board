import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope_dash_board/Features/category/data/models/category_all_get_Sub_Category_model.dart';
import 'package:smile_shope_dash_board/Features/category/data/models/category_all_get_model.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_cubit.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/manager/category_state.dart';
import 'package:smile_shope_dash_board/Features/sub_category/presentation/view/all_prdouct_for_sub_categoru.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/row_with_icons_for_card_product_or_category.dart';
import 'auth_network_image.dart';

class SubGategoryViewBody extends StatefulWidget {
  SubGategoryViewBody({super.key, required this.id});
  int? id;
  @override
  State<SubGategoryViewBody> createState() => _SubGategoryViewBodyState();
}

class _SubGategoryViewBodyState extends State<SubGategoryViewBody> {
  // داخل الصفحة الثانية، قد تتمكن من الحصول على id بهذه الطريقة (اعتمادًا على إعداد الrouter):
  @override
  Widget build(BuildContext context) {
    // final id = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: buildAppBar(
        title: 'الأصناف الفرعية',
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder<dynamic>(
          future: context.read<CategoryCubit>().getAllSubCategoryForOneCategory(
              widget.id.toString()), // الوظيفة التي تحصل على البيانات من API
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print(snapshot.error);
              // return Center(child: Text('يوجد خطأ: ${snapshot.error}'));
              return const Center(child: Text('لا يوجد أصناف فرعبة'));
            } else {
              List<GetAllSubCatForOneCatModel?> allSubCategory =
                  context.read<CategoryCubit>().allSubCategoryForOneCategory!;
              return BlocConsumer<CategoryCubit, CategoryState>(
                listener: (context, state) {
                  if (state is GetAllSubCategorySuccess) {
                    setState(() {});
                  }
                  if (state is DeleteSubCategorySuccess) {
                    setState(() {});
                  }
                },
                builder: (context, state) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 1115
                            ? 4
                            : MediaQuery.of(context).size.width > 650
                                ? 2
                                : 1,
                        // crossAxisCount: 4,
                        childAspectRatio: 1 / 1.2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: allSubCategory.length,
                    itemBuilder: (context, index) {
                      // categoryid = allSubCategory[index].id!;
                      return CategoryCardWidgetSubCategory(
                        // textbutton: '',
                        // textbutton: 'إضافة منتج',
                        id: allSubCategory[index]!.id!,
                        isButton: true,
                        isShowSubCategory: true,
                        isDisplayFlotaingButton: false,
                        nextPageInIconDetail: '/sub_category_view',
                        title: allSubCategory[index]!.title2!,
                        image: allSubCategory[index]!.image2!,
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class CategoryCardWidgetSubCategory extends StatefulWidget {
  CategoryCardWidgetSubCategory(
      {super.key,
      required this.isButton,
      required this.isShowSubCategory,
      this.nextPageInIconDetail,
      required this.isDisplayFlotaingButton,
      this.title,
      this.data,
      required this.image,
      required this.id,
      this.textbutton});
  bool isButton = false;
  String? nextPageInIconDetail;
  bool isShowSubCategory = false;
  final bool isDisplayFlotaingButton;
  String? title;
  String image;
  // CategoryGetAllModle dd;
  int? id;
  Data? data;
  String? textbutton;
  @override
  State<CategoryCardWidgetSubCategory> createState() =>
      _CategoryCardWidgetSubCategoryState();
}

class _CategoryCardWidgetSubCategoryState
    extends State<CategoryCardWidgetSubCategory> {
  bool isHoveredCard = false;
  bool isHoveredIconDelete = false;
  bool isHoveredIconEdite = false;
  bool isHoveredIconDetails = false;
  bool isHoveredIconAdd = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(
          () {
            isHoveredCard = true;
          },
        );
      },
      onExit: (event) {
        setState(
          () {
            isHoveredCard = false;
          },
        );
      },
      child: Card(
        elevation: isHoveredCard ? 20 : 2, // تغيير ارتفاع الحاشية عند hover
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 300,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        color: colorGrey),
                    // child:Image.network(widget.data.)
                    child: ImageWithAuth(
                      imageUrl: widget.image,
                      username: '11184828',
                      password: '60-dayfreetrial',
                    ),
                    // child:  Image(
                    //   image: NetworkImage(
                    // widget.image,
                    //   ),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  Positioned(
                    child: Container(
                      color: Colors.grey.shade50,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              RowWithIcons(
                image: widget.image,
                onpressed: () {
                  // context.go('/all_product_for_Sub_Category');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllProductForSubCategory(
                        id: widget.id,
                      ),
                    ),
                  );
                  // // context.go('${widget.nextPageInIconDetail}/${widget.id}');
                  // // context.go('${widget.nextPageInIconDetail}');
                  print(widget.id);
                },
                // print('dllllldiejflejfaljoiejofjel'+'${widget.data!.id}'),
                //delelte
                onTap: () {
                  print('deleteeee SubCategory');
                  context
                      .read<CategoryCubit>()
                      .deleteSubCategoryFunction(widget.id.toString(), context);
                  print(widget.id);
                  // buildShwoDialogDelete(context, widget.id);
                },
                // id: widget.data?.id,
                id: widget.id,
                title: widget.title,
                nextPageInIconDetail: widget.nextPageInIconDetail,
                isShowSubCategory: widget.isShowSubCategory,
                isDisplayFlotaingButton: widget.isDisplayFlotaingButton,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: isHoveredIconEdite ? 27 : 23,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
