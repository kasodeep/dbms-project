'use client'

import React, { useEffect, useState } from 'react'
import Update from './Update'
import { useToast } from '../ui/use-toast'

const Helper = () => {
  const [inventory, setInventory] = useState(null)
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
        'http://localhost:3000/api/Inventory/single',
        postData
      )
      const response = await res.json()
      console.log(response.response)
      return response.response.inventory
    } catch (error) {
      toast({
        title: 'Error fetching inventory data',
        status: 'error',
      })
    }
  }

  useEffect(() => {
    const id = prompt('Please enter the identifier:')
    const fetchData = async () => {
      setInventory(await getData(id))
    }
    fetchData()
  }, [])

  return inventory ? (
    <Update inventory={inventory} />
  ) : (
    <span className="text-xl text-red-600 w-full mx-auto">
      No ID found! Refresh.
    </span>
  )
}

export default Helper
