import 'package:flutter/material.dart';
import 'package:smile_shope_dash_board/Features/order/data/model/get_all_order_model.dart';

class DetailOrder extends StatelessWidget {
  DetailOrder({super.key, required this.order});
  GetAllOrderModel order;
  int num = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.sizeOf(context).width / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 228, 228, 228)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'رقم الطلب:',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${order.orderId}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'اسم الزبون :',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${order.userName}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          '  عنوان الزبون :',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${order.userAddress}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          '  تاريخ الشراء   :',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${order.date}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          '  رقم هاتف الزبون :',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${order.userPhone}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          '  المبلغ الاجمالي    :' 'S.Y',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${order.totalPrice}',
                          style: const TextStyle(fontSize: 18),
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
                        order.paid == 0
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
                    const Text(
                      '  المنتجات التي تم شراؤها:     :',
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '  المنتج   :' '${num++}',
                              style: const TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold),
                            ),

                            // const Text('\n'),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      '  اسم المنتج :',
                                      style: TextStyle(
                                          color: Colors.pink,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${order.items![index].productName}',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      '   لونه   :',
                                      style: TextStyle(
                                          color: Colors.pink,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${order.items![index].color}',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      '  سعره  :',
                                      style: TextStyle(
                                          color: Colors.pink,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${order.items![index].pricePerItem}'
                                      'S.Y',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      '   حجمه   :',
                                      style: TextStyle(
                                          color: Colors.pink,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${order.items![index].size}',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      '  عدد القطع المطلوبة  :',
                                      style: TextStyle(
                                          color: Colors.pink,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${order.items![index].count}' 'S.Y',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      '   السعر الكلي لعدد القطع    :',
                                      style: TextStyle(
                                          color: Colors.pink,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${order.items![index].totalPrice}',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Divider()
                          ],
                        );
                      },
                      itemCount: order.items!.length,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
