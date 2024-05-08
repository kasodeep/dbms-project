import { query } from "@/lib/db";
import { NextResponse } from "next/server";

export async function GET(req, res) {
   try {
      const customers = await query({
         query: "SELECT * FROM Customer",
         values: [],
      });
      return NextResponse.json({ response: customers });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function POST(req, res) {
   try {
      const { company_name, gstin, address_id } = await req.json()
      const addCustomer = await query({
         query: "INSERT INTO Customer (company_name, gstin, address_id) VALUES (?, ?, ?)",
         values: [company_name, gstin, address_id],
      });

      const customerId = addCustomer.insertId;
      const message = customerId ? "success" : "error";

      const customer = { id: customerId, company_name, gstin, address_id };
      return NextResponse.json({ response: { message, customer } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function PUT(req, res) {
   try {
      const { id, company_name, gstin, address_id } = await req.json()
      const updateCustomer = await query({
         query: "UPDATE Customer SET company_name = ?, gstin = ?, address_id = ? WHERE id = ?",
         values: [company_name, gstin, address_id, id],
      });

      const result = updateCustomer.affectedRows;
      const message = result ? "success" : "error";

      const customer = { id, company_name, gstin, address_id };
      return NextResponse.json({ response: { message, customer } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function DELETE(req, res) {
   try {
      const { customerId } = await req.json()
      const deleteCustomer = await query({
         query: "DELETE FROM Customer WHERE id = ?",
         values: [customerId],
      });

      const result = deleteCustomer.affectedRows;
      const message = result ? "success" : "error";
      return NextResponse.json({ response: { message, customerId } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}
