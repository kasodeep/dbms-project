'use client'

import React, { useEffect, useState } from 'react'
import { useToast } from '../ui/use-toast'
import { Data } from '../Data'

const Read = () => {
  const [data, setData] = useState(null)
  const { toast } = useToast()

  const columns = [
    {
      accessorKey: 'identifier',
      header: 'Identifier',
    },
    {
      accessorKey: 'quantity',
      header: 'Quantity',
    },
    {
      accessorKey: 'rate',
      header: 'Rate',
    },
  ]

  const getData = async () => {
    try {
      const res = await fetch('http://localhost:3000/api/Inventory/')
      const response = await res.json()
      return response.response
    } catch (error) {
      toast({
        title: 'Error fetching inventory data',
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
