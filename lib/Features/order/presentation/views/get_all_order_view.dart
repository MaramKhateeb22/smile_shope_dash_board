import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_shope_dash_board/Features/order/data/model/get_all_order_model.dart';
import 'package:smile_shope_dash_board/Features/order/presentation/manager/cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class GetAllOrder extends StatefulWidget {
  const GetAllOrder({super.key});
  // AllUsersModel? allUsers;
  @override
  State<GetAllOrder> createState() => _GetAllOrderState();
}

class _GetAllOrderState extends State<GetAllOrder> {
  @override
  // void initState() {
  //   context.read<AllUsersCubit>().getNumberUsersCubit();
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جميع الطلبات '),
        // leading: const Icon(Icons.people),
      ),
      body: FutureBuilder(
        // future: Future.wait<List<dynamic>>([
        // context.read<AllUsersCubit>().getAllUsersCubit(),
        // context.read<AllUsersCubit>().getNumberUsersCubit(),
        // ]),
        future: context.read<GetAllOrderCubit>().getAllOrder(),

        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // if (snap.data == null) {
          //   return const Center(child: Text(" لا يوجد فواتير   "));
          // }
          if (snap.hasError) {
            return const Text("Something has error");
          } else {
            List<GetAllOrderModel> allorder =
                context.read<GetAllOrderCubit>().allorder!;
            // NumberUserModel numberUseres =
            // context.read<AllUsersCubit>().numberUseres!;
            print('kkkkkkkkkkkkkkkkkkk\n' '${allorder.length}');
            return SingleChildScrollView(
              child: Column(
                children: [
                  // BlocBuilder<AllUsersCubit, AllUsersState>(
                  //   builder: (context, state) {
                  //     if (state is GetNumberUsersStateSuccess) {
                  //       return Text(
                  //         '  عدد المستخدمين'
                  //         ' : '
                  //         '${state.numberUserModel.numberOfUsers}',
                  //         style: const TextStyle(fontSize: 25, color: Colors.red),
                  //       );
                  //     } else if (state is GetNumberUsersStateFailure) {
                  //       return Text(state.errMessage);
                  //     } else if (state is GetNumberUsersStateLoading) {
                  //       return const CircularProgressIndicator();
                  //     } else {
                  //       return Text(
                  //         ' المستخدمين  '
                  //         ' : '
                  //         '${numberUseres.numberOfUsers}',
                  //         style: const TextStyle(fontSize: 25, color: Colors.red),
                  //       );
                  //     }
                  //   },
                  // ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: allorder.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 8),
                        child: Card(
                          color: Colors.grey[200],
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.numbers,
                                          color: Colors.orange,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${allorder[index].orderId}',
                                          // "${snap.data!.docs[index].data()["name"]}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w900),
                                          // style: Theme.of(context).textTheme.titleMedium,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.abc_outlined,
                                          color: Colors.orange,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${allorder[index].userName}',
                                          // "${snap.data!.docs[index].data()["name"]}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w900),
                                          // style: Theme.of(context).textTheme.titleMedium,
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.phone,
                                            color: Colors.orange,
                                          ),
                                          // const SizedBox(
                                          //   width: 5,
                                          // ),
                                          Text(
                                            '${allorder[index].userPhone}',
                                            // "${snap.data!.docs[index].data()["numberphone"]}",
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 134, 134, 134),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // style: Theme.of(context).textTheme.titleMedium,
                                      onPressed: () async {
                                        final Uri phoneUri = Uri(
                                          scheme: 'tel',
                                          path: ''
                                              '${allorder[index].userPhone}', // أضف رقم الهاتف هنا
                                        );
                                        launch(phoneUri.toString());
                                      },
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.price_check,
                                          color: Colors.orange,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'SYP  '
                                          '${allorder[index].totalPrice}',
                                          // "${snap.data!.docs[index].data()["name"]}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w900),
                                          // style: Theme.of(context).textTheme.titleMedium,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.date_range,
                                          color: Colors.orange,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${allorder[index].date}',
                                          // "${snap.data!.docs[index].data()["name"]}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w900),
                                          // style: Theme.of(context).textTheme.titleMedium,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          ' حالة الدفع:',
                                          style: TextStyle(
                                              color: Colors.orange,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        allorder[index].paid == 0
                                            ? const Text(
                                                'لم يتم الدفع',
                                                style: TextStyle(fontSize: 18),
                                              )
                                            : const Text(
                                                '✔ تم الدفع',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.pushNamed(
                                      'detail_order_view',
                                      extra: allorder[index],
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.arrow_circle_left_outlined,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
