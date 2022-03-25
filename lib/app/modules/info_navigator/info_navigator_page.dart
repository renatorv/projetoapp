import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/instapet_buttom.dart';
import '../../components/instapet_textformfield.dart';
import '../../core/core.dart';
import './info_navigator_controller.dart';

class InfoNavigatorPage extends StatefulWidget {
  const InfoNavigatorPage({Key? key}) : super(key: key);

  @override
  State<InfoNavigatorPage> createState() => _InfoNavigatorPageState();
}

class _InfoNavigatorPageState
    extends InstaState<InfoNavigatorPage, InfoNavigatorController> {
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = controller.nome;
  }

  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);

    return GetBuilder<InfoNavigatorController>(
      builder: (_) => Column(
        children: [
          Container(
            height: _responsive.dp(26),
            decoration: BoxDecoration(
              gradient: PaletaCores.degradePerfil,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  _responsive.dp(8),
                ),
                bottomRight: Radius.circular(
                  _responsive.dp(8),
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      minRadius: _responsive.dp(4.6),
                      child: ImageIcon(
                        AssetImage("assets/icons/gallery.png"),
                        color: Colors.red,
                        size: _responsive.dp(4),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      minRadius: _responsive.dp(7.6),
                      child: CircleAvatar(
                        radius: _responsive.dp(6),
                        backgroundImage: NetworkImage(
                          'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg',
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      minRadius: _responsive.dp(4.6),
                      child: ImageIcon(
                        AssetImage("assets/icons/camera.png"),
                        color: Colors.red,
                        size: _responsive.dp(4),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  subtitle: Text(
                    'Sou um cãozinho tímido, mas que conquista corações!',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                Padding(
                    padding: EdgeInsets.only(
                      right: _responsive.dp(3.6),
                      left: _responsive.dp(3.6),
                    ),
                    child: TextFormField(
                      controller: _controller,
                      initialValue: 'adfadfasddfasdfadsf',
                      decoration: InputDecoration(
                        label: Text('teste'),
                      ),
                    )
                    // InstapetTextformfield(
                    //   label: 'Nome',
                    //   controller: _nameEC,

                    // ),
                    ),
                Divider(),
                ListTile(
                  title: Text(
                    'Nome',
                    style: TextStyle(
                      color: PaletaCores.principal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    controller.nome,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Gênero',
                    style: TextStyle(
                      color: PaletaCores.principal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Feminino',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Idade',
                    style: TextStyle(
                      color: PaletaCores.principal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '2 aninhos',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(
                    right: _responsive.dp(3.6),
                    left: _responsive.dp(3.6),
                    bottom: _responsive.dp(3.6),
                  ),
                  child: Center(
                    child: InstapetButtom(
                      label: 'ATUALIZAR',
                      onPressed: () {},
                      width: context.width,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
///
///
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../components/instapet_buttom.dart';
// import '../../core/core.dart';
// import './info_navigator_controller.dart';

// class InfoNavigatorPage extends StatefulWidget {
//   const InfoNavigatorPage({Key? key}) : super(key: key);

//   @override
//   State<InfoNavigatorPage> createState() => _InfoNavigatorPageState();
// }

// class _InfoNavigatorPageState
//     extends InstaState<InfoNavigatorPage, InfoNavigatorController> {
//   @override
//   Widget build(BuildContext context) {
//     final Responsive _responsive = Responsive(context);
//     return GetBuilder<InfoNavigatorController>(
//       builder: (_) => ListView(
//         children: [
//           Container(
//             height: _responsive.dp(26),
//             decoration: BoxDecoration(
//               gradient: PaletaCores.degradePerfil,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.white,
//                       minRadius: _responsive.dp(4.6),
//                       child: ImageIcon(
//                         AssetImage("assets/icons/gallery.png"),
//                         color: Colors.red,
//                         size: _responsive.dp(4),
//                       ),
//                     ),
//                     CircleAvatar(
//                       backgroundColor: Colors.white,
//                       minRadius: _responsive.dp(7.6),
//                       child: CircleAvatar(
//                         radius: _responsive.dp(6),
//                         backgroundImage: NetworkImage(
//                           'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg',
//                         ),
//                       ),
//                     ),
//                     CircleAvatar(
//                       backgroundColor: Colors.white,
//                       minRadius: _responsive.dp(4.6),
//                       child: ImageIcon(
//                         AssetImage("assets/icons/camera.png"),
//                         color: Colors.red,
//                         size: _responsive.dp(4),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             children: [
//               ListTile(
//                 subtitle: Text(
//                   'Sou um cãozinho tímido, mas que conquista corações!',
//                   style: TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               Divider(),
//               ListTile(
//                 title: Text(
//                   'Nome',
//                   style: TextStyle(
//                     color: PaletaCores.principal,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 subtitle: Text(
//                   'Belinha',
//                   style: TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               Divider(),
//               ListTile(
//                 title: Text(
//                   'Gênero',
//                   style: TextStyle(
//                     color: PaletaCores.principal,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 subtitle: Text(
//                   'Feminino',
//                   style: TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               Divider(),
//               ListTile(
//                 title: Text(
//                   'Idade',
//                   style: TextStyle(
//                     color: PaletaCores.principal,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 subtitle: Text(
//                   '2 aninhos',
//                   style: TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               Divider(),
//               Padding(
//                 padding: EdgeInsets.only(
//                   right: _responsive.dp(3.6),
//                   left: _responsive.dp(3.6),
//                   bottom: _responsive.dp(3.6),
//                 ),
//                 child: Center(
//                   child: InstapetButtom(
//                     label: 'ATUALIZAR',
//                     onPressed: () {},
//                     width: context.width,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       // builder: (_) => Stack(
//       //   children: [
//       //     Positioned(
//       //       left: _responsive.dp(6),
//       //       child: controller.imagem != null
//       //           ? CircleAvatar(
//       //               radius: 76,
//       //               backgroundColor: PaletaCores.principal,
//       //               child: CircleAvatar(
//       //                 backgroundImage: FileImage(
//       //                   File(controller.imagem!),
//       //                 ),
//       //                 radius: 65,
//       //               ),
//       //             )
//       //           : CircularProgressIndicator(
//       //               color: PaletaCores.principal,
//       //             ),
//       //     ),
//       //     Positioned(
//       //       top: _responsive.dp(6.8),
//       //       right: _responsive.dp(6.2),
//       //       child: controller.imagem != null
//       //           ? CircleAvatar(
//       //               radius: 76,
//       //               backgroundColor: PaletaCores.principal,
//       //               child: CircleAvatar(
//       //                 backgroundImage: FileImage(
//       //                   File(controller.imagem!),
//       //                 ),
//       //                 radius: 65,
//       //               ),
//       //             )
//       //           : CircularProgressIndicator(
//       //               color: PaletaCores.principal,
//       //             ),
//       //     ),
//       //     Positioned(
//       //       top: _responsive.dp(32),
//       //       right: _responsive.dp(5),
//       //       left: _responsive.dp(5),
//       //       child: Container(
//       //         child: const Center(
//       //           child: Text(
//       //             'Sou um cãozinho tímido, mas que conquista corações!',
//       //             style: TextStyle(
//       //                 fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
//       //           ),
//       //         ),
//       //         decoration: BoxDecoration(
//       //           borderRadius: BorderRadius.circular(10),
//       //           color: Colors.white,
//       //           boxShadow: const [
//       //             BoxShadow(color: PaletaCores.principal, spreadRadius: 8),
//       //             BoxShadow(color: PaletaCores.scaffold, spreadRadius: 10),
//       //           ],
//       //         ),
//       //         height: _responsive.dp(6),
//       //         width: _responsive.dp(28),
//       //       ),
//       //       // Container(
//       //       //   padding: EdgeInsets.all(_responsive.dp(1)),
//       //       //   decoration: BoxDecoration(
//       //       //     border: Border.all(
//       //       //       width: 6,
//       //       //       color: PaletaCores.scaffold,
//       //       //     ),
//       //       //   ),
//       //       //   child: Text(
//       //       //     "Sou um cãozinho tímido, mas que conquista corações!",
//       //       //     style: TextStyle(
//       //       //       fontStyle: FontStyle.italic,
//       //       //       fontWeight: FontWeight.bold,
//       //       //     ),
//       //       //   ),
//       //       // ),
//       //     ),
//       //     Positioned(
//       //       top: _responsive.dp(40),
//       //       right: _responsive.dp(5),
//       //       left: _responsive.dp(5),
//       //       child: SingleChildScrollView(
//       //         child: Column(
//       //           mainAxisAlignment: MainAxisAlignment.center,
//       //           children: [
//       //             // Container(
//       //             //   height: _responsive.dp(6),
//       //             //   width: _responsive.dp(26),
//       //             //   decoration: BoxDecoration(
//       //             //     border: Border.all(
//       //             //       color: Colors.grey.shade300,
//       //             //     ),
//       //             //     borderRadius: BorderRadius.circular(10.0),
//       //             //   ),
//       //             //   child: Center(
//       //             //     child: Text(
//       //             //       'Beagle',
//       //             //       style: TextStyle(
//       //             //         fontSize: _responsive.dp(2.8),
//       //             //       ),
//       //             //     ),
//       //             //   ),
//       //             // ),
//       //             // SizedBox(height: _responsive.dp(1)),
//       //             // Container(
//       //             //   height: _responsive.dp(6),
//       //             //   width: _responsive.dp(26),
//       //             //   decoration: BoxDecoration(
//       //             //     border: Border.all(
//       //             //       color: Colors.grey.shade300,
//       //             //     ),
//       //             //     borderRadius: BorderRadius.circular(10.0),
//       //             //   ),
//       //             //   child: Center(
//       //             //     child: Text(
//       //             //       'Masculino',
//       //             //       style: TextStyle(
//       //             //         fontSize: _responsive.dp(2.8),
//       //             //       ),
//       //             //     ),
//       //             //   ),
//       //             // ),
//       //             // ClipRRect(
//       //             //   borderRadius: const BorderRadius.all(Radius.circular(16.0)),
//       //             //   child: Container(
//       //             //     height: _responsive.dp(7),
//       //             //     width: _responsive.dp(30),
//       //             //     padding: const EdgeInsets.all(16.0),
//       //             //     decoration: BoxDecoration(
//       //             //       border: Border(
//       //             //         left: BorderSide(
//       //             //           width: 8.0,
//       //             //           color: PaletaCores.principal,
//       //             //         ),
//       //             //         right: BorderSide(
//       //             //           width: 8.0,
//       //             //           color: PaletaCores.principal,
//       //             //         ),
//       //             //       ),
//       //             //     ),
//       //             //     child: Center(child: Text('Beagle')),
//       //             //   ),
//       //             // ),
//       //             // ClipRRect(
//       //             //   borderRadius: const BorderRadius.all(Radius.circular(16.0)),
//       //             //   child: Container(
//       //             //     height: _responsive.dp(7),
//       //             //     width: _responsive.dp(30),
//       //             //     padding: const EdgeInsets.all(16.0),
//       //             //     decoration: BoxDecoration(
//       //             //       border: Border(
//       //             //         left: BorderSide(
//       //             //           width: 8.0,
//       //             //           color: PaletaCores.principal,
//       //             //         ),
//       //             //         right: BorderSide(
//       //             //           width: 8.0,
//       //             //           color: PaletaCores.principal,
//       //             //         ),
//       //             //       ),
//       //             //     ),
//       //             //     child: Center(child: Text('Masculino')),
//       //             //   ),
//       //             // ),
//       //             Container(
//       //               child: const Center(
//       //                 child: Text(
//       //                   'Beagle',
//       //                   style: TextStyle(
//       //                     fontWeight: FontWeight.bold,
//       //                   ),
//       //                 ),
//       //               ),
//       //               decoration: BoxDecoration(
//       //                 borderRadius: BorderRadius.circular(10),
//       //                 color: Colors.white,
//       //                 boxShadow: const [
//       //                   BoxShadow(
//       //                       color: PaletaCores.principal, spreadRadius: 8),
//       //                   BoxShadow(
//       //                       color: PaletaCores.scaffold, spreadRadius: 10),
//       //                 ],
//       //               ),
//       //               height: _responsive.dp(6),
//       //               width: _responsive.dp(28),
//       //             ),
//       //             // SizedBox(height: 8),
//       //             Container(
//       //               child: const Center(
//       //                 child: Text(
//       //                   'Masculino',
//       //                   style: TextStyle(
//       //                     fontWeight: FontWeight.bold,
//       //                   ),
//       //                 ),
//       //               ),
//       //               decoration: BoxDecoration(
//       //                 borderRadius: BorderRadius.circular(10),
//       //                 color: Colors.white,
//       //                 boxShadow: const [
//       //                   BoxShadow(
//       //                       color: PaletaCores.principal, spreadRadius: 8),
//       //                   BoxShadow(
//       //                       color: PaletaCores.scaffold, spreadRadius: 10),
//       //                 ],
//       //               ),
//       //               height: _responsive.dp(6),
//       //               width: _responsive.dp(28),
//       //             ),
//       //             // SizedBox(height: 8),
//       //             Container(
//       //               child: const Center(
//       //                 child: Text(
//       //                   '2 aninhos',
//       //                   style: TextStyle(
//       //                     fontWeight: FontWeight.bold,
//       //                   ),
//       //                 ),
//       //               ),
//       //               decoration: BoxDecoration(
//       //                 borderRadius: BorderRadius.circular(10),
//       //                 color: Colors.white,
//       //                 boxShadow: const [
//       //                   BoxShadow(
//       //                       color: PaletaCores.principal, spreadRadius: 8),
//       //                   BoxShadow(
//       //                       color: PaletaCores.scaffold, spreadRadius: 10),
//       //                 ],
//       //               ),
//       //               height: _responsive.dp(6),
//       //               width: _responsive.dp(28),
//       //             ),
//       //             Container(
//       //               child: const Center(
//       //                 child: Text(
//       //                   '2 aninhos',
//       //                   style: TextStyle(
//       //                     fontWeight: FontWeight.bold,
//       //                   ),
//       //                 ),
//       //               ),
//       //               decoration: BoxDecoration(
//       //                 borderRadius: BorderRadius.circular(10),
//       //                 color: Colors.white,
//       //                 boxShadow: const [
//       //                   BoxShadow(
//       //                       color: PaletaCores.principal, spreadRadius: 8),
//       //                   BoxShadow(
//       //                       color: PaletaCores.scaffold, spreadRadius: 10),
//       //                 ],
//       //               ),
//       //               height: _responsive.dp(6),
//       //               width: _responsive.dp(28),
//       //             ),
//       //             Container(
//       //               child: const Center(
//       //                 child: Text(
//       //                   '2 aninhos',
//       //                   style: TextStyle(
//       //                     fontWeight: FontWeight.bold,
//       //                   ),
//       //                 ),
//       //               ),
//       //               decoration: BoxDecoration(
//       //                 borderRadius: BorderRadius.circular(10),
//       //                 color: Colors.white,
//       //                 boxShadow: const [
//       //                   BoxShadow(
//       //                       color: PaletaCores.principal, spreadRadius: 8),
//       //                   BoxShadow(
//       //                       color: PaletaCores.scaffold, spreadRadius: 10),
//       //                 ],
//       //               ),
//       //               height: _responsive.dp(6),
//       //               width: _responsive.dp(28),
//       //             ),
//       //             Container(
//       //               child: const Center(
//       //                 child: Text(
//       //                   '2 aninhos',
//       //                   style: TextStyle(
//       //                     fontWeight: FontWeight.bold,
//       //                   ),
//       //                 ),
//       //               ),
//       //               decoration: BoxDecoration(
//       //                 borderRadius: BorderRadius.circular(10),
//       //                 color: Colors.white,
//       //                 boxShadow: const [
//       //                   BoxShadow(
//       //                       color: PaletaCores.principal, spreadRadius: 8),
//       //                   BoxShadow(
//       //                       color: PaletaCores.scaffold, spreadRadius: 10),
//       //                 ],
//       //               ),
//       //               height: _responsive.dp(6),
//       //               width: _responsive.dp(28),
//       //             ),
//       //             Container(
//       //               child: const Center(
//       //                 child: Text(
//       //                   '2 aninhos',
//       //                   style: TextStyle(
//       //                     fontWeight: FontWeight.bold,
//       //                   ),
//       //                 ),
//       //               ),
//       //               decoration: BoxDecoration(
//       //                 borderRadius: BorderRadius.circular(10),
//       //                 color: Colors.white,
//       //                 boxShadow: const [
//       //                   BoxShadow(
//       //                       color: PaletaCores.principal, spreadRadius: 8),
//       //                   BoxShadow(
//       //                       color: PaletaCores.scaffold, spreadRadius: 10),
//       //                 ],
//       //               ),
//       //               height: _responsive.dp(6),
//       //               width: _responsive.dp(28),
//       //             ),
//       //           ],
//       //         ),
//       //       ),
//       //     ),
//       //   ],
//       // ),
//       // // builder: (_) => Column(
//       // //   crossAxisAlignment: CrossAxisAlignment.center,
//       // //   children: [
//       // //     Container(
//       // //       padding: EdgeInsets.only(right: _responsive.dp(8)),
//       // //       child: controller.imagem != null
//       // //           ? CircleAvatar(
//       // //               radius: 60,
//       // //               backgroundColor: PaletaCores.principal,
//       // //               child: CircleAvatar(
//       // //                 backgroundImage: FileImage(
//       // //                   File(controller.imagem!),
//       // //                 ),
//       // //                 radius: 50,
//       // //               ),
//       // //             )
//       // //           : CircularProgressIndicator(
//       // //               color: PaletaCores.principal,
//       // //             ),
//       // //     ),
//       // //     Container(
//       // //       padding: EdgeInsets.only(left: _responsive.dp(8)),
//       // //       child: controller.imagem != null
//       // //           ? CircleAvatar(
//       // //               radius: 60,
//       // //               backgroundColor: PaletaCores.principal,
//       // //               child: CircleAvatar(
//       // //                 backgroundImage: FileImage(
//       // //                   File(controller.imagem!),
//       // //                 ),
//       // //                 radius: 50,
//       // //               ),
//       // //             )
//       // //           : CircularProgressIndicator(
//       // //               color: PaletaCores.principal,
//       // //             ),
//       // //     ),
//       // //   ],
//       // // ),
//     );
//   }
// }
