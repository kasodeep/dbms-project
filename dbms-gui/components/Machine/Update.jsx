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
  identifier: z.enum(['DESIGN', 'PLAIN']),
  capacity: z.string(),
  worker_id: z.string(),
})

export default function Update({ machine }) {
  const { toast } = useToast()
  const router = useRouter()

  const form = useForm({
    resolver: zodResolver(FormSchema),
    defaultValues: {
      identifier: machine[0].identifier,
      capacity: String(machine[0].capacity),
      worker_id: String(machine[0].worker_id),
    },
  })

  // main function.
  async function onSubmit(data) {
    const postData = {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        machineId: machine[0].id,
        identifier: data.identifier,
        worker_id: data.worker_id,
        capacity: data.capacity,
      }),
    }

    const res = await fetch('http://localhost:3000/api/Machine', postData)
    const response = await res.json()
    if (response.response.message !== 'error') {
      toast({
        title: 'Machine Updated!',
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
        {/* type. */}
        <FormField
          control={form.control}
          name="identifier"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Type</FormLabel>
              <Select onValueChange={field.onChange} defaultValue={field.value}>
                <FormControl>
                  <SelectTrigger>
                    <SelectValue placeholder="Select Type" />
                  </SelectTrigger>
                </FormControl>
                <SelectContent>
                  <SelectItem value="DESIGN">Design</SelectItem>
                  <SelectItem value="PLAIN">Plain</SelectItem>
                </SelectContent>
              </Select>
              <FormMessage />
            </FormItem>
          )}
        />

        {/* capacity. */}
        <FormField
          control={form.control}
          name="capacity"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Capacity</FormLabel>
              <FormControl>
                <Input placeholder="123" type="number" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />

        {/* worker_id */}
        <FormField
          control={form.control}
          name="worker_id"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Worker ID</FormLabel>
              <FormControl>
                <Input placeholder="1" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />

        <Button type="submit" className="mt-2">
          Update Machine
        </Button>
      </form>
    </Form>
  )
}
