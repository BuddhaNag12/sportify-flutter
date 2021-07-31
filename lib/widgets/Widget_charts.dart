import 'package:sportify/models/chartModel.dart';
import 'package:sportify/screens/exports/createEventExport.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DonutPieChart extends StatelessWidget {
  final List<CategoriesModel> data;
  DonutPieChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<CategoriesModel, int>> series = [
      charts.Series(
        id: 'categoryName',
        domainFn: (CategoriesModel cat, _) => cat.categoriesCount,
        measureFn: (CategoriesModel cat, _) => cat.categoriesCount,
        data: data,
        labelAccessorFn: (CategoriesModel row, _) =>
            '${row.categoryName}: ${row.categoriesCount}',
      )
    ];
    return charts.PieChart(
      series,
      animate: true,
      defaultRenderer: charts.ArcRendererConfig(
        arcWidth: 60,
        arcRendererDecorators: [charts.ArcLabelDecorator()],
      ),
    );
  }
}

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
        labelAccessorFn: (CategoriesModel row, _) =>
            '${row.categoryName}: ${row.categoriesCount}',
      )
    ];
    return charts.BarChart(
      series,
      animate: true,
    );
  }
}
