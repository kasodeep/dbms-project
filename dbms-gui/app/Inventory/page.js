import Delete from "@/components/Inventory/Delete"
import Helper from "@/components/Inventory/Helper"
import {
   Tabs,
   TabsContent,
   TabsList,
   TabsTrigger,
} from "@/components/ui/tabs"

export default function Inventory() {

   return (
      <Tabs defaultValue="read" className="w-[700px] mx-auto border-2 shadow-lg shadow-gray-700 rounded-md">
         <TabsList className="grid w-full grid-cols-3 px-2 py-2 mx-auto">
            <TabsTrigger value="read">Read</TabsTrigger>
            <TabsTrigger value="update">Update</TabsTrigger>
            <TabsTrigger value="delete">Delete</TabsTrigger>
         </TabsList>
         <div className="mx-auto">
            <TabsContent value="read">
               Read
            </TabsContent>
            <TabsContent value="update">
               <Helper />
            </TabsContent>
            <TabsContent value="delete">
               <Delete />
            </TabsContent>
         </div>
      </Tabs>
   )
}
