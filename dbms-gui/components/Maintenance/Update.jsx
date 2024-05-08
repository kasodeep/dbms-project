'use client'

import { zodResolver } from '@hookform/resolvers/zod'
import { useForm } from 'react-hook-form'
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

import { Input } from '@/components/ui/input'
import { useToast } from '@/components/ui/use-toast'

const FormSchema = z.object({
  cost: z.string(),
  machine_id: z.string(),
})

export default function Update({ maintenance }) {
  const { toast } = useToast()

  const form = useForm({
    resolver: zodResolver(FormSchema),
    defaultValues: {
      cost: String(maintenance[0].cost),
      machine_id: String(maintenance[0].machine_id),
    },
  })

  async function onSubmit(data) {
    data.cost = parseInt(data.cost)
    data.machine_id = parseInt(data.machine_id)
    const postData = {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        maintenanceId: maintenance[0].maintenance_id,
        cost: data.cost,
        machine_id: data.machine_id,
      }),
    }

    const res = await fetch('http://localhost:3000/api/Maintenance', postData)
    const response = await res.json()
    if (response.response.message !== 'error') {
      toast({
        title: 'Maintenance Updated!',
      })
    } else {
      toast({
        title: response.response.error,
      })
    }
  }

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="w-2/3 mx-auto">
        <FormField
          control={form.control}
          name="cost"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Cost</FormLabel>
              <FormControl>
                <Input placeholder="10" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />

        <FormField
          control={form.control}
          name="machine_id"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Machine ID</FormLabel>
              <FormControl>
                <Input placeholder="1" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />

        <Button type="submit" className="mt-2">
          Update Maintenance
        </Button>
      </form>
    </Form>
  )
}
