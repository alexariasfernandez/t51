import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';

import '../data/models/station.dart';
import 'datetime_utils.dart';

class PdfGenerator {
  static Future<File> generateStationReport(Station station) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Reporte de Estación',
                style: pw.TextStyle(
                  fontSize: 22,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),

              pw.SizedBox(height: 20),

              pw.Text('ID: ${station.info.stationId}'),
              pw.Text('Nombre: ${station.info.name}'),
              pw.Text('Dirección: ${station.info.address}'),
              pw.Text('Capacidad: ${station.info.capacity}'),

              pw.SizedBox(height: 15),

              pw.Text(
                'Bicicletas disponibles: ${station.status.numBikesAvailable}',
              ),
              pw.Text(
                'E-bikes disponibles: ${station.status.numEbikesAvailable}',
              ),
              pw.Text('Total bicicletas: ${station.totalBikes}'),
              pw.Text('Espacios libres: ${station.status.numDocksAvailable}'),

              pw.SizedBox(height: 20),

              pw.Text(
                'Coordenadas:',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.Text('Latitud: ${station.info.lat}'),
              pw.Text('Longitud: ${station.info.lon}'),

              pw.Spacer(),

              pw.Text(
                'Generado el ${DateTime.now()}',
                style: pw.TextStyle(fontSize: 10),
              ),
            ],
          );
        },
      ),
    );

    final directory = await getApplicationDocumentsDirectory();

    final file = File(
      '${directory.path}/station_${station.info.stationId}.pdf',
    );

    await file.writeAsBytes(await pdf.save());
    return file;
  }
}
