'use client'

import React, { useEffect, useState } from 'react'
import Update from './Update'
import { useToast } from '../ui/use-toast'

const Helper = () => {
  const [customer, setCustomer] = useState(null)
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
        'http://localhost:3000/api/Customer/single',
        postData
      )
      const response = await res.json()
      return response.response.customer
    } catch (error) {
      toast({
        title: 'Error fetching customer data',
        status: 'error',
      })
    }
  }

  useEffect(() => {
    const id = prompt('Please enter the id:')
    const fetchData = async () => {
      setCustomer(await getData(id))
    }
    fetchData()
  }, [])

  return customer ? (
    <Update customer={customer} />
  ) : (
    <span className="text-xl  w-full mx-auto"></span>
  )
}

export default Helper
