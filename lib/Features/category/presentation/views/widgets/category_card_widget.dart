import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/views/function/shwo_dialog_delete_func.dart';
import 'package:smile_shope_dash_board/Features/category/presentation/views/function/shwo_dialog_function.dart';


import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/styles.dart';

class CategoryCardWidget extends StatefulWidget {
   CategoryCardWidget({required this.isButton,required this.isShowSubCategory,required this.isDisplayFlotaingButton});
   bool isButton=false;
   bool isShowSubCategory=false;
  final bool isDisplayFlotaingButton;
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
                        borderRadius: BorderRadius.only(
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
              SizedBox(
                height: 15,
              ),
              Row(
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
                         context.go('/add_product_view');
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

                        context.go('/sub_category_view');
                      },
                      icon: Icon(Icons.arrow_circle_left_outlined,
                          size: isHoveredIconDetails ? 32 : 27),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
              Spacer(
                flex: 1,
              ),

              Visibility(
                visible: widget.isButton, // تحديد إذا كان يجب عرض الزر أم لا
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(colorGrey)),
                      onPressed: () {},
                      child: Text(
                        'اضافة قسم',
                        style: Styles.style18,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 1,
              ),
            // ElevatedButton(
            //   style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.all(colorGrey)),
            //   onPressed: () {},
            //   child: Text(
            //     'اضافة قسم',
            //     style: Styles.style18,
            //   ),
            // ),
            // Spacer(
            //   flex: 1,
            // ),


            ],
          ),
        ),
      ),
    );
  }
}
