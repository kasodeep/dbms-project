'use client'

import { zodResolver } from '@hookform/resolvers/zod'
import { get, useForm } from 'react-hook-form'
import { z } from 'zod'

import { Button } from '@/components/ui/button'
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from '@/components/ui/form'

import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'

import { Input } from '@/components/ui/input'
import { useToast } from '@/components/ui/use-toast'
import Router from 'next/router'
import { useRouter } from 'next/navigation'

const FormSchema = z.object({
  quantity: z.string(),
  rate: z.string(),
})

export default function Update({ inventory }) {
  const { toast } = useToast()
  const router = useRouter()

  const form = useForm({
    resolver: zodResolver(FormSchema),
    defaultValues: {
      quantity: String(inventory[0].quantity),
      rate: String(inventory[0].rate),
    },
  })

  // main function.
  async function onSubmit(data) {
    data.quantity = parseInt(data.quantity)
    data.rate = parseFloat(data.rate)

    const postData = {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        identifier: inventory[0].identifier,
        quantity: data.quantity,
        rate: data.rate,
      }),
    }

    const res = await fetch('http://localhost:3000/api/Inventory', postData)
    const response = await res.json()
    if (response.response.message !== 'error') {
      toast({
        title: 'Inventory Updated!',
      })
    } else {
      toast({
        title: response.response.error,
      })
    }
    router.refresh()
  }

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="w-2/3 mx-auto">
        <FormField
          control={form.control}
          name="quantity"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Quantity</FormLabel>
              <FormControl>
                <Input placeholder="123" type="number" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />

        <FormField
          control={form.control}
          name="rate"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Rate</FormLabel>
              <FormControl>
                <Input placeholder="100" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />

        <Button type="submit" className="mt-2">
          Update Inventory
        </Button>
      </form>
    </Form>
  )
}
