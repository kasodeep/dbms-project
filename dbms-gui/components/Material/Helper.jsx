'use client'

import React, { useEffect, useState } from 'react'
import Update from './Update'
import { useToast } from '../ui/use-toast'

const Helper = () => {
  const [material, setMaterial] = useState(null)
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
        'http://localhost:3000/api/Material/single',
        postData
      )
      const response = await res.json()
      return response.response.material
    } catch (error) {
      toast({
        title: 'Error fetching material data',
        status: 'error',
      })
    }
  }

  useEffect(() => {
    const id = prompt('Please enter the id:')
    const fetchData = async () => {
      setMaterial(await getData(id))
    }

    fetchData()
  }, [])

  return material ? (
    <Update material={material} />
  ) : (
    <span className="text-xl  w-full mx-auto">Loading</span>
  )
}

export default Helper
