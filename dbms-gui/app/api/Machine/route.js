import { query } from "@/lib/db";
import { NextResponse } from "next/server";

export async function GET(req, res) {
   try {
      const machines = await query({
         query: "SELECT * FROM Machine",
         values: [],
      });
      return NextResponse.json({ machines });
   } catch (error) {
      return NextResponse.json({ message: "error", error: error.message });
   }
}

export async function POST(req, res) {
   try {
      const { identifier, capacity, worker_id } = await req.json();
      const addMachine = await query({
         query: "INSERT INTO Machine (identifier, capacity, worker_id) VALUES (?, ?, ?)",
         values: [identifier, capacity, worker_id],
      });

      const machineId = addMachine.insertId;
      const message = machineId ? "success" : "error";

      const machine = { id: machineId, identifier, capacity, worker_id };
      return NextResponse.json({ response: { message, machine } });
   } catch (error) {
      return NextResponse.json({ message: "error", error: error.message });
   }
}

export async function PUT(req, res) {
   try {
      const { machineId, identifier, capacity, worker_id } = await req.json();
      const updateMachine = await query({
         query: "UPDATE Machine SET identifier = ?, capacity = ?, worker_id = ? WHERE id = ?",
         values: [identifier, capacity, worker_id, machineId],
      });

      const result = updateMachine.affectedRows;
      const message = result ? "success" : "error";

      const machine = { id: machineId, identifier, capacity, worker_id };
      return NextResponse.json({ response: { message, machine } });
   } catch (error) {
      return NextResponse.json({ message: "error", error: error.message });
   }
}

export async function DELETE(req, res) {
   try {
      const { machineId } = await req.json();
      const deleteMachine = await query({
         query: "DELETE FROM Machine WHERE id = ?",
         values: [machineId],
      });

      const result = deleteMachine.affectedRows;
      const message = result ? "success" : "error";
      return NextResponse.json({ response: { message, machineId } });
   } catch (error) {
      return NextResponse.json({ message: "error", error: error.message });
   }
}
