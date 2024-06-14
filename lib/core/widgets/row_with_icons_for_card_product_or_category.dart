import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Features/category/presentation/views/function/shwo_dialog_function.dart';

class RowWithIcons extends StatefulWidget {
  RowWithIcons({
    super.key,
    this.nextPageInIconDetail,
    this.isDisplayFlotaingButton = false,
    this.isShowSubCategory = false,
    this.title,
    required this.id,
    required this.onTap,
    required this.onpressed,
  });
  String? nextPageInIconDetail;
  String? title;
  int? id;
  final bool isShowSubCategory;
  final bool isDisplayFlotaingButton;
  final Function() onTap;
  final Function() onpressed;
  @override
  State<RowWithIcons> createState() => _RowWithIconsState();
}

class _RowWithIconsState extends State<RowWithIcons> {
  bool isHoveredIconDelete = false;
  bool isHoveredIconEdite = false;
  bool isHoveredIconDetails = false;
  bool isHoveredIconAdd = false;
  // final void Function() onTap;
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
              onPressed:
                  // print('del');
                  widget.onTap,
              icon: Icon(
                Icons.delete_forever,
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
              onPressed: widget.onpressed,
              // onPressed: () {
              //   context.go('${widget.nextPageInIconDetail}');
              //   print('Hellllllllllllllllllllllllllllllll\n');
              //   // print(widget.id);
              // },
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
