part of 'api_fetch_data_bloc.dart';

sealed class ApiFetchDataState extends Equatable {
  const ApiFetchDataState();

  @override
  List<Object> get props => [];
}

final class ApiFetchDataInitial extends ApiFetchDataState {

  @override
  List<Object> get props => [];
}

class ApiFetchDataLoading extends ApiFetchDataState {}

class ApiDtatLooaded extends ApiFetchDataState
{
  final List products;

  const ApiDtatLooaded(this.products);

  @override
  List<Object> get props => [products];
}

class ApiErrorFetchData extends ApiFetchDataState
{
  final String message;

  const ApiErrorFetchData(this.message);

  @override
  List<Object> get props => [message];
}
