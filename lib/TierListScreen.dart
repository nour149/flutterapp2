import 'package:desktop_app/Tier.dart';
import 'package:flutter/material.dart';

class TierListScreen extends StatefulWidget {
  final List<Tier> tierList;

  const TierListScreen({Key? key, required this.tierList}) : super(key: key);

  @override
  _TierListScreenState createState() => _TierListScreenState();
}

class _TierListScreenState extends State<TierListScreen> {
  @override
  void initState() {
    super.initState();
    print('Received Tier List in initState: ${widget.tierList}');
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Tier List'),
  //     ),
  //     body: ListView.builder(
  //       itemCount: widget.tierList.length,
  //       itemBuilder: (context, index) {
  //         Tier tier = widget.tierList[index];
  //         return ListTile(
  //           title: Text(tier.name),
  //           subtitle: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text('Email: ${tier.email}'),
  //               Text('Telephone: ${tier.tel}'),
  //               Text('Town: ${tier.town}'),
  //               Text('Address: ${tier.adress}'),
  //               Text('Country: ${tier.country}'),
  //               Text('First Responsible: ${tier.firstResp}'),
  //               Text('Email First Responsible: ${tier.emailFirstResp}'),
  //               Text('Logo: ${tier.logo}'),
  //               Text('VAT: ${tier.vat}'),
  //               Text('RNE: ${tier.rne}'),
  //             ],
  //           ),
  //           // Additional ListTile properties to display other tier information
  //         );
  //       },
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tier List'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('Telephone')),
            DataColumn(label: Text('Town')),
            DataColumn(label: Text('Address')),
            DataColumn(label: Text('Country')),
            DataColumn(label: Text('First Responsible')),
            DataColumn(label: Text('Email First Responsible')),
            DataColumn(label: Text('VAT')),
            DataColumn(label: Text('RNE')),
            DataColumn(label: Text('Logo')),
          ],
          rows: widget.tierList.map((tier) {
            return DataRow(cells: [
              DataCell(Text(tier.name)),
              DataCell(Text(tier.email)),
              DataCell(Text(tier.tel)),
              DataCell(Text(tier.town)),
              DataCell(Text(tier.adress)), // Corrected from 'address'
              DataCell(Text(tier.country)),
              DataCell(Text(tier.firstResp)),
              DataCell(Text(tier.emailFirstResp)),
              DataCell(Text(tier.vat)),
              DataCell(Text(tier.rne)),
              DataCell(Text(tier.logo)),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}