import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/vueloController.dart';
import 'package:gotravelclub/models/response/airportResponse.dart';

class DropDown extends StatelessWidget {
  final String id;
  final String label;
  final double rotation;
  final Function function;

  DropDown({
    Key? key,
    required this.id,
    required this.label,
    required this.rotation,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VueloController>(
        id: this.id,
        builder: (_) {
          return Material(
            elevation: 4,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: DropdownSearch<Airport>(
              items: [],
              isFilteredOnline: true,
              mode: Mode.DIALOG,
              //dropdownBuilder: _customDropDownExampleMultiSelection,
              popupItemBuilder: _customPopupItemBuilderExample,
              dropdownBuilder: _customDropDownExample,
              maxHeight: Get.height * 0.6,
              onFind: (String? filter) => _.getAirports(filter!),
              dropdownSearchDecoration: InputDecoration(
                label: Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text("${label}"),
                ),
                contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onChanged: (value) {
                print(value!.name);
                this.function(value.name);
              },
              showSearchBox: true,
            ),
          );
        });
  }

  Widget _customPopupItemBuilderExample(
      BuildContext context, Airport? item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Color(0xff621771)),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item?.name ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${item?.country?.toString()} / ${item?.city?.toString()} / ${item?.state?.toString()}"),
            Text(item?.iata?.toString() ?? ''),
          ],
        ),
        leading: CircleAvatar(
          child: Transform(
            child: Icon(
              Icons.flight,
              color: Colors.white,
            ),
            alignment: FractionalOffset.center, // set transform origin
            transform: new Matrix4.rotationZ(this.rotation),
          ),
          backgroundColor: Color(0xff621771),
          // this does not work - throws 404 error
          // backgroundImage: NetworkImage(item.avatar ?? ''),
        ),
      ),
    );
  }

  Widget _customDropDownExample(BuildContext context, Airport? item) {
    if (item == null) {
      return Container();
    }

    return Container(
      child: (item.pk == null)
          ? ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                child: Transform(
                  child: Icon(
                    Icons.flight,
                    color: Colors.white,
                  ),
                  alignment: FractionalOffset.center, // set transform origin
                  transform: new Matrix4.rotationZ(this.rotation),
                ),
                backgroundColor: Color(0xff621771),
                // this does not work - throws 404 error
                // backgroundImage: NetworkImage(item.avatar ?? ''),
              ),
              title: Text("No item selected"),
            )
          : ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                child: Transform(
                  child: Icon(
                    Icons.flight,
                    color: Colors.white,
                  ),
                  alignment: FractionalOffset.center, // set transform origin
                  transform: new Matrix4.rotationZ(this.rotation),
                ),
                backgroundColor: Color(0xff621771),
                // this does not work - throws 404 error
                // backgroundImage: NetworkImage(item.avatar ?? ''),
              ),
              title: Text(item.name!),
              subtitle: Text(
                item.country.toString(),
              ),
            ),
    );
  }
}
