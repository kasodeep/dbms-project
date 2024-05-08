import { query } from "@/lib/db";
import { NextResponse } from "next/server";

export async function GET(req, res) {
   try {
      const producedRecords = await query({
         query: "SELECT * FROM Produced",
         values: [],
      });
      return NextResponse.json({ response: producedRecords });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function POST(req, res) {
   try {
      const { quantity, identifier, rate, worker_id } = await req.json()
      const addProduced = await query({
         query: "INSERT INTO Produced (quantity, identifier, rate, worker_id) VALUES (?, ?, ?, ?)",
         values: [quantity, identifier, rate, worker_id],
      });

      const producedId = addProduced.insertId;
      const message = producedId ? "success" : "error";

      const producedRecord = { produced_id: producedId, production_date, quantity, identifier, rate, worker_id };
      return NextResponse.json({ response: { message, producedRecord } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function PUT(req, res) {
   try {
      const { produced_id, production_date, quantity, identifier, rate, worker_id } = await req.json()
      const updateProduced = await query({
         query: "UPDATE Produced SET production_date = ?, quantity = ?, identifier = ?, rate = ?, worker_id = ? WHERE produced_id = ?",
         values: [production_date, quantity, identifier, rate, worker_id, produced_id],
      });

      const result = updateProduced.affectedRows;
      const message = result ? "success" : "error";

      const producedRecord = { produced_id, production_date, quantity, identifier, rate, worker_id };
      return NextResponse.json({ response: { message, producedRecord } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function DELETE(req, res) {
   try {
      const { producedId } = await req.json()
      const deleteProduced = await query({
         query: "DELETE FROM Produced WHERE produced_id = ?",
         values: [producedId],
      });

      const result = deleteProduced.affectedRows;
      const message = result ? "success" : "error";
      return NextResponse.json({ response: { message, producedId } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}
