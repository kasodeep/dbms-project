'use client'

import { zodResolver } from '@hookform/resolvers/zod'
import { useForm } from 'react-hook-form'
import { z } from 'zod'

import { Button } from '@/components/ui/button'
import {
  Form,
  FormControl,
  FormDescription,
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
  bill_no: z.string(),
  identifier: z.string(),
  isPaymentDone: z.string(),
  customer_id: z.string(),
  quantity: z.string(),
  amount: z.string(),
})

export default function Update({ order }) {
  const { toast } = useToast()

  const form = useForm({
    resolver: zodResolver(FormSchema),
    defaultValues: {
      bill_no: order[0]?.bill_no,
      identifier: order[0]?.identifier,
      isPaymentDone: order[0]?.isPaymentDone === true ? 'true' : 'false',
      customer_id: String(order[0]?.customer_id),
      quantity: String(order[0]?.quantity),
      amount: String(order[0]?.amount),
    },
  })

  async function onSubmit(data) {
    data.customer_id = parseInt(data.customer_id)
    data.quantity = parseInt(data.quantity)
    data.amount = parseInt(data.amount)
    data.isPaymentDone = data.isPaymentDone === 'true' ? true : false

    const postData = {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        bill_no: data.bill_no,
        identifier: data.identifier,
        isPaymentDone: data.isPaymentDone,
        customer_id: data.customer_id,
        quantity: data.quantity,
        amount: data.amount,
      }),
    }

    const res = await fetch('http://localhost:3000/api/Orders', postData)
    const response = await res.json()
    console.log(response)
    if (response.response.message !== 'error') {
      toast({
        title: 'Order Updated!',
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
          name="bill_no"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Bill No</FormLabel>
              <FormControl>
                <Input placeholder="B001" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />

        <FormField
          control={form.control}
          name="identifier"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Identifier</FormLabel>
              <FormControl>
                <Input placeholder="PLAIN STRIPES" {...field} />
              </FormControl>
              <FormDescription>
                The identifier must exist in Inventory.
              </FormDescription>
              <FormMessage />
            </FormItem>
          )}
        />

        {/* type. */}
        <FormField
          control={form.control}
          name="isPaymentDone"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Payment Done?</FormLabel>
              <Select onValueChange={field.onChange} defaultValue={field.value}>
                <FormControl>
                  <SelectTrigger>
                    <SelectValue placeholder="Select Type" />
                  </SelectTrigger>
                </FormControl>
                <SelectContent>
                  <SelectItem value="true">Done</SelectItem>
                  <SelectItem value="false">Pending</SelectItem>
                </SelectContent>
              </Select>
              <FormMessage />
            </FormItem>
          )}
        />

        <FormField
          control={form.control}
          name="customer_id"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Cusotmer ID</FormLabel>
              <FormControl>
                <Input placeholder="1" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />

        <FormField
          control={form.control}
          name="quantity"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Quantity</FormLabel>
              <FormControl>
                <Input placeholder="100" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />

        <FormField
          control={form.control}
          name="amount"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Amount</FormLabel>
              <FormControl>
                <Input placeholder="1000" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />

        <Button type="submit" className="mt-2">
          Update Order
        </Button>
      </form>
    </Form>
  )
}
