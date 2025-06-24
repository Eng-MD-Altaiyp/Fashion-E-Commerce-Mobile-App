import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Repository/API-Fetch-Data-Repository.dart';

part 'api_fetch_data_event.dart';

part 'api_fetch_data_state.dart';

class ApiFetchDataBloc extends Bloc<ApiFetchDataEvent, ApiFetchDataState> {
  final String Uri;
  final int Api_Type;
  ApiFetchDataBloc({required this.Uri,required this.Api_Type}) : super(ApiFetchDataInitial()) {
    on<LoadApi>(_onLoadApiData);
    on<GetNewSearch>(_onEnsertNameForSearch);
    add(LoadApi(uri_api: Uri,api_type: Api_Type));
  }
}

APIFetchDataRepository Data = APIFetchDataRepository();

Future<void> _onLoadApiData(
    LoadApi event, Emitter<ApiFetchDataState> emit) async {
  emit(ApiFetchDataLoading());
  try {
    final productsData;
    if(event.api_type == 1)
      {
        productsData = await Data.fetchProductsFromApi(event.uri_api);
        emit(ApiDtatLooaded(productsData));
      }
    else if(event.api_type == 2)
      {
        productsData = await Data.GetDataDummyJson(event.uri_api);
        emit(ApiDtatLooaded(productsData));
      }


  } catch (e) {
    emit(ApiErrorFetchData("فشل في تحميل البيانات: ${e.toString()}"));
  }
}

Future<void> _onEnsertNameForSearch(GetNewSearch event, Emitter<ApiFetchDataState> emit) async
{
  emit(ApiFetchDataLoading());
  try {
    final productsData;
    productsData = await Data.GetDataDummyJson(event.uri_api);
    emit(ApiDtatLooaded(productsData));

  } catch (e) {
    emit(ApiErrorFetchData("فشل في تحميل البيانات: ${e.toString()}"));
  }

}