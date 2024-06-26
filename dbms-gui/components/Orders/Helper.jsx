'use client'

import React, { useEffect, useState } from 'react'
import Update from './Update'
import { useToast } from '../ui/use-toast'

const Helper = () => {
  const [order, setOrder] = useState(null)
  const { toast } = useToast()

  const getData = async (id) => {
    try {
      const postData = {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          bill_no: id,
        }),
      }

      const res = await fetch(
        'http://localhost:3000/api/Orders/single',
        postData
      )
      const response = await res.json()
      return response.response.order
    } catch (error) {
      toast({
        title: 'Error fetching order data',
        status: 'error',
      })
    }
  }

  useEffect(() => {
    const id = prompt('Please enter the Bill No:')
    const fetchData = async () => {
      setOrder(await getData(id))
    }
    fetchData()
  }, [])

  return order !== null ? (
    <Update order={order} />
  ) : (
    <span className="text-xl w-full mx-auto">Loading</span>
  )
}

export default Helper
