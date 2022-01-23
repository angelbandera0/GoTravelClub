import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Escapada extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Escapada> {
  final _formKey = GlobalKey<FormState>();
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<String>>();
  final _multiKey = GlobalKey<DropdownSearchState<String>>();
  final _userEditTextController = TextEditingController(text: 'Mrs');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DropdownSearch Demo")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(4),
            children: <Widget>[


              ///Menu Mode with overriden icon and dropdown buttons
              DropdownSearch<UserModel>.multiSelection(
                searchFieldProps: TextFieldProps(
                  controller: _userEditTextController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _userEditTextController.clear();
                      },
                    ),
                  ),
                ),
                mode: Mode.BOTTOM_SHEET,
                maxHeight: 700,
                isFilteredOnline: true,
                showClearButton: true,
                showSelectedItems: true,
                compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                showSearchBox: true,
                dropdownSearchDecoration: InputDecoration(
                  labelText: 'User *',
                  filled: true,
                  fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                ),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                validator: (u) =>
                u == null || u.isEmpty ? "user field is required " : null,
                onFind: (String? filter) => getData(filter),
                onChanged: (data) {
                  print(data);
                },
                dropdownBuilder: _customDropDownExampleMultiSelection,
                popupItemBuilder: _customPopupItemBuilderExample,
                popupSafeArea: PopupSafeAreaProps(top: true, bottom: true),
                scrollbarProps: ScrollbarProps(
                  isAlwaysShown: true,
                  thickness: 7,
                ),
              ),
              Divider(),

              ///custom itemBuilder and dropDownBuilder
              DropdownSearch<UserModel>(
                showSelectedItems: true,
                compareFn: (i, s) => i?.isEqual(s) ?? false,
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Person",
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                onFind: (String? filter) => getData(filter),
                onChanged: (data) {
                  print(data);
                },
                dropdownBuilder: _customDropDownExample,
                popupItemBuilder: _customPopupItemBuilderExample2,
              ),
              Divider(),



              ///merge online and offline data in the same list and set custom max Height
              DropdownSearch<UserModel>(
                items: [
                  UserModel(name: "Offline name1", id: "999"),
                  UserModel(name: "Offline name2", id: "0101")
                ],
                isFilteredOnline: true,
                maxHeight: 300,
                onFind: (String? filter) => getData(filter),
                dropdownSearchDecoration: InputDecoration(
                  labelText: "choose a user",
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                onChanged: print,
                showSearchBox: true,
              ),
              Divider(),

              ///open dropdown programmatically
              DropdownSearch<String>(
                items: ["no action", "confirm in the next dropdown"],
                dropdownSearchDecoration: InputDecoration(
                  labelText: "open another dropdown programmatically",
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) {
                  if (v == "confirm in the next dropdown") {
                    _openDropDownProgKey.currentState?.openDropDownSearch();
                  }
                },
              ),
              Padding(padding: EdgeInsets.all(4)),
              DropdownSearch<String>(
                validator: (value) => value == null ? "empty" : null,
                key: _openDropDownProgKey,
                items: ["Yes", "No"],
                dropdownSearchDecoration: InputDecoration(
                  labelText: "confirm",
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                showSelectedItems: true,
                dropdownButtonSplashRadius: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _openDropDownProgKey.currentState?.openDropDownSearch();
                      },
                      child: Text("Open dropdownSearch")),
                  ElevatedButton(
                      onPressed: () {
                        _openDropDownProgKey.currentState
                            ?.changeSelectedItem("No");
                      },
                      child: Text("set to 'NO'")),
                  Material(
                    child: ElevatedButton(
                        onPressed: () {
                          _openDropDownProgKey.currentState
                              ?.changeSelectedItem("Yes");
                        },
                        child: Text("set to 'YES'")),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _openDropDownProgKey.currentState
                            ?.changeSelectedItem('Blabla');
                      },
                      child: Text("set to 'Blabla'")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _customDropDownExampleMultiSelection(
      BuildContext context, List<UserModel?> selectedItems) {
    if (selectedItems.isEmpty) {
      return ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(),
        title: Text("No item selected"),
      );
    }

    return Wrap(
      children: selectedItems.map((e) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                // this does not work - throws 404 error
                // backgroundImage: NetworkImage(item.avatar ?? ''),
              ),
              title: Text(e?.name ?? ''),
              subtitle: Text(
                e?.createdAt.toString() ?? '',
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  RenderBox? _findBorderBox(RenderBox box) {
    RenderBox? borderBox;

    box.visitChildren((child) {
      if (child is RenderCustomPaint) {
        borderBox = child;
      }

      final box = _findBorderBox(child as RenderBox);
      if (box != null) {
        borderBox = box;
      }
    });

    return borderBox;
  }

  Widget _customDropDownExample(BuildContext context, UserModel? item) {
    if (item == null) {
      return Container();
    }

    return Container(
      child: (item.avatar == null)
          ? ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(),
        title: Text("No item selected"),
      )
          : ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(
          // this does not work - throws 404 error
          // backgroundImage: NetworkImage(item.avatar ?? ''),
        ),
        title: Text(item.name),
        subtitle: Text(
          item.createdAt.toString(),
        ),
      ),
    );
  }

  Widget _customPopupItemBuilderExample(
      BuildContext context, UserModel? item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: ListTile(
        selected: isSelected,
        title: Text(item?.name ?? ''),
        subtitle: Text(item?.createdAt?.toString() ?? ''),
        leading: CircleAvatar(
          // this does not work - throws 404 error
          // backgroundImage: NetworkImage(item.avatar ?? ''),
        ),
      ),
    );
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context, UserModel? item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: ListTile(
        selected: isSelected,
        title: Text(item?.name ?? ''),
        subtitle: Text(item?.createdAt?.toString() ?? ''),
        leading: CircleAvatar(
          // this does not work - throws 404 error
          // backgroundImage: NetworkImage(item.avatar ?? ''),
        ),
      ),
    );
  }

  Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "https://5d85ccfb1e61af001471bf60.mockapi.io/user",
      queryParameters: {"filter": filter},
    );

    final data = response.data;
    if (data != null) {
      return UserModel.fromJsonList(data);
    }

    return [];
  }
}













class UserModel {
  final String id;
  final DateTime? createdAt;
  final String name;
  final String? avatar;

  UserModel(
      {required this.id, this.createdAt, required this.name, this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      createdAt:
      json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
      name: json["name"],
      avatar: json["avatar"],
    );
  }

  static List<UserModel> fromJsonList(List list) {
    return list.map((item) => UserModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  ///this method will prevent the override of toString
  bool? userFilterByCreationDate(String filter) {
    return this.createdAt?.toString().contains(filter);
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(UserModel? model) {
    return this.id == model?.id;
  }

  @override
  String toString() => name;
}