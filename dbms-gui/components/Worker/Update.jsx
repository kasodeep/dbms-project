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

import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'

import { Input } from '@/components/ui/input'
import { useToast } from '@/components/ui/use-toast'

const FormSchema = z.object({
  gender: z.enum(['M', 'F']),
  name: z.string(),
  age: z.string(),
  aadharNo: z.string(),
  address_id: z.string(),
})

export default function Update({ worker }) {
  const { toast } = useToast()

  const form = useForm({
    resolver: zodResolver(FormSchema),
    defaultValues: {
      gender: worker[0].gender,
      name: worker[0].name,
      age: String(worker[0].age),
      aadharNo: String(worker[0].aadharNo),
      address_id: String(worker[0].address_id),
    },
  })

  async function onSubmit(data) {
    data.age = parseInt(data.age)
    data.aadharNo = parseInt(data.aadharNo)
    data.address_id = parseInt(data.address_id)

    const postData = {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        id: worker[0].id,
        gender: data.gender,
        name: data.name,
        age: data.age,
        aadharNo: data.aadharNo,
        address_id: data.address_id,
      }),
    }

    const res = await fetch('http://localhost:3000/api/Worker', postData)
    const response = await res.json()
    if (response.response.message !== 'error') {
      toast({
        title: 'Worker Updated!',
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
          name="name"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Name</FormLabel>
              <FormControl>
                <Input placeholder="Kumar" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />

        <FormField
          control={form.control}
          name="age"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Age</FormLabel>
              <FormControl>
                <Input placeholder="12" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />

        <FormField
          control={form.control}
          name="gender"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Gender</FormLabel>
              <Select onValueChange={field.onChange} defaultValue={field.value}>
                <FormControl>
                  <SelectTrigger>
                    <SelectValue placeholder="Select Type" />
                  </SelectTrigger>
                </FormControl>
                <SelectContent>
                  <SelectItem value="M">Male</SelectItem>
                  <SelectItem value="F">Female</SelectItem>
                </SelectContent>
              </Select>
              <FormMessage />
            </FormItem>
          )}
        />

        <FormField
          control={form.control}
          name="aadharNo"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Aadhar No</FormLabel>
              <FormControl>
                <Input placeholder="203430404359" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />

        <FormField
          control={form.control}
          name="address_id"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Address ID</FormLabel>
              <FormControl>
                <Input placeholder="1" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />

        <Button type="submit" className="mt-2">
          Update Worker
        </Button>
      </form>
    </Form>
  )
}
