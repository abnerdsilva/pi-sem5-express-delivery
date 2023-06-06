import 'dart:convert';

import 'package:express_delivery/shared/model/client.dart';
import 'package:express_delivery/shared/model/product_order.dart';

class OrderDetailsModel {
  final int codPedido;
  final int codCliente;
  final String observacao;
  final String dataPedido;
  final String? dataEntrega;
  final String statusPedido;
  final String tipoPedido;
  final String origem;
  final String? referencia;
  final String? referenciaCurta;
  final String? codPedidoIntegracao;
  final bool agendado;
  final double vrTotal;
  final double vrAdicional;
  final double vrDesconto;
  final Client? client;
  final List<ProductOrder>? itens;

  OrderDetailsModel({
    required this.codPedido,
    required this.observacao,
    required this.dataPedido,
    required this.statusPedido,
    this.client,
    this.itens,
    required this.codCliente,
    this.dataEntrega,
    required this.tipoPedido,
    required this.origem,
    required this.vrTotal,
    this.referencia,
    this.referenciaCurta,
    this.codPedidoIntegracao,
    required this.agendado,
    required this.vrAdicional,
    required this.vrDesconto,
  });

  Map<String, dynamic> toMap() {
    return {
      'codPedido': codPedido,
      'codCliente': codCliente,
      'observacao': observacao,
      'dataPedido': dataPedido,
      'dataEntrega': dataEntrega,
      'statusPedido': statusPedido,
      'tipoPedido': tipoPedido,
      'origem': origem,
      'referencia': referencia,
      'referenciaCurta': referenciaCurta,
      'codPedidoIntegracao': codPedidoIntegracao,
      'agendado': agendado,
      'vrTotal': vrTotal,
      'vrAdicional': vrAdicional,
      'vrDesconto': vrDesconto,
      'cliente': client,
      'itens': itens?.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderDetailsModel.fromMap(Map<String, dynamic> map) {
    return OrderDetailsModel(
      codPedido: map['codPedido'],
      codCliente: map['codCliente'] ?? 0,
      observacao: map['observacao'] ?? '',
      dataPedido: map['dataPedido'] ?? '',
      dataEntrega: map['dataEntrega'] ?? '',
      statusPedido: map['statusPedido'] ?? '',
      tipoPedido: map['tipoPedido'] ?? '',
      origem: map['origem'] ?? '',
      referencia: map['referencia'] ?? '',
      referenciaCurta: map['referenciaCurta'] ?? '',
      codPedidoIntegracao: map['codPedidoIntegracao'] ?? '',
      agendado: map['agendado'] ?? false,
      vrTotal: map['vrTotal'] ?? 0.0,
      vrAdicional: map['vrAdicional'] ?? 0.0,
      vrDesconto: map['vrDesconto'] ?? 0.0,
      client: Client.fromMap(map['cliente']),
      itens: map['item'] != null ? List<ProductOrder>.from(map['item'].map<ProductOrder>((x) => ProductOrder.fromMap(x))) : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderDetailsModel.fromJson(String source) => OrderDetailsModel.fromMap(json.decode(source));
}