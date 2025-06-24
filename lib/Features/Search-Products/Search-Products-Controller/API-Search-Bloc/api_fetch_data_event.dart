part of 'api_fetch_data_bloc.dart';

sealed class ApiFetchSearchEvent extends Equatable {
  const ApiFetchSearchEvent();
}


class LoadApi extends ApiFetchSearchEvent{
  final String uri_api;
  final int api_type;
  const LoadApi({required this.uri_api,required this.api_type});

  @override
  List<Object> get props => [];
}
class GetNewSearch extends ApiFetchSearchEvent{
  final String uri_api;
  const GetNewSearch({required this.uri_api,});

  @override
  List<Object> get props => [];
}

