import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/row_with_icons_for_card_product_or_category.dart';
import '../../manager/category_cubit.dart';
import '../../../data/models/category_all_get_model.dart';

class CategoryCardWidget extends StatefulWidget {
  CategoryCardWidget(
      {required this.isButton,
      required this.isShowSubCategory,
      this.nextPageInIconDetail,
      required this.isDisplayFlotaingButton,
      required this.title});
  bool isButton = false;
  String? nextPageInIconDetail;
  bool isShowSubCategory = false;
  final bool isDisplayFlotaingButton;
  String title;
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
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        color: colorGrey),
                    child: const Image(
                      image: AssetImage(
                        'assets/images/photo1.png',
                      ),
                    ),
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
                title: widget.title,
                nextPageInIconDetail: widget.nextPageInIconDetail,
                isShowSubCategory: widget.isShowSubCategory,
                isDisplayFlotaingButton: widget.isDisplayFlotaingButton,
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
                        context.read<CategoryCubit>().getAllCategory();
                      },
                      child: const Text(
                        'اضافة قسم',
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
