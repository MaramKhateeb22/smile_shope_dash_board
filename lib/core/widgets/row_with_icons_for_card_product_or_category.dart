import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_shope_dash_board/Features/product/presentation/manager/cubit/cubit.dart';

import '../../Features/category/presentation/views/function/shwo_dialog_function.dart';

class RowWithIcons extends StatefulWidget {
  RowWithIcons(
      {super.key,
      this.nextPageInIconDetail,
      this.isDisplayFlotaingButton = false,
      this.isShowSubCategory = false,
      this.title,
      this.id});
  String? nextPageInIconDetail;
  String? title;
  int? id;
  final bool isShowSubCategory;
  final bool isDisplayFlotaingButton;

  @override
  State<RowWithIcons> createState() => _RowWithIconsState();
}

class _RowWithIconsState extends State<RowWithIcons> {
  bool isHoveredIconDelete = false;
  bool isHoveredIconEdite = false;
  bool isHoveredIconDetails = false;
  bool isHoveredIconAdd = false;
  //  int id=widget.id;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(
          flex: 1,
        ),
        Text(
          "${widget.title}",
          style: const TextStyle(fontSize: 25),
        ),
        const Spacer(
          flex: 3,
        ),
        MouseRegion(
          onEnter: (event) {
            setState(() {
              isHoveredIconDelete = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHoveredIconDelete = false;
            });
          },
          child: Container(
            child: IconButton(
              onPressed: () {
                print('deleteeee');
                setState(() {
                  context
                      .read<ProductCubit>()
                      .deleteProductFunction(widget.id.toString(), context);
                  // buildShwoDialogDelete(context, widget.id);
                });
              },
              icon: Icon(
                Icons.delete,
                size: isHoveredIconDelete ? 27 : 23,
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        MouseRegion(
          onEnter: (event) {
            setState(() {
              isHoveredIconEdite = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHoveredIconEdite = false;
            });
          },
          child: IconButton(
            onPressed: () {
              buildShwoDialogEdit(context);
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
        if (widget.isDisplayFlotaingButton)
          MouseRegion(
            onEnter: (event) {
              setState(() {
                isHoveredIconAdd = true;
              });
            },
            onExit: (event) {
              isHoveredIconAdd = false;
            },
            child: IconButton(
              onPressed: () {
                context.go('${widget.nextPageInIconDetail}');
              },
              icon: Icon(Icons.add_circle_outlined,
                  size: isHoveredIconAdd ? 27 : 23),
            ),
          ),
        if (widget.isShowSubCategory)
          MouseRegion(
            onEnter: (event) {
              setState(() {
                isHoveredIconDetails = true;
              });
            },
            onExit: (event) {
              isHoveredIconDetails = false;
            },
            child: IconButton(
              onPressed: () {
                context.go('${widget.nextPageInIconDetail}');
              },
              icon: Icon(Icons.arrow_circle_left_outlined,
                  size: isHoveredIconDetails ? 32 : 27),
            ),
          ),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
