import 'package:flutter/material.dart';

class OrderDetailScreen extends StatefulWidget {
  OrderDetailScreen({super.key, this.orderId, this.ticketType,this.ticket});
  String? orderId;
  String? ticketType;
  String? ticket;

  @override
  State<OrderDetailScreen> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ORDER DETAIL"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("OrdrId :${widget.orderId}"),
            Text("TicketType :${widget.ticketType}"),
            Image.network(
              widget.ticket ?? ""
            )
          ],
        ),
      ),
    );
  }
}
