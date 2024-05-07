import { query } from "@/lib/db";
import { NextResponse } from "next/server";

export async function GET(req, res) {
   try {
      const addresses = await query({
         query: "SELECT * FROM Address",
         values: [],
      });

      return NextResponse.json({ response: addresses });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function POST(req, res) {
   try {
      const { entity_type, street, city, postal_code } = req.body;
      const addAddress = await query({
         query: "INSERT INTO Address (entity_type, street, city, postal_code) VALUES (?, ?, ?, ?)",
         values: [entity_type, street, city, postal_code],
      });

      const addressId = addAddress.insertId;
      const message = addressId ? "success" : "error";

      const address = { address_id: addressId, entity_type, street, city, postal_code };
      return NextResponse.json({ response: { message, address } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function PUT(req, res) {
   try {
      const { addressId, entity_type, street, city, postal_code } = req.body;
      const updateAddress = await query({
         query: "UPDATE Address SET entity_type = ?, street = ?, city = ?, postal_code = ? WHERE address_id = ?",
         values: [entity_type, street, city, postal_code, addressId],
      });

      const result = updateAddress.affectedRows;
      const message = result ? "success" : "error";

      const address = { address_id: addressId, entity_type, street, city, postal_code };
      return NextResponse.json({ response: { message, address } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function DELETE(req, res) {
   try {
      const addressId = req.body.address_id;
      const deleteAddress = await query({
         query: "DELETE FROM Address WHERE address_id = ?",
         values: [addressId],
      });

      const result = deleteAddress.affectedRows;
      const message = result ? "success" : "error";
      return NextResponse.json({ response: { message, addressId } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}
