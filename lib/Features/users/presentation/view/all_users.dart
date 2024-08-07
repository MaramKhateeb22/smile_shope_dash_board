import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope_dash_board/Features/users/data/models/all_users_model.dart';
import 'package:smile_shope_dash_board/Features/users/data/models/number_users_model.dart';
import 'package:smile_shope_dash_board/Features/users/presentation/manager/cubit.dart';
import 'package:smile_shope_dash_board/Features/users/presentation/manager/state.dart';
import 'package:url_launcher/url_launcher.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({super.key});
  // AllUsersModel? allUsers;
  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  @override
  void initState() {
    context.read<AllUsersCubit>().getNumberUsersCubit();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عملاؤنا '),
        // leading: const Icon(Icons.people),
      ),
      body: FutureBuilder(
        // future: Future.wait<List<dynamic>>([
        // context.read<AllUsersCubit>().getAllUsersCubit(),
        // context.read<AllUsersCubit>().getNumberUsersCubit(),
        // ]),
        future: context.read<AllUsersCubit>().getAllUsersCubit(),

        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return const Text("Something has error");
          } else {
            AllUsersModel allUsers = context.read<AllUsersCubit>().allUsers!;
            NumberUserModel numberUseres =
                context.read<AllUsersCubit>().numberUseres!;
            print('kkkkkkkkkkkkkkkkkkk\n' '${numberUseres.numberOfUsers}');
            return Column(
              children: [
                BlocBuilder<AllUsersCubit, AllUsersState>(
                  builder: (context, state) {
                    if (state is GetNumberUsersStateSuccess) {
                      return Text(
                        '  عدد المستخدمين'
                        ' : '
                        '${state.numberUserModel.numberOfUsers}',
                        style: const TextStyle(fontSize: 25, color: Colors.red),
                      );
                    } else if (state is GetNumberUsersStateFailure) {
                      return Text(state.errMessage);
                    } else if (state is GetNumberUsersStateLoading) {
                      return const CircularProgressIndicator();
                    } else {
                      return Text(
                        ' المستخدمين  '
                        ' : '
                        '${numberUseres.numberOfUsers}',
                        style: const TextStyle(fontSize: 25, color: Colors.red),
                      );
                    }
                  },
                ),
                ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: allUsers.users?.length,
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
                            // mainAxisAlignment: MainAxisAlignment.,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                child: Image.asset('assets/images/images.png'),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${allUsers.users?[index].name}',
                                    // "${snap.data!.docs[index].data()["name"]}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900),
                                    // style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    '${allUsers.users![index].address}',
                                    // "${snap.data!.docs[index].data()["name"]}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900),
                                    // style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  TextButton(
                                    child: Text(
                                      '${allUsers.users![index].email}',
                                      // "${snap.data!.docs[index].data()["email"]}",
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 134, 134, 134),
                                          fontSize: 20),
                                    ),
                                    // style: Theme.of(context).textTheme.titleMedium,
                                    onPressed: () async {
                                      final Uri emailUri = Uri(
                                          scheme: 'mailto', path: ''
                                          // ':${snap.data!.docs[index].data()["email"]}', // أضف البريد الإلكتروني هنا
                                          );
                                      if (await canLaunchUrl(emailUri)) {
                                        await launch(emailUri.toString());
                                      } else {
                                        throw 'لا تمتلك بطيق ال email';
                                      }
                                    },
                                  ),
                                  TextButton(
                                    child: Text(
                                      '${allUsers.users![index].phone}',
                                      // "${snap.data!.docs[index].data()["numberphone"]}",
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 134, 134, 134),
                                          fontSize: 20),
                                    ),
                                    // style: Theme.of(context).textTheme.titleMedium,
                                    onPressed: () async {
                                      final Uri phoneUri = Uri(
                                        scheme: 'tel',
                                        path: ''
                                            '${allUsers.users?[index].phone}', // أضف رقم الهاتف هنا
                                      );
                                      launch(phoneUri.toString());
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
