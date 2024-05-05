import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Features/category/presentation/views/function/shwo_dialog_delete_func.dart';
import '../../Features/category/presentation/views/function/shwo_dialog_function.dart';

class RowWithIcons extends StatefulWidget {

   RowWithIcons({
     this.nextPageInIconDetail,
     this.isDisplayFlotaingButton=false,
     this.isShowSubCategory=false});
String? nextPageInIconDetail;
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
  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(
          flex: 1,
        ),
        Text(
          'أحذية',
          style: TextStyle(fontSize: 25),
        ),
        Spacer(
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
                buildShwoDialogDelete(context);
              },
              icon: Icon(
                Icons.delete,
                size: isHoveredIconDelete ? 32 : 27,
              ),
            ),
          ),
        ),
        Spacer(
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
              size: isHoveredIconEdite ? 32 : 27,
            ),
          ),
        ),
        const  Spacer(
          flex: 1,
        ),
        if(widget.isDisplayFlotaingButton)
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
                  size: isHoveredIconAdd ? 32 : 27),
            ),
          ),
        if(widget.isShowSubCategory)
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
        Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
