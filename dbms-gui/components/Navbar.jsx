'use client'

import Link from 'next/link'
import { Button } from './ui/button'
import { tables } from '@/constants'
import { usePathname } from 'next/navigation'

const Navbar = () => {
  const pathName = usePathname()

  return (
    <nav className="flex mx-2 my-2 p-2 items-center justify-between border-2 shadow-md shadow-gray-700 rounded-lg">
      {tables.map((table) => {
        return (
          <Link href={table} key={table}>
            <Button
              variant={`${'/' + table === pathName ? 'default' : 'link'}`}
            >
              {table}
            </Button>
          </Link>
        )
      })}
    </nav>
  )
}

export default Navbar
