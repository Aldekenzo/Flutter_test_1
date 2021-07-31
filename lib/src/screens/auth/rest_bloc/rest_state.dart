part of 'rest_bloc.dart';

@immutable
abstract class RestState {}

class RestInitial extends RestState {}

class RestLoading extends RestState {}

class RestLoaded extends RestState {
  final RestModel rest;
 RestLoaded({required this.rest});
}

class RestFailed extends RestState {
  final String? message;
  
  RestFailed({required this.message});
}