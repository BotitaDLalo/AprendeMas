import 'package:aprende_mas/config/data/data.dart';
import 'package:aprende_mas/config/network/dio_client.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/agenda/event_mapper.dart';
import 'package:aprende_mas/models/agenda/event_model.dart';
import 'package:aprende_mas/repositories/Interface_repos/agenda/event_data_source.dart';

class EventDataSourceImpl implements EventDataSource {
  final storageService = KeyValueStorageServiceImpl();

  @override
  Future<List<Event>> getEvents() async {
    try {
      // Obtén el ID del docente almacenado.
      final id = await storageService.getId();
      const uri = "/EventosAgenda/ObtenerEventos"; // Ruta sin incluir el ID.

      // Realiza la petición GET con el ID como parámetro de consulta.
      final res = await dio.get(uri, queryParameters: {'docenteId': id});

      // Verifica la respuesta en la consola para depuración.
      debugPrint("Respuesta del backend: ${res.data}");

      // Convierte la respuesta a una lista de mapas.
      final List<Map<String, dynamic>> responseList =
          List<Map<String, dynamic>>.from(res.data);

      // Devuelve la lista de eventos mapeada.
      return EventMapper.fromMapList(responseList);
    } catch (e) {
      // Si ocurre un error, lanza una excepción con el mensaje de error.
      throw Exception("Error al obtener eventos: $e");
    }
  }
  
  @override
Future<List<Event>> createEvent(
  String title,
  String description,
  Color color,
  DateTime startDate,
  DateTime endDate,
  int teacherId, {
  List<int>? groupIds,
  List<int>? subjectIds,
}) async {
  try {
    const uri = "/EventosAgenda/CrearEventos";
    final String hexColor = color.value.toRadixString(16).substring(2).toUpperCase();

    // Construir el cuerpo de la solicitud
    final Map<String, dynamic> requestBody = {
      "DocenteId": teacherId,
      "FechaInicio": startDate.toIso8601String(),
      "FechaFinal": endDate.toIso8601String(),
      "Titulo": title,
      "Descripcion": description,
      "Color": hexColor,
      "EventosGrupos": groupIds?.map((id) => {"GrupoId": id}).toList(),
      "EventosMaterias": subjectIds?.map((id) => {"MateriaId": id}).toList(),
    };

    // Realizar la solicitud POST
    final response = await dio.post(uri, data: requestBody);

    // Convertir la respuesta en una lista de eventos
    final resList = List<Map<String, dynamic>>.from(response.data);
    final events = EventMapper.fromMapList(resList);

    return events;
  } catch (e) {
    throw Exception("EventDataSourceImpl post Error al crear un evento: $e");
  }
}

  
  

}

