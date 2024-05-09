'use client'

import React, { useEffect, useState } from 'react'
import { useToast } from '../ui/use-toast'
import { Data } from '../Data'

const Read = () => {
  const [data, setData] = useState(null)
  const { toast } = useToast()

  const columns = [
    {
      accessorKey: 'id',
      header: 'ID',
    },
    {
      accessorKey: 'identifier',
      header: 'Identifier',
    },
    {
      accessorKey: 'purchase_date',
      header: 'Purchase Date',
    },
    {
      accessorKey: 'rate',
      header: 'Rate',
    },
    {
      accessorKey: 'quantity',
      header: 'Quantity',
    },
  ]

  const getData = async () => {
    try {
      const res = await fetch('http://localhost:3000/api/Material/')
      const response = await res.json()
      return response.response
    } catch (error) {
      toast({
        title: 'Error fetching material data',
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
