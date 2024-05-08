import Create from "@/components/Orders/Create"
import Delete from "@/components/Orders/Delete"
import Helper from "@/components/Orders/Helper"
import {
   Tabs,
   TabsContent,
   TabsList,
   TabsTrigger,
} from "@/components/ui/tabs"

export default function Orders() {

   return (
      <Tabs defaultValue="create" className="w-[700px] mx-auto border-2 shadow-lg shadow-gray-700 rounded-md">
         <TabsList className="grid w-full grid-cols-4 px-2 py-2 mx-auto">
            <TabsTrigger value="create">Create</TabsTrigger>
            <TabsTrigger value="read">Read</TabsTrigger>
            <TabsTrigger value="update">Update</TabsTrigger>
            <TabsTrigger value="delete">Delete</TabsTrigger>
         </TabsList>
         <div className="mx-auto">
            <TabsContent value="create">
               <Create />
            </TabsContent>
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
