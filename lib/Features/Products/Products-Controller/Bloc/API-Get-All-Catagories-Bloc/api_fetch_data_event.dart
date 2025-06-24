part of 'api_fetch_data_bloc.dart';

sealed class ApiFetchDataEvent extends Equatable {
  const ApiFetchDataEvent();
}


class LoadApi extends ApiFetchDataEvent{
  final String uri_api;
  final int api_type;
  const LoadApi({required this.uri_api,required this.api_type});

  @override
  List<Object> get props => [];
}
class GetNewSearch extends ApiFetchDataEvent{
  final String uri_api;
  const GetNewSearch({required this.uri_api,});

  @override
  List<Object> get props => [];
}

