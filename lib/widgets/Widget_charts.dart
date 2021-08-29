import 'package:flutter/material.dart';
import 'package:sportify/constants/colorConst.dart';
import 'package:sportify/models/chartModel.dart';
import 'package:sportify/screens/exports/createEventExport.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChart extends StatelessWidget {
  final List<CategoriesModel> data;
  BarChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<CategoriesModel, String>> series = [
      charts.Series(
        id: 'categoryName',
        domainFn: (CategoriesModel cat, _) => cat.categoryName,
        measureFn: (CategoriesModel cat, _) => cat.categoriesCount,
        data: data,
        colorFn: (o, p) => charts.ColorUtil.fromDartColor(o.primaryColor),
        labelAccessorFn: (CategoriesModel row, _) => ' ${row.categoriesCount}',
      )
    ];
    return charts.BarChart(
      series,
      animate: true,
      vertical: true,
      behaviors: [
        charts.DatumLegend(
          position: charts.BehaviorPosition.top,
          outsideJustification: charts.OutsideJustification.endDrawArea,
          horizontalFirst: true,
          desiredMaxRows: 2,
          desiredMaxColumns: 5,
          cellPadding: EdgeInsets.only(right: 4.0, bottom: 4.0),
          entryTextStyle: charts.TextStyleSpec(
            color: charts.ColorUtil.fromDartColor(primaryColor),
          ),
        )
      ],
      barRendererDecorator: charts.BarLabelDecorator(
        insideLabelStyleSpec: charts.TextStyleSpec(
          color: charts.ColorUtil.fromDartColor(Colors.white),
        ),
        outsideLabelStyleSpec: charts.TextStyleSpec(),
      ),
    );
  }
}

class DougnNutChart extends StatelessWidget {
  final List<CategoriesModel> data;
  DougnNutChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<CategoriesModel, String>> series = [
      charts.Series(
        id: 'categoryName',
        domainFn: (CategoriesModel cat, _) => cat.categoryName,
        measureFn: (CategoriesModel cat, _) => cat.categoriesCount,
        data: data,
        colorFn: (o, p) => charts.ColorUtil.fromDartColor(o.primaryColor),
        outsideLabelStyleAccessorFn: (CategoriesModel row, _) =>
            charts.TextStyleSpec(
          fontSize: 10,
          color: charts.MaterialPalette.black,
        ),
        labelAccessorFn: (CategoriesModel row, _) =>
            ' ${row.categoryName} - ${row.categoriesCount}',
      )
    ];
    return new charts.PieChart(
      series,
      animate: true,
      defaultRenderer: new charts.ArcRendererConfig(
        arcWidth: 30,
        arcRendererDecorators: [
          new charts.ArcLabelDecorator(),
        ],
      ),
    );
  }
}
