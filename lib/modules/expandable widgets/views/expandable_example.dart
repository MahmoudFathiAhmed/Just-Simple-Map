
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locations_work/core/utils/image_assets.dart';
import 'package:locations_work/modules/expandable%20widgets/widgets/default_expandable_widget.dart';


class ExpandableExample extends StatelessWidget {
  const ExpandableExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('أي كفته'),),
      body:  Padding(
        padding:  const EdgeInsets.all(30),
        child: ListView(
          children:  [
            DefaultExpandableWidget(headerText: 'Mahmoud', content: SvgPicture.asset(ImageAssets.instaLogo,height: 140,)),
            SizedBox(height: 20),
            DefaultExpandableWidget(headerText: 'Any Thing',content: Center(child: Text('يا خلق لو هتنامو لأ ثواني متناموش',style: TextStyle(fontSize: 19),)),),
          ],
        ),
      ),
    );
  }
}


// BlocProvider(
// create: (context) => ExpansionPanelBloc(),
// child: BlocBuilder<ExpansionPanelBloc, ExpansionPanelState>(
// builder: (context, state) {
// return ListView(
// shrinkWrap: true,
// physics: const NeverScrollableScrollPhysics(),
// children: [
// ExpansionPanelList(
// elevation: 0,
// expandIconColor: Colors.red,
// expandedHeaderPadding: EdgeInsets.zero,
// // animationDuration: Duration(milliseconds: 2000),
// children: [
// ExpansionPanel(
// headerBuilder: (context, isExpanded) {
// return Container(
// height: 79,
// decoration: BoxDecoration(
// border: Border.all(color: Colors.grey),
// borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
// ),
// );
// //   ListTile(
// //   title: Text('Click To Expand', style: TextStyle(color: Colors.black)),
// // );
// },
// body: ListTile(
// title: Text('Description text', style: TextStyle(color: Colors.black)),
// ),
// isExpanded: state.isExpanded,
// canTapOnHeader: true,
// ),
// ],
// dividerColor: Colors.grey,
// expansionCallback: (panelIndex, isExpanded) {
// context.read<ExpansionPanelBloc>().add(ToggleExpansionEvent());
// },
// )
// ],
// );
// },
// ),
// ),
