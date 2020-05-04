import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_friends/favor.dart';
import 'package:my_friends/friend.dart';
import 'package:my_friends/mock_values.dart';
import 'package:flutter/services.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:my_friends/themes.dart';

void main() {
  runApp(MyFriendsApp());
}

class MyFriendsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My Friends App",
        theme: purpleTheme,
        //theme: greenTheme,
        home: FavorsPage(
          pendingAnswerFavors: mockPendingFavors,
          completedFavors: mockCompletedFavors,
          refusedFavors: mockRefusedFavors,
          acceptedFavors: mockDoingFavors,
        )

//         home: RequestFavorPage( // uncomment this and comment 'home' below to change the visible page for now
//           friends: mockFriends,
//         ),

        );
  }
}

class FavorsPage extends StatelessWidget {
  final List<Favor> pendingAnswerFavors;
  final List<Favor> acceptedFavors;
  final List<Favor> completedFavors;
  final List<Favor> refusedFavors;

  FavorsPage({
    Key key,
    this.pendingAnswerFavors,
    this.acceptedFavors,
    this.completedFavors,
    this.refusedFavors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headline5;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Friend Requests'),
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(child: Text('Requests')),
              Tab(child: Text('Doing')),
              Tab(child: Text('Completed')),
              Tab(child: Text('Refused')),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _favorsList(Text("Pending Requests", style: titleStyle),
                pendingAnswerFavors),
            _favorsList(Text("Doing", style: titleStyle), acceptedFavors),
            _favorsList(Text("Completed", style: titleStyle), completedFavors),
            _favorsList(Text("Refused", style: titleStyle), refusedFavors),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _pressButton(),
          tooltip: 'Ask a favor',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  int _times = 0;
  _pressButton() {
    _times++;
    print('Button has been pressed $_times times');
  }

//  Widget _buildCategoryTab(String title) {
//    return Tab(
//      child: Text(title),
//    );
//  }

  Widget _favorsList(Text title, List<Favor> favors) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          child: title,
          padding: EdgeInsets.only(top: 16.0),
        ),
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: favors.length,
            itemBuilder: (BuildContext context, int index) {
              final favor = favors[index];
              return FavorCardItem(favor: favor);
            },
          ),
        ),
      ],
    );
  }
}

class FavorCardItem extends StatelessWidget {
  final Favor favor;
  FavorCardItem({Key key, this.favor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(favor.uuid),
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: Padding(
        child: Column(
          children: <Widget>[
            _itemHeader(favor),
            Text(favor.description),
            _itemFooter(favor)
          ],
        ),
        padding: EdgeInsets.all(8.0),
      ),
    );
  }

  Row _itemHeader(Favor favor) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(
            favor.friend.photoURL,
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text("${favor.friend.name} asked you to... ")),
        )
      ],
    );
  }

  Widget _itemFooter(Favor favor) {
    if (favor.isCompleted) {
      final format = DateFormat();
      return Container(
        margin: EdgeInsets.only(top: 8.0),
        alignment: Alignment.centerRight,
        child: Chip(
          label: Text("Completed at: ${format.format(favor.completed)}"),
        ),
      );
    }
    if (favor.isRequested) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FlatButton(
            child: Text("Refuse"),
            onPressed: () {},
          ),
          FlatButton(
            child: Text("Do"),
            onPressed: () {},
          )
        ],
      );
    }
    if (favor.isDoing) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FlatButton(
            child: Text("give up"),
            onPressed: () {},
          ),
          FlatButton(
            child: Text("complete"),
            onPressed: () {},
          )
        ],
      );
    }

    return Container();
  }
}

//------------------------------------
//------------------------------------
class RequestFavorPage extends StatelessWidget {
  final List<Friend> friends;

  RequestFavorPage({Key key, this.friends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requesting a favor"),
        leading: CloseButton(),
        actions: <Widget>[
          FlatButton(
              child: Text("SAVE"), textColor: Colors.white, onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Request a favor to:"),
            DropdownButtonFormField(
              items: friends
                  .map(
                    (f) => DropdownMenuItem(
                      child: Text(f.name),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                print(value.toString());
              },
            ),
            Container(
              height: 16.0,
            ),
            Text("Favor description:"),
            TextFormField(
              maxLines: 5,
              inputFormatters: [LengthLimitingTextInputFormatter(200)],
            ),
            Container(
              height: 16.0,
            ),
            Text("Due Date:"),
            DateTimePickerFormField(
              inputType: InputType.both,
              format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
              editable: false,
              decoration: InputDecoration(
                  labelText: 'Date/Time',
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
              onChanged: (dt) {},
            ),
          ],
        ),
      ),
    );
  }
}
