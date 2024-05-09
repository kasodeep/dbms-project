'use client'

import React, { useEffect, useState } from 'react'
import { useToast } from '../ui/use-toast'
import { Data } from '../Data'

const Read = () => {
  const [data, setData] = useState(null)
  const { toast } = useToast()

  const columns = [
    {
      accessorKey: 'bill_no',
      header: 'Bill No',
    },
    {
      accessorKey: 'identifier',
      header: 'Identifier',
    },
    {
      accessorKey: 'order_date',
      header: 'Order Date',
    },
    {
      accessorKey: 'isPaymentDone',
      header: 'Payment Done',
    },
    {
      accessorKey: 'customer_id',
      header: 'Customer ID',
    },
    {
      accessorKey: 'quantity',
      header: 'Quantity',
    },
    {
      accessorKey: 'amount',
      header: 'Amount',
    },
  ]

  const getData = async () => {
    try {
      const res = await fetch('http://localhost:3000/api/Orders/')
      const response = await res.json()

      const data = response.response.map((res) => {
        res.isPaymentDone = res.isPaymentDone == 0 ? 'False' : 'True'
        return res
      })
      return data
    } catch (error) {
      toast({
        title: 'Error fetching orders data',
        status: 'error',
      })
    }
  }

  useEffect(() => {
    const fetchData = async () => {
      setData(await getData())
    }
    fetchData()
  }, [])

  return <>{data ? <Data columns={columns} data={data} /> : 'Fetching Data'}</>
}

export default Read
