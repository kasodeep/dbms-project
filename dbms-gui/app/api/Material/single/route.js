import { query } from "@/lib/db";
import { NextResponse } from "next/server";

export async function POST(req, res) {
   const { id } = await req.json()
   try {
      const material = await query({
         query: "SELECT * FROM Material WHERE id = ?",
         values: [id],
      });
      return NextResponse.json({ response: { material } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}