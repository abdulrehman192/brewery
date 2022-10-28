import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'network.dart';

class ApiProvider extends BaseApiProvider
{
  final _dio = Dio();

  @override
  Future<dynamic> get({required String url, Map<String, dynamic>? queryParameters }) async
  {
    dynamic response;
    try {
         response = _dio.get(
          url,
          queryParameters: queryParameters,
          onReceiveProgress: (x, y) {
            debugPrint(
                "Progress : ${((x / y) * 100).roundToDouble().toStringAsFixed(
                    2)} %");
          }
      );
    }
    on SocketException
    {
      throw FetchDataException("No Internet Connection");
    }
    return response;
  }

  @override
  Future<dynamic> post({required String url, Map<String, dynamic>? queryParameters, dynamic data }) async
  {
    dynamic response;
    try {
     response = _dio.post(
        url,
        queryParameters: queryParameters,
        data: data,
        onReceiveProgress: (x,y)
        {
          debugPrint("Progress : ${((x/y)*100).roundToDouble().toStringAsFixed(2)} %");
        }
    );
    }
    on SocketException
    {
      throw FetchDataException("No Internet Connection");
    }
    return response;
  }

  @override
  Future<dynamic> put({required String url, Map<String, dynamic>? queryParameters, dynamic data }) async
  {
    dynamic response;
    try {
     response = _dio.put(
        url,
        queryParameters: queryParameters,
        data: data,
        onReceiveProgress: (x,y)
        {
          debugPrint("Progress : ${((x/y)*100).roundToDouble().toStringAsFixed(2)} %");
        }
    );
    }
    on SocketException
    {
      throw FetchDataException("No Internet Connection");
    }
    return response;
  }

  @override
  Future<dynamic> patch({required String url, Map<String, dynamic>? queryParameters, dynamic data }) async
  {
    dynamic response;
    try {
     response = _dio.patch(
      url,
        queryParameters: queryParameters,
        data: data,
        onReceiveProgress: (x,y)
        {
          debugPrint("Progress : ${((x/y)*100).roundToDouble().toStringAsFixed(2)} %");
        }
    );
    }
    on SocketException
    {
      throw FetchDataException("No Internet Connection");
    }
    return response;
  }

  @override
  Future<dynamic> delete({required String url, Map<String, dynamic>? queryParameters, dynamic data }) async
  {
    dynamic response;
    try {
      response = _dio.delete(
        url,
        queryParameters: queryParameters,
        data: data,
    );
    }
    on SocketException
    {
      throw FetchDataException("No Internet Connection");
    }
    return response;
  }

  returnResponse(Response response)
  {
    switch(response.statusCode)
    {
      case 200:
        return response.data;
      case 400:
        throw BadRequestException(response.data);
      case 404:
        throw UnauthorisedException(response.data);
      default:
        throw Exception("Error while communication with api, status code : ${response.statusCode}");
    }
  }


}