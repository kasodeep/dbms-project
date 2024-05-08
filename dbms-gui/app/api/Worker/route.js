import { query } from "@/lib/db";
import { NextResponse } from "next/server";

export async function GET(req, res) {
   try {
      const workers = await query({
         query: "SELECT * FROM Worker",
         values: [],
      });

      return NextResponse.json({ response: workers });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function POST(req, res) {
   try {
      const { age, name, aadharNo, gender, address_id } = await req.json()
      const addWorker = await query({
         query: "INSERT INTO Worker (age, name, aadharNo, gender, address_id) VALUES (?, ?, ?, ?, ?)",
         values: [age, name, aadharNo, gender, address_id],
      });

      const workerId = addWorker.insertId;
      const message = workerId ? "success" : "error";

      const worker = { id: workerId, age, name, aadharNo, gender, address_id };
      return NextResponse.json({ response: { message, worker } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function PUT(req, res) {
   try {
      const { id, age, name, aadharNo, gender, address_id } = await req.json()
      const updateWorker = await query({
         query: "UPDATE Worker SET age = ?, name = ?, aadharNo = ?, gender = ?, address_id = ? WHERE id = ?",
         values: [age, name, aadharNo, gender, address_id, id],
      });

      const result = updateWorker.affectedRows;
      const message = result ? "success" : "error";

      const worker = { id, age, name, aadharNo, gender, address_id };
      return NextResponse.json({ response: { message, worker } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function DELETE(req, res) {
   try {
      const { workerId } = await req.json()
      const deleteWorker = await query({
         query: "DELETE FROM Worker WHERE id = ?",
         values: [workerId],
      });

      const result = deleteWorker.affectedRows;
      const message = result ? "success" : "error";
      return NextResponse.json({ response: { message, workerId } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}
