import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataTable App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaxesScreen();
  }
}

class TaxesScreen extends StatelessWidget {
  const TaxesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      title: 'Налоги',
      child: DataTableWidget(
        columns: const [
          DataColumn(label: Text('Налог')),
          DataColumn(label: Text('Компенсация')),
          DataColumn(label: Text('Евразис')),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('10%')),
            DataCell(Text('12%')),
            DataCell(Text('10%')),
          ]),
          DataRow(cells: [
            DataCell(Text('8%')),
            DataCell(Text('11%')),
            DataCell(Text('9%')),
          ]),
        ],
      ),
    );
  }
}

class ScreenWrapper extends StatelessWidget {
  final String title;
  final Widget child;

  const ScreenWrapper({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MediaQuery.of(context).size.width < 600 ? const CustomDrawer() : null,
      appBar: AppBar(title: Text(title)),
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 600) const CustomDrawer(),
          Expanded(child: Padding(padding: const EdgeInsets.all(16.0), child: child)),
        ],
      ),
    );
  }
}

class DataTableWidget extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;

  const DataTableWidget({super.key, required this.columns, required this.rows});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(columns: columns, rows: rows),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text("DataTable Меню")),
          ListTile(
              title: const Text("Налоги"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TaxesScreen()),
                );
              }),
          ListTile(
              title: const Text("Импорт"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ImportScreen()),
                );
              }),
          ListTile(
              title: const Text("Перевозка"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TransportScreen()),
                );
              }),
        ],
      ),
    );
  }
}

class ImportScreen extends StatelessWidget {
  const ImportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      title: 'Импорт',
      child: DataTableWidget(
        columns: const [
          DataColumn(label: Text('Тип импорта')),
          DataColumn(label: Text('Количество')),
          DataColumn(label: Text('Сумма')),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('Техника')),
            DataCell(Text('25')),
            DataCell(Text('1,200,000 ₽')),
          ]),
          DataRow(cells: [
            DataCell(Text('Продукты')),
            DataCell(Text('100')),
            DataCell(Text('600,000 ₽')),
          ]),
        ],
      ),
    );
  }
}

class TransportScreen extends StatelessWidget {
  const TransportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      title: 'Перевозка',
      child: DataTableWidget(
        columns: const [
          DataColumn(label: Text('Маршрут')),
          DataColumn(label: Text('Расстояние')),
          DataColumn(label: Text('Стоимость')),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('Москва - СПб')),
            DataCell(Text('700 км')),
            DataCell(Text('15,000 ₽')),
          ]),
          DataRow(cells: [
            DataCell(Text('Казань - Уфа')),
            DataCell(Text('500 км')),
            DataCell(Text('10,000 ₽')),
          ]),
        ],
      ),
    );
  }
}
