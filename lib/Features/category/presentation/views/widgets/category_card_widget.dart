import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_shope_dash_board/Features/category/data/models/category_all_get_model.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/views/widgets/sub_category_view_body.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/row_with_icons_for_card_product_or_category.dart';
import '../../manager/category_cubit.dart';
import 'auth_network_image.dart';

class CategoryCardWidget extends StatefulWidget {
  CategoryCardWidget(
      {super.key,
      required this.isButton,
      required this.isShowSubCategory,
      this.nextPageInIconDetail,
      required this.isDisplayFlotaingButton,
      required this.title,
      this.data,
      required this.image,
      required this.id,
      required this.textbutton});
  bool isButton = false;
  String? nextPageInIconDetail;
  bool isShowSubCategory = false;
  final bool isDisplayFlotaingButton;
  String title;
  String image;
  // CategoryGetAllModle dd;
  int? id;
  Data? data;
  String textbutton;
  @override
  State<CategoryCardWidget> createState() => _CategoryCardWidgetState();
}

class _CategoryCardWidgetState extends State<CategoryCardWidget> {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubGategoryViewBody(id: widget.id),
                    ),
                  );

                  // context.go('${widget.nextPageInIconDetail}/${widget.id}');
                  // context.go('${widget.nextPageInIconDetail}');
                  print(widget.id);
                },
                // print('dllllldiejflejfaljoiejofjel'+'${widget.data!.id}'),
                //delelte
                onTap: () {
                  print('deleteeee Category');
                  context
                      .read<CategoryCubit>()
                      .deleteCategoryFunction(widget.id.toString(), context);
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
                  onPressed: () {
                    context.goNamed(
                      'edit_category_main_view_body',
                      pathParameters: {
                        'category_id': widget.id.toString(),
                        'category_image': widget.image,
                        'category_title': widget.title,
                      },
                    );
                    print('the id is:' '${widget.id}');
                  },
                  icon: Icon(
                    Icons.edit,
                    size: isHoveredIconEdite ? 27 : 23,
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Visibility(
                visible: widget.isButton, // تحديد إذا كان يجب عرض الزر أم لا
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(colorGrey)),
                      onPressed: () {
                        // context.read<CategoryCubit>().getAllCategory();
                        context.goNamed(
                          "add_sub_category_view",
                          pathParameters: {
                            'category_id': widget.id.toString(),
                          },
                        );
                      },
                      child: Text(
                        widget.textbutton,
                        style: Styles.style18,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
