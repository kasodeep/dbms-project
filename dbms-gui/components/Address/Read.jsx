'use client'

import React, { useEffect, useState } from 'react'
import { useToast } from '../ui/use-toast'
import { Data } from '../Data'

const Read = () => {
  const [data, setData] = useState(null)
  const { toast } = useToast()

  const columns = [
    {
      accessorKey: 'address_id',
      header: 'Address ID',
    },
    {
      accessorKey: 'entity_type',
      header: 'Entity Type',
    },
    {
      accessorKey: 'street',
      header: 'Street',
    },
    {
      accessorKey: 'city',
      header: 'City',
    },
    {
      accessorKey: 'postal_code',
      header: 'Postal Code',
    },
  ]

  const getData = async () => {
    try {
      const res = await fetch('http://localhost:3000/api/Address/')
      const response = await res.json()
      return response.response
    } catch (error) {
      toast({
        title: 'Error fetching address data',
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
