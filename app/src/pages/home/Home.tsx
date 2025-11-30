import { lazy,  } from "react";
import { Link } from "react-router";
const Stats01 = lazy(() => import("./subcomps/Cards"));
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
} from "@/components/ui/breadcrumb";
import TableFloat from "../catalogue/subcomps/Table";

const Home = () => {
  return (
    <div className="space-y-4 py-4">
      <Breadcrumb>
        <BreadcrumbList>
          <BreadcrumbItem>
            <BreadcrumbLink render={<Link to="/" />}>Home</BreadcrumbLink>
          </BreadcrumbItem>
        </BreadcrumbList>
      </Breadcrumb>
      <Stats01 />
      <TableFloat />
    </div>
  );
};

export default Home;
