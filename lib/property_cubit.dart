import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homzes/fetch_data.dart';

class PropertyCubit extends Cubit<Map<String, dynamic>> {
  PropertyCubit() : super({'loading': true, 'data': []});

  void fetchProperties() async {
    emit({'loading': true, 'data': state['data']});
    try {
      final properties = await FetchData().fetchFirebase("properties");

      emit({'loading': false, 'data': properties});
    } catch (e) {
      emit({'loading': false, 'data': []});
    }
  }
}
