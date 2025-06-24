part of 'api_fetch_data_bloc.dart';

sealed class ApiFetchSearchState extends Equatable {
  const ApiFetchSearchState();

  @override
  List<Object> get props => [];
}

final class ApiFetchDataInitial extends ApiFetchSearchState {

  @override
  List<Object> get props => [];
}

class ApiFetchDataLoading extends ApiFetchSearchState {}

class ApiDataLoaded extends ApiFetchSearchState
{
  final List products;

  const ApiDataLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class ApiErrorFetchData extends ApiFetchSearchState
{
  final String message;

  const ApiErrorFetchData(this.message);

  @override
  List<Object> get props => [message];
}
