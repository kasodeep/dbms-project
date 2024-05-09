'use client'

import React, { useEffect, useState } from 'react'
import { useToast } from '../ui/use-toast'
import { Data } from '../Data'

const Read = () => {
  const [data, setData] = useState(null)
  const { toast } = useToast()

  const columns = [
    {
      accessorKey: 'produced_id',
      header: 'ID',
    },
    {
      accessorKey: 'production_date',
      header: 'Production Date',
    },
    {
      accessorKey: 'quantity',
      header: 'Quantity',
    },
    {
      accessorKey: 'identifier',
      header: 'Identifier',
    },
    {
      accessorKey: 'rate',
      header: 'Rate',
    },
    {
      accessorKey: 'worker_id',
      header: 'Worker ID',
    },
  ]

  const getData = async () => {
    try {
      const res = await fetch('http://localhost:3000/api/Produced/')
      const response = await res.json()
      return response.response
    } catch (error) {
      toast({
        title: 'Error fetching produced data',
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
