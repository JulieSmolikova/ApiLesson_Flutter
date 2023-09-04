import 'package:api_lesson/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageApi extends StatelessWidget {
  const PageApi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //starting the function before building the page:
    final response = Provider.of<Data>(context, listen: false);
    response.fetchUsers();

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(25),

        child: Consumer<Data>(
          builder: (context, data, child) {

            return Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,

                    child: ListView.builder(
                      itemCount: data.users.length,
                      itemBuilder: (context, index){

                        //in the 'user' variable write one of the 50 users from json:
                        final user = data.users[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: (){},
                            tileColor: user.gender == 'male' ? Colors.indigo.shade200 : Colors.pinkAccent.shade100,
                            title: Text(user.name.first),
                            subtitle: Text(user.cell),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(user.picture.thumbnail),
                            ),
                          ),
                        );
                      }),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
