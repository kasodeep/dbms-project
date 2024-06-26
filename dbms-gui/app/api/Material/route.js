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
      const { identifier, rate, quantity } = await req.json()
      const addMaterial = await query({
         query: "INSERT INTO Material (identifier, rate, quantity) VALUES (?, ?, ?)",
         values: [identifier, rate, quantity],
      });

      const materialId = addMaterial.insertId;
      const message = materialId ? "success" : "error";

      const material = { id: materialId, identifier, rate, quantity };
      return NextResponse.json({ response: { message, material } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function PUT(req, res) {
   try {
      const { id, identifier, rate, quantity } = await req.json()
      const updateMaterial = await query({
         query: "UPDATE Material SET identifier = ?, rate = ?, quantity = ? WHERE id = ?",
         values: [identifier, rate, quantity, id],
      });

      const result = updateMaterial.affectedRows;
      const message = result ? "success" : "error";

      const material = { id, identifier, rate, quantity };
      return NextResponse.json({ response: { message, material } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}

export async function DELETE(req, res) {
   try {
      const { materialId } = await req.json()
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
