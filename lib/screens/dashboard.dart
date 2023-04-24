import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:test_neversitup/controllers/baseController.dart';
import 'package:test_neversitup/models/appState.dart';
import 'package:test_neversitup/models/appTextSetting.dart';
import 'package:test_neversitup/screens/utilitys/myStyle.dart';


class Dashboard extends StatefulWidget {
  static const String id = "Dashboard";
  final void Function()? onInit;
  const Dashboard({Key? key, required this.onInit}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  BaseController baseController = BaseController();

  bool isLoading = true;

  dynamic _item = [
    {
      "id": "001",
      "fname": "สมชาย",
      "lname": "ใจดี",
      "img_profile":
          "https://scontent.fkkc2-1.fna.fbcdn.net/v/t1.6435-9/165470603_293342378814296_7168494544595351075_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=174925&_nc_eui2=AeF2a77ZCNazGkYWjk7ut0ybsDW3pYqZIZGwNbelipkhkXpq-QQ5cTn8lDlE28xot3i1orBpXCOmUdU_seiKBV8s&_nc_ohc=Cw7J7vF3HkAAX9Hf56-&_nc_ht=scontent.fkkc2-1.fna&oh=00_AfC48Cc0sT0fc4Pq2nfZJdZcoTYbzN48-MK5rIcDxd6FnQ&oe=646A25AF",
      "create_date": "21/04/2566",
      "text": "เมนูวันหยุด ยาว...",
      "img":
          "https://scontent.fkkc2-1.fna.fbcdn.net/v/t39.30808-6/336665423_237931135436230_2323276518240760397_n.jpg?stp=dst-jpg_p180x540&_nc_cat=101&ccb=1-7&_nc_sid=5cd70e&_nc_eui2=AeHY79-n6vqrjNofjf-W7wJq_xWzYkco3aP_FbNiRyjdo3zy5zum6TD99CyD1P7h3S6TDFOkLSKwvATms7lmv5jE&_nc_ohc=krelyagLL4sAX9Lmg7b&_nc_ht=scontent.fkkc2-1.fna&oh=00_AfD_fYa7Eb6G5N6bXXS5CDtNDqx_ZiEsZDBkMj3DM9jpqQ&oe=6446F8E7",
      "like_count": "10",
      "comment_count": "2",
    },
    {
      "id": "002",
      "fname": "สมชาย",
      "lname": "ใจดี",
      "img_profile":
          "https://scontent.fkkc2-1.fna.fbcdn.net/v/t1.6435-9/165470603_293342378814296_7168494544595351075_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=174925&_nc_eui2=AeF2a77ZCNazGkYWjk7ut0ybsDW3pYqZIZGwNbelipkhkXpq-QQ5cTn8lDlE28xot3i1orBpXCOmUdU_seiKBV8s&_nc_ohc=Cw7J7vF3HkAAX9Hf56-&_nc_ht=scontent.fkkc2-1.fna&oh=00_AfC48Cc0sT0fc4Pq2nfZJdZcoTYbzN48-MK5rIcDxd6FnQ&oe=646A25AF",
      "create_date": "21/04/2566",
      "text": "เมนูแนะนำสำหรับวันนี้",
      "img":
          "https://scontent.fkkc2-1.fna.fbcdn.net/v/t39.30808-6/336641867_972722063719638_4394488463191814340_n.jpg?stp=dst-jpg_s640x640&_nc_cat=100&ccb=1-7&_nc_sid=5cd70e&_nc_eui2=AeFWrsj1faJYxzA6C1NRdf9465Bd_ZinnEPrkF39mKecQwAuy5Jmq00Qk1ocmu8N4TQXEEQlKQN9uMR7v-uYJO_1&_nc_ohc=uErnXB-TfhUAX_5RbH3&_nc_ht=scontent.fkkc2-1.fna&oh=00_AfA-vQ5iP4DzDjYW92iQSBOVo5ZkkVY-0e_9sKM4HOZm6g&oe=6447A2CD",
      "like_count": "102",
      "comment_count": "20",
    },
    {
      "id": "003",
      "fname": "สมชาย",
      "lname": "ใจดี",
      "img_profile":
          "https://scontent.fkkc2-1.fna.fbcdn.net/v/t1.6435-9/165470603_293342378814296_7168494544595351075_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=174925&_nc_eui2=AeF2a77ZCNazGkYWjk7ut0ybsDW3pYqZIZGwNbelipkhkXpq-QQ5cTn8lDlE28xot3i1orBpXCOmUdU_seiKBV8s&_nc_ohc=Cw7J7vF3HkAAX9Hf56-&_nc_ht=scontent.fkkc2-1.fna&oh=00_AfC48Cc0sT0fc4Pq2nfZJdZcoTYbzN48-MK5rIcDxd6FnQ&oe=646A25AF",
      "create_date": "21/04/2566",
      "text": "เมนูสุดฮิตของทางร้าน",
      "img":
          "https://scontent.fkkc2-1.fna.fbcdn.net/v/t39.30808-6/336560599_180779261461504_7781247782386042579_n.jpg?stp=dst-jpg_p526x296&_nc_cat=101&ccb=1-7&_nc_sid=5cd70e&_nc_eui2=AeFA8mxqSJwxwocMucIbDYOQoiE4PbILoWKiITg9sguhYt1WRq9S7aJLa9CdJcgCRHAHB7niphZKmnCFE9l1DQJ4&_nc_ohc=T44nTKWiA_IAX_zQXlk&_nc_oc=AQlUstdZFi3CFXM3pHhkVOVR-xWxvlgS3CF1aBAoOfZmaeBBSkvxXNh1waxlWS7sFTQ&_nc_ht=scontent.fkkc2-1.fna&oh=00_AfB7HfHjr8Yd8FpYFdEU5IBRoWqG3Q0KKTWkeqMtEVCZ7g&oe=6446E8CB",
      "like_count": "500",
      "comment_count": "200",
    },
  ];

  @override
  void initState() {
    super.initState();
    widget.onInit!();

    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  loadData() async {
    isLoading = false;
    widget.onInit!();
  }

  Container dashboard(BuildContext context, double heightScreen,
      double widthScreen, AppState state) {
    return Container(
      child: Column(
          children: listDashboard(context, heightScreen, widthScreen, _item)),
    );
  }

  List<Widget> listDashboard(BuildContext context, double heightScreen,
      double widthScreen, dynamic list) {
    List<Widget> card = [];

    for (var item in list) {
      card.add(Container(
          margin: const EdgeInsets.only(
            top: 10,
            left: 5,
            right: 5,
            bottom: 5,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [MyStyle().boxShadow()]),
          child: Column(
            children: [
              SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        //color: Colors.white,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                  height: heightScreen * 0.05,
                                  width: widthScreen * 0.11,
                                  decoration: BoxDecoration(
                                    color: MyStyle().colorThemeBG(),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Center(
                                      child: CachedNetworkImage(
                                    imageUrl: item['img_profile'],
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        //shape: BoxShape.circle,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                      width: 150.0,
                                      height: 150.0,
                                    ),
                                    placeholder: (context, url) => Center(
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        child:
                                            const CircularProgressIndicator(),
                                      ),
                                    ),
                                    // placeholder: (context, url) =>
                                    //     const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ))),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pao.Tinnakon',
                                  style: TextStyle(
                                      color: MyStyle().colorText(),
                                      fontFamily: AppTextSetting.APP_FONT,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      item['create_date'],
                                      style: TextStyle(
                                          color: MyStyle().colorText(),
                                          fontFamily: AppTextSetting.APP_FONT,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: FaIcon(
                                            FontAwesomeIcons.earth,
                                            color: MyStyle().colorText(),
                                            size: 10,
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: heightScreen * 0.06,
                        //color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                            child: Align(
                                alignment: Alignment.topRight,
                                child: FaIcon(
                                  FontAwesomeIcons.ellipsis,
                                  color: MyStyle().colorText(),
                                )),
                          ),
                        ),
                      )),
                ],
              ),
              Container(
                width: widthScreen * 0.9,
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      item['text'],
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontFamily: AppTextSetting.APP_FONT,
                          fontWeight: FontWeight.normal),
                    )),
              ),
              Container(
                  //color: Colors.grey[300],
                  margin: const EdgeInsets.all(13),
                  child: Container(
                    width: widthScreen,
                    //height: 250,
                    child: Container(
                      //height: 200,
                      child: FullScreenWidget(
                        child: Center(
                          child: ClipRRect(
                            child: CachedNetworkImage(
                              imageUrl: item['img'],
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(
                                  child: Container(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(),
                              )),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          SizedBox(
                            width: widthScreen * 0.07,
                          ),
                          Image.asset(
                            'assets/icons/like.png',
                            width: 20,
                            height: 25,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            " ${item['like_count']} ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: AppTextSetting.APP_FONT,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${item['comment_count']} comments",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: AppTextSetting.APP_FONT,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: widthScreen * 0.07,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  width: widthScreen * 0.9,
                  child: Divider(
                    color: Colors.grey.shade500,
                  )),
              SizedBox(
                width: widthScreen * 0.05,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Align(
                          alignment: Alignment.center,
                          child: FaIcon(
                            FontAwesomeIcons.thumbsUp,
                            color: MyStyle().colorText(),
                            size: 20,
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Align(
                          alignment: Alignment.center,
                          child: FaIcon(
                            FontAwesomeIcons.comment,
                            color: MyStyle().colorText(),
                            size: 20,
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Align(
                          alignment: Alignment.center,
                          child: FaIcon(
                            FontAwesomeIcons.shareFromSquare,
                            color: MyStyle().colorText(),
                            size: 20,
                          )),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          )));
    }

    return card;
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return isLoading
              ? Container(
                  height: heightScreen,
                  width: widthScreen,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : dashboard(context, heightScreen, widthScreen, state);
        });
  }
}
