import 'package:flutter_template/app.dart';
import 'package:flutter_template/blocs/workbench_bloc.dart';
import 'package:flutter_template/constants/dims.dart';
import 'package:flutter_template/global/common_views/common_text.dart';
import 'package:flutter_template/global/common_views/title_text.dart';
import 'package:flutter_template/global/common_views/v_spacer.dart';
import 'package:flutter_template/global/convertor/date_time_converter.dart';
import 'package:flutter_template/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../models/workbensh_model.dart';
import '../resources/save.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    workbenchBlocShowGroupByDate.fetchShowGroupByDate(
        apiAddress: 'workbench/show-group-by-date', body: {});
  }

  @override
  Widget build(BuildContext context) {

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(

          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Theme.of(context).primaryColorDark,
              onPressed: () {

                Navigator.pushNamed(context, '/workbench/home',
                    arguments: {"date": DateTime.now().toString().split(' ')[0]});

              }, label: TitleText("کارهای امروز")),
          body: SafeArea(
            child: Column(
              children: [
                header(),
                content(),
              ],
            ),
          ),
        ));
  }

  Widget header() {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: Dims.bigPadding,
        right: Dims.bigPadding,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(Dims.boxBorderRadius)),
          gradient: LinearGradient(stops: [
            .1,
            .8
          ], colors: [
            Theme.of(context).primaryColorLight,
            Theme.of(context).primaryColorDark
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                offset: Offset(0, 10),
                blurRadius: 15,
                spreadRadius: 5)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.height / 6,
            height: MediaQuery.of(context).size.height / 6,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child:
                Image.asset('assets/images/img_avatar.png', fit: BoxFit.cover),
          ),
          VSpacer(),
          FutureBuilder(
              future: getUserData(),
              builder: (context, AsyncSnapshot<UserModel> snapshot) {
                if (snapshot.hasData) {
                  return TitleText(
                    snapshot.data?.first_name +
                        " " +
                        snapshot.data?.last_name +
                        " عزیز ، خوش اومدی",
                    bold: true,
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              })
        ],
      ),
    );
  }

  Widget content() {
    return Expanded(
        child: Container(
      child: StreamBuilder<WorkbenchModelList>(
        stream: workbenchBlocShowGroupByDate.actions,
        builder: (context, AsyncSnapshot<WorkbenchModelList> snapshot) {
          if (snapshot.hasData) {

            if (snapshot.data?.list.length == 0) {
              return Center(
                  child: TitleText(
                    "اطلاعاتی برای نمایش وجود نداره :(", bold: true,
                    textColor: Colors.white,));
            }

            return ListView.separated(
              padding: EdgeInsets.only(
                top: Dims.bigPadding * 2,
                left: Dims.bigPadding,
                right: Dims.bigPadding,
              ),
              itemCount: snapshot.data?.list.length as int,
              itemBuilder: (context, index) {
                return list(snapshot.data?.list[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return VSpacer(
                  big: true,
                );
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    ));
  }

  Widget list(WorkbenchModel? model) {
    return Material(
      color: Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(Dims.boxBorderRadius)),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(Dims.boxBorderRadius)),
        onTap: () {
          Navigator.pushNamed(context, '/workbench/home',
              arguments: {"date": model?.date});
        },
        child: Container(
          padding: EdgeInsets.all(Dims.bigPadding),
          decoration: BoxDecoration(

              borderRadius:
              BorderRadius.all(Radius.circular(Dims.boxBorderRadius)),
              border: Border.all(
                  width: 2, color: Theme.of(context).primaryColorLight)),
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TitleText(
              DateTimeConverter.greToJalali(model?.date),
              textColor: Colors.white,
              textAlign: TextAlign.right,
            ),
            TitleText(
              model?.count,
              textColor: Colors.white,
              textAlign: TextAlign.right,
            )
          ]),
        ),
      ),
    );
  }

  Future<UserModel> getUserData() async {
    return await Save().getUserData();
  }
}
