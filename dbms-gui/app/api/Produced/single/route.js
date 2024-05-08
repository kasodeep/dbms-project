import { query } from "@/lib/db";
import { NextResponse } from "next/server";

export async function POST(req, res) {
   const { id } = await req.json()
   try {
      const produced = await query({
         query: "SELECT * FROM Produced WHERE produced_id = ?",
         values: [id],
      });
      return NextResponse.json({ response: { produced } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}