'use client'

import React, { useEffect, useState } from 'react'
import Update from './Update'
import { useToast } from '../ui/use-toast'

const Helper = () => {
  const [maintenance, setMaintenance] = useState(null)
  const { toast } = useToast()

  const getData = async (id) => {
    try {
      const postData = {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          id: id,
        }),
      }

      const res = await fetch(
        'http://localhost:3000/api/Maintenance/single',
        postData
      )
      const response = await res.json()
      return response.response.maintenance
    } catch (error) {
      toast({
        title: 'Error fetching maintenance data',
        status: 'error',
      })
    }
  }

  useEffect(() => {
    const id = prompt('Please enter the id:')
    const fetchData = async () => {
      setMaintenance(await getData(id))
    }
    fetchData()
  }, [])

  return maintenance ? (
    <Update maintenance={maintenance} />
  ) : (
    <span className="text-xl text-red-600 w-full mx-auto">
      No ID found! Refresh.
    </span>
  )
}

export default Helper
