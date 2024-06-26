import { query } from "@/lib/db";
import { NextResponse } from "next/server";

export async function GET(req, res) {
   try {
      const orders = await query({
         query: "SELECT * FROM Orders",
         values: [],
      });
      return NextResponse.json({ response: orders });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function POST(req, res) {
   try {
      const { bill_no, identifier, isPaymentDone, customer_id, quantity } = await req.json()
      const addOrder = await query({
         query: "INSERT INTO Orders (bill_no, identifier, isPaymentDone, customer_id, quantity) VALUES (?, ?, ?, ?, ?)",
         values: [bill_no, identifier, isPaymentDone, customer_id, quantity],
      });

      const message = addOrder.affectedRows ? "success" : "error";
      const order = { bill_no, identifier, isPaymentDone, customer_id, quantity };
      return NextResponse.json({ response: { message, order } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function PUT(req, res) {
   try {
      const { bill_no, identifier, isPaymentDone, customer_id, quantity, amount } = await req.json()
      const updateOrder = await query({
         query: "UPDATE Orders SET identifier = ?, isPaymentDone = ?, customer_id = ?, quantity = ?, amount = ? WHERE bill_no = ?",
         values: [identifier, isPaymentDone, customer_id, quantity, amount, bill_no],
      });

      const message = updateOrder.affectedRows ? "success" : "error";
      const order = { bill_no, identifier, isPaymentDone, customer_id, quantity, amount };
      return NextResponse.json({ response: { message, order } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function DELETE(req, res) {
   try {
      const { bill_no } = await req.json()
      const deleteOrder = await query({
         query: "DELETE FROM Orders WHERE bill_no = ?",
         values: [bill_no],
      });

      const message = deleteOrder.affectedRows ? "success" : "error";
      return NextResponse.json({ response: { message, bill_no } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}
