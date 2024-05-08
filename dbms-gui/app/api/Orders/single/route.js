import { query } from "@/lib/db";
import { NextResponse } from "next/server";

export async function POST(req, res) {
   const { bill_no } = await req.json()
   try {
      const order = await query({
         query: "SELECT * FROM Orders WHERE bill_no = ?",
         values: [bill_no],
      });
      return NextResponse.json({ response: { order } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}