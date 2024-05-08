import { query } from "@/lib/db";
import { NextResponse } from "next/server";

export async function POST(req, res) {
   const { id } = await req.json()
   try {
      const maintenance = await query({
         query: "SELECT * FROM Maintenance WHERE maintenance_id = ?",
         values: [id],
      });

      return NextResponse.json({ response: { maintenance } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}