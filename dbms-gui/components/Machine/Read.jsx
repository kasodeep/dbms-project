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
      header: 'Indentifier',
    },
    {
      accessorKey: 'capacity',
      header: 'Capacity',
    },
    {
      accessorKey: 'worker_id',
      header: 'Worker ID',
    },
  ]

  const getData = async () => {
    try {
      const res = await fetch('http://localhost:3000/api/Machine/')
      const response = await res.json()
      return response.response
    } catch (error) {
      toast({
        title: 'Error fetching machine data',
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
