import { query } from "@/lib/db";
import { NextResponse } from "next/server";

export async function POST(req, res) {
   const { id } = await req.json()
   try {
      const address = await query({
         query: "SELECT * FROM Address WHERE address_id = ?",
         values: [id],
      });

      return NextResponse.json({ response: { address } });
   } catch (error) {
      return NextResponse.json({ response: { message: "error", error: error.message } });
   }
}
