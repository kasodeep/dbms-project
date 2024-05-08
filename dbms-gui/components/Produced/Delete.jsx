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
  producedId: z.string(),
})

export default function Delete() {
  const { toast } = useToast()

  const form = useForm({
    resolver: zodResolver(FormSchema),
    defaultValues: {
      producedId: '',
    },
  })

  async function onSubmit(data) {
    data.producedId = parseInt(data.producedId)

    const postData = {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        producedId: data.producedId,
      }),
    }

    const res = await fetch('http://localhost:3000/api/Produced', postData)
    const response = await res.json()
    if (response.response.message !== 'error') {
      toast({
        title: 'Produced Deleted!',
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
        {/* worker_id */}
        <FormField
          control={form.control}
          name="producedId"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Produced ID</FormLabel>
              <FormControl>
                <Input placeholder="1" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />

        <Button type="submit" className="mt-2">
          Delete Produced
        </Button>
      </form>
    </Form>
  )
}
