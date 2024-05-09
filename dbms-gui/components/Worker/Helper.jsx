'use client'

import React, { useEffect, useState } from 'react'
import Update from './Update'
import { useToast } from '../ui/use-toast'

const Helper = () => {
  const [worker, setWorker] = useState(null)
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
        'http://localhost:3000/api/Worker/single',
        postData
      )
      const response = await res.json()
      return response.response.worker
    } catch (error) {
      toast({
        title: 'Error fetching worker data',
        status: 'error',
      })
    }
  }

  useEffect(() => {
    const id = prompt('Please enter the id:')
    const fetchData = async () => {
      setWorker(await getData(id))
    }
    fetchData()
  }, [])

  return worker ? (
    <Update worker={worker} />
  ) : (
    <span className="text-xl w-full mx-auto">Loading</span>
  )
}

export default Helper
