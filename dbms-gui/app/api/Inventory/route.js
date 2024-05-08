import { query } from "@/lib/db";
import { NextResponse } from "next/server";

export async function GET(req, res) {
   try {
      const inventoryItems = await query({
         query: "SELECT * FROM Inventory",
         values: [],
      });
      return NextResponse.json({ response: inventoryItems });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function POST(req, res) {
   try {
      const { identifier, quantity, rate } = await req.json()
      const addInventoryItem = await query({
         query: "INSERT INTO Inventory (identifier, quantity, rate) VALUES (?, ?, ?)",
         values: [identifier, quantity, rate],
      });

      const message = addInventoryItem.affectedRows ? "success" : "error";
      const inventoryItem = { identifier, quantity, rate };
      return NextResponse.json({ response: { message, inventoryItem } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function PUT(req, res) {
   try {
      const { identifier, quantity, rate } = await req.json()
      const updateInventoryItem = await query({
         query: "UPDATE Inventory SET quantity = ?, rate = ? WHERE identifier = ?",
         values: [quantity, rate, identifier],
      });

      const message = updateInventoryItem.affectedRows ? "success" : "error";
      const inventoryItem = { identifier, quantity, rate };
      return NextResponse.json({ response: { message, inventoryItem } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function DELETE(req, res) {
   try {
      const { identifier } = await req.json()
      const deleteInventoryItem = await query({
         query: "DELETE FROM Inventory WHERE identifier = ?",
         values: [identifier],
      });

      const message = deleteInventoryItem.affectedRows ? "success" : "error";
      return NextResponse.json({ response: { message, identifier } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}
