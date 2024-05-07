"use server"

import { db } from "@/lib/db"

export const getAddress = async () => {
   const allAddress = await db.address.findMany()
   return allAddress
}

export const getCustomers = async () => {
   const allCustomers = await db.customer.findMany()
   return allCustomers
}

export const getInventory = async () => {
   const inventory = await db.inventory.findMany()
   return inventory
}

export const getMachines = async () => {
   const allPosts = await db.machine.findMany()
   return allPosts
}

export const getMaterials = async () => {
   const allMaterials = await db.material.findMany();
   return allMaterials
}

export const getOrders = async () => {
   const allOrders = await db.orders.findMany();
   return allOrders
}

export const getProduced = async () => {
   const produced = await db.produced.findMany();
   return produced
}

export const getWorkers = async () => {
   const allWorkers = await db.worker.findMany();
   return allWorkers
}