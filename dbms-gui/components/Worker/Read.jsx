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
      accessorKey: 'age',
      header: 'Age',
    },
    {
      accessorKey: 'name',
      header: 'Name',
    },
    {
      accessorKey: 'aadharNo',
      header: 'Aadhar No',
    },
    {
      accessorKey: 'gender',
      header: 'Gender',
    },
    {
      accessorKey: 'address_id',
      header: 'Address ID',
    },
  ]

  const getData = async () => {
    try {
      const res = await fetch('http://localhost:3000/api/Worker/')
      const response = await res.json()
      return response.response
    } catch (error) {
      toast({
        title: 'Error fetching worker data',
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
