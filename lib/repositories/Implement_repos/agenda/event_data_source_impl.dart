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
      final id = await storageService.getId();
      const uri = "/EventosAgenda/ObtenerEventos";
      final res = await dio.get(uri, queryParameters: {'docenteId': id});
      debugPrint("Respuesta del backend: ${res.data}");

      final List<Map<String, dynamic>> responseList =
          List<Map<String, dynamic>>.from(res.data);

      return EventMapper.fromMapList(responseList);
    } catch (e) {
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
    {
    List<int>? groupIds,
    List<int>? subjectIds,
  }) async {
    try {
      const uri = "/EventosAgenda/CrearEventos";
      final String hexColor = color.value.toRadixString(16).substring(2).toUpperCase();
      final teacherId = await storageService.getId();

      final response = await dio.post(uri, data: {
          "DocenteId": teacherId, // Incluimos el ID del docente automáticamente
          "FechaInicio": startDate.toIso8601String(),
          "FechaFinal": endDate.toIso8601String(),
          "Titulo": title,
          "Descripcion": description,
          "Color": hexColor,
          "EventosGrupos": groupIds?.map((id) => {"GrupoId": id}).toList(),
          "EventosMaterias": subjectIds?.map((id) => {"MateriaId": id}).toList(),
        });

      // Convertir la respuesta en una lista de eventos
      final resList = List<Map<String, dynamic>>.from(response.data);
      final events = EventMapper.fromMapList(resList);

      return events;
    } catch (e) {
      throw Exception("EventDataSourceImpl post Error al crear un evento: $e");
    }
  }

    @override
  Future<List<Event>> updateEvent(
    String title, 
    String description,
    Color color, 
    DateTime startDate, 
    DateTime endDate, 
    {List<int>? groupIds, 
    List<int>? subjectIds}) async {
      try {
        final teacherId = await storageService.getId();
        const uri = "/EventosAgenda/ActualizarEvento";
        final String hexColor = color.value.toRadixString(16).substring(2).toUpperCase();
        // final String hexColor1 = color.;

        final response = await dio.put(uri, data: {
          "DocenteId": teacherId,
          "FechaInicio": startDate.toIso8601String(),
          "FechaFinal": endDate.toIso8601String(),
          "Titulo": title,
          "Descripcion": description,
          "Color": hexColor,
          "EventosGrupos": groupIds?.map((id) => {"GrupoId": id}).toList(),
          "EventosMaterias": subjectIds?.map((id) => {"MateriaId": id}).toList(),
        });

        final updatedEvent = EventMapper.fromMapList(response.data);
        return updatedEvent;
      } catch (e) {
        throw Exception("Error en updateEvent: $e");
      }
  }


      @override
  Future<List<Event>> deleteEvent(int teacherId, int eventId) async {
    try {
      final teacherId = await storageService.getId();
      const uri = "/EventosAgenda/EliminarEvento";

      final response = await dio.delete(uri, queryParameters: {
        "docenteId": teacherId,
        "eventoId": eventId,
      });

      final resList = List<Map<String, dynamic>>.from(response.data);
      final events = EventMapper.fromMapList(resList);

      return events;
    } catch (e) {
      throw Exception("Error en deleteEvent: $e");
    }
  }
  
}



// @override
// Future<void> deleteEvent(int teacherId, int eventId) async {
//   try {
//     // Construimos la URI con el ID del evento en la ruta
//     final uri = "/EventosAgenda/EliminarEvento/$eventId";

//     // Obtenemos el ID del docente almacenado para mayor seguridad
//     final storedTeacherId = await storageService.getId();

//     final response = await dio.delete(uri, queryParameters: {
//       'docenteId': storedTeacherId, // Se usa el ID almacenado del docente
//     });

//     if (response.statusCode == 200) {
//       debugPrint("Evento $eventId eliminado correctamente.");
//     } else {
//       throw Exception("Error al eliminar el evento: ${response.data}");
//     }
//   } catch (e) {
//     throw Exception("Error en deleteEvent: $e");
//   }
// }

