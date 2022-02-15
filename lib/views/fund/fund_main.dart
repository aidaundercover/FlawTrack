import 'package:flawtrack/home_widget_volunteer.dart';
import 'package:flawtrack/widgets/fund_program_tile.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../const.dart';
import '../../home_widget_citizen.dart';


class FundMain extends StatefulWidget {
  const FundMain({Key? key}) : super(key: key);

  @override
  _FundMainState createState() => _FundMainState();
}

class _FundMainState extends State<FundMain> {

   
  late List<_DonationData> _chartData;
  late TooltipBehavior _tooltipBehavior;

 @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

  


    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      appBar: AppBar(
        toolbarHeight: 50,
        title: Text('Фонд инвестициялары', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: black)),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined, size: 25, color: black),
              onPressed: () => { Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => volunteer? HomeVolunteer() : HomeCitizen()))} ),
      )),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: black.withOpacity(0.25),
                      offset: Offset(0,4),
                    )
                  ]
                ),
                width: width*0.845,
                height: 425,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SfCircularChart(
      title:
          ChartTitle(text: 'Жиналған қаражатты бөлу', textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.scroll),
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        DoughnutSeries<_DonationData, String>(
            dataSource: _chartData,
            xValueMapper: (_DonationData data, _) => data.type,
            yValueMapper: (_DonationData data, _) => data.money,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
            
            )
      ],
    ),
  
                  
                ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
              alignment: Alignment.center,
              width: width*0.85,
              child: Column(
              children: [
              Text('Соңғы жасалған қайырымдылық', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Container(
                height: 110,
                alignment: Alignment.center,
                child: Text('Әлі ешқандай қайырымдылық немесе төлем болған жоқ', style: TextStyle(fontSize: 11.5, color: grey)),
              ),
              SizedBox(
              height: 30,
              ),
              fundTile('Сарыарқа ауданын абаттандыру бағдарламасы', 248, 'assets/fund/p1.png', 0)
              ],
              ),
              )
            ]
          ),
        ),
      ),
    );
  }

  List<_DonationData> getChartData() {
    final List<_DonationData> chartData = [
      _DonationData('Животные', 250000),
    _DonationData('Облагорожение', 300000),
    _DonationData('Бездомные', 400000),
    _DonationData('Другое', 150000),
    ];
    return chartData;
  }

}

class _DonationData {
  _DonationData(this.type, this.money);

  final String type;
  final double money;
}
