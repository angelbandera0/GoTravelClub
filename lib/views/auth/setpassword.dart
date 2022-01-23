import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotravelclub/controller/authController.dart';
import 'package:gotravelclub/controller/drawerController.dart';
import 'package:gotravelclub/widgets/appBar.dart';
import 'package:gotravelclub/widgets/custom_button.dart';
import 'package:gotravelclub/widgets/custom_input1.dart';
import 'package:gotravelclub/widgets/loading.dart';
import 'package:gotravelclub/widgets/zoom_drawer_constructor.dart';

class SetPassword extends StatelessWidget {
  late MyDrawerController drawerController;

  SetPassword({Key? key}) : super(key: key) {
    drawerController = Get.find<MyDrawerController>();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        id: "setPass",
        init: AuthController(),
        builder: (_) {
          return ZoomDrawerConstructor(mainScreen: MainSetPassword());
        });
  }
}

class MainSetPassword extends StatelessWidget {
  TextEditingController passCtrl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        id: "setPasswordMain",
        builder: (_) {
          return Stack(
            children: [
              Scaffold(
                appBar: PreferredSize(
                  child: Stack(
                    children: [
                      ClipRRect(child: Image.asset("assets/fondo/fondo.png",width: Get.width,height: 136,fit: BoxFit.cover,),),
                      Container(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 35, 20, 0),

                          //color: Colors.blue,

                          child: Column(
                            children: [
                              AppBarr(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  preferredSize: Size(Get.width, 75),
                ),
                body: Stack(
                  children: [
                    ClipRRect(child: Image.asset("assets/fondo/fondo.png",width: Get.width,height: Get.height,fit: BoxFit.cover,),),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      // Center is a layout widget. It takes a single child and positions it
                      // in the middle of the parent.
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 100.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("Cambiar Contraseña",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black54),),
                              SizedBox(height: 20,),
                              CustomInput1(icon: Icons.lock, placeholder: "Ingrese la nueva contraseña", textEditingController: passCtrl, textInputType: TextInputType.text, isPassword: true, function: (){}),
                              SizedBox(height: 20,),

                              CustomButton(text: "Cambiar Contraseña", onPress: (){
                                _.setPasswordU(passCtrl.text);
                              }, color: Color(0xff56E2C6),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ),
              LoadingSetPassword()
            ],
          );
        });

  }
}

class LoadingSetPassword extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        id: "loading",
        builder: (_) {
          return (_.isLoading)?Loading():Container();
        });
  }

}
