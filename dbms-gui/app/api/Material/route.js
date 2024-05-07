import { query } from "@/lib/db";
import { NextResponse } from "next/server";

export async function GET(req, res) {
   try {
      const materials = await query({
         query: "SELECT * FROM Material",
         values: [],
      });
      return NextResponse.json({ response: materials });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function POST(req, res) {
   try {
      const { identifier, purchase_date, rate, quantity } = req.body;
      const addMaterial = await query({
         query: "INSERT INTO Material (identifier, rate, quantity) VALUES (?, ?, ?)",
         values: [identifier, purchase_date, rate, quantity],
      });

      const materialId = addMaterial.insertId;
      const message = materialId ? "success" : "error";

      const material = { id: materialId, identifier, purchase_date, rate, quantity };
      return NextResponse.json({ response: { message, material } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function PUT(req, res) {
   try {
      const { id, identifier, purchase_date, rate, quantity } = req.body;
      const updateMaterial = await query({
         query: "UPDATE Material SET identifier = ?, purchase_date = ?, rate = ?, quantity = ? WHERE id = ?",
         values: [identifier, purchase_date, rate, quantity, id],
      });

      const result = updateMaterial.affectedRows;
      const message = result ? "success" : "error";

      const material = { id, identifier, purchase_date, rate, quantity };
      return NextResponse.json({ response: { message, material } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function DELETE(req, res) {
   try {
      const materialId = req.body.id;
      const deleteMaterial = await query({
         query: "DELETE FROM Material WHERE id = ?",
         values: [materialId],
      });

      const result = deleteMaterial.affectedRows;
      const message = result ? "success" : "error";
      return NextResponse.json({ response: { message, materialId } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}
