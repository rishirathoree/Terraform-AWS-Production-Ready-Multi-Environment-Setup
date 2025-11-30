import React from 'react'
import { DashboardSidebar } from './components/app-sidebar'
import Appnavbar from '@/components/ui/app-navbar'

const Layout = ({ children }: { children: React.ReactNode }) => {
    return (
        <div className='flex justify-between w-11/12 mx-auto h-screen'>
            <div className='w-3/12 '>
                <DashboardSidebar />
            </div>
            <div className='w-full overflow-hidden overflow-y-scroll scrollbar-hidden h-screen '>
                <Appnavbar />
                {children}
                
                </div>
        </div>
    )
}

export default Layout