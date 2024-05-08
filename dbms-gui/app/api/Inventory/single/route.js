import { query } from "@/lib/db";
import { NextResponse } from "next/server";

export async function POST(req, res) {
   const { id } = await req.json()
   try {
      const inventory = await query({
         query: "SELECT * FROM Inventory WHERE identifier = ?",
         values: [id],
      });
      return NextResponse.json({ response: { inventory } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}