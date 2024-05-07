import { query } from "@/lib/db";
import { NextResponse } from "next/server";

export async function GET(req, res) {
   try {
      const maintenanceRecords = await query({
         query: "SELECT * FROM Maintenance",
         values: [],
      });

      return NextResponse.json({ response: maintenanceRecords });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function POST(req, res) {
   try {
      const { maintenance_date, cost, machine_id } = req.body;
      const addMaintenance = await query({
         query: "INSERT INTO Maintenance (cost, machine_id) VALUES (?, ?)",
         values: [cost, machine_id],
      });

      const maintenanceId = addMaintenance.insertId;
      const message = maintenanceId ? "success" : "error";

      const maintenanceRecord = { maintenance_id: maintenanceId, maintenance_date, cost, machine_id };
      return NextResponse.json({ response: { message, maintenanceRecord } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function PUT(req, res) {
   try {
      const { maintenanceId, maintenance_date, cost, machine_id } = req.body;
      const updateMaintenance = await query({
         query: "UPDATE Maintenance SET maintenance_date = ?, cost = ?, machine_id = ? WHERE maintenance_id = ?",
         values: [maintenance_date, cost, machine_id, maintenanceId],
      });

      const result = updateMaintenance.affectedRows;
      const message = result ? "success" : "error";

      const maintenanceRecord = { maintenance_id: maintenanceId, maintenance_date, cost, machine_id };
      return NextResponse.json({ response: { message, maintenanceRecord } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function DELETE(req, res) {
   try {
      const maintenanceId = req.body.maintenance_id;
      const deleteMaintenance = await query({
         query: "DELETE FROM Maintenance WHERE maintenance_id = ?",
         values: [maintenanceId],
      });

      const result = deleteMaintenance.affectedRows;
      const message = result ? "success" : "error";
      return NextResponse.json({ response: { message, maintenanceId } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}
