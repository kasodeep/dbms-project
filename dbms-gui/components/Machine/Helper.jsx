'use client'

import React, { useEffect, useState } from 'react'
import Update from './Update'
import { useToast } from '../ui/use-toast'

const Helper = () => {
  const [machine, setMachine] = useState(null)
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
        'http://localhost:3000/api/Machine/single',
        postData
      )
      const response = await res.json()
      return response.response.machine
    } catch (error) {
      toast({
        title: 'Error fetching machine data',
        status: 'error',
      })
    }
  }

  useEffect(() => {
    const id = prompt('Please enter the id:')
    const fetchData = async () => {
      setMachine(await getData(id))
    }
    fetchData()
  }, [])

  return machine ? (
    <Update machine={machine} />
  ) : (
    <span className="text-xl w-full mx-auto">Loading</span>
  )
}

export default Helper
