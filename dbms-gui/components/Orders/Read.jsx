'use client'

import React, { useEffect, useState } from "react";
import jsPDF from "jspdf";
import { useToast } from "../ui/use-toast";
import { Data } from "../Data";

const Read = () => {
  const [originalData, setOriginalData] = useState(null);
  const [data, setData] = useState(null);
  const [searchQuery, setSearchQuery] = useState("");
  const { toast } = useToast();

  const columns = [
    {
      accessorKey: "bill_no",
      header: "Bill No",
    },
    {
      accessorKey: "identifier",
      header: "Identifier",
    },
    {
      accessorKey: "order_date",
      header: "Order Date",
    },
    {
      accessorKey: "isPaymentDone",
      header: "Payment Done",
    },
    {
      accessorKey: "customer_id",
      header: "Customer ID",
    },
    {
      accessorKey: "quantity",
      header: "Quantity",
    },
    {
      accessorKey: "amount",
      header: "Amount",
    },
  ];

  const getData = async () => {
    try {
      const res = await fetch("http://localhost:3000/api/Orders/");
      const response = await res.json();

      const formattedData = response.response.map((res) => {
        res.isPaymentDone = res.isPaymentDone === 0 ? "False" : "True";
        return res;
      });
      setOriginalData(formattedData);
      setData(formattedData);
    } catch (error) {
      toast({
        title: "Error fetching orders data",
        status: "error",
      });
    }
  };

  useEffect(() => {
    getData();
  }, []);

  const handleSearch = (event) => {
    const query = event.target.value.toLowerCase();
    setSearchQuery(query);
    const filteredData = originalData.filter((item) => {
      return (
        item.bill_no.toString().toLowerCase().includes(query) ||
        item.identifier.toLowerCase().includes(query) ||
        item.order_date.toLowerCase().includes(query) ||
        (item.isPaymentDone === "True" || item.isPaymentDone === "False"
          ? item.isPaymentDone.toLowerCase().includes(query)
          : false) ||
        item.customer_id.toString().toLowerCase().includes(query) ||
        item.quantity.toString().toLowerCase().includes(query) ||
        item.amount.toString().toLowerCase().includes(query)
      );
    });
    setData(filteredData);
  };

  const handleReset = () => {
    setSearchQuery("");
    setData(originalData);
  };

const handleGeneratePDF = () => {
  const billNo = prompt("Enter Bill Number:");
  if (billNo && data) {
    const billData = data.find((item) => item.bill_no === billNo.toUpperCase());
    if (billData) {
      const doc = new jsPDF();
      doc.setFont("helvetica");
      doc.setFontSize(12);

      // Title
      doc.setTextColor(0, 0, 255);
      doc.text("Invoice", 10, 10);
      doc.setTextColor(0);

      // Bill details
      doc.text(`Bill No: ${billData.bill_no}`, 10, 20);
      doc.text(`Order Date: ${billData.order_date}`, 10, 30);
      doc.text(`Customer ID: ${billData.customer_id}`, 10, 40);

      // Line items
      let y = 50;
      doc.setTextColor(0);
      doc.setFont("helvetica", "bold"); // Set font weight to bold
      doc.text("Item", 10, y);
      doc.text("Quantity", 70, y);
      doc.text("Amount", 120, y);
      doc.setFont("helvetica", "normal"); // Reset font weight

      y += 10;
      doc.text(`${billData.identifier}`, 10, y);
      doc.text(`${billData.quantity}`, 70, y);
      doc.text(`${billData.amount}`, 120, y);

      // Total
      // const total = parseFloat(billData.amount);
      doc.setFont("helvetica", "bold"); // Set font weight to bold
      doc.text(`Total: ${billData.amount}`, 120, y + 10);

      doc.save(`Bill_${billData.bill_no}.pdf`);
    } else {
      toast({
        title: "Bill not found",
        status: "error",
      });
    }
  }
};



  return (
    <div className="p-4">
      <div className="flex space-x-4 mb-4">
        <input
          type="text"
          value={searchQuery}
          onChange={handleSearch}
          placeholder="Search..."
          className="border px-2 py-1 rounded-md"
        />
        <button
          onClick={handleReset}
          className="bg-gray-200 px-4 py-2 rounded-md hover:bg-gray-300"
        >
          Reset
        </button>
        <button
          onClick={handleGeneratePDF}
          className="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600"
        >
          Generate PDF for Bill
        </button>
      </div>
      {data ? <Data columns={columns} data={data} /> : "Fetching Data"}
    </div>
  );
};

export default Read;




