
import {
    FilterIcon,
    TrashIcon,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import {
    Menu,
    MenuGroup,
    MenuGroupLabel,
    MenuItem,
    MenuPopup,
    MenuRadioGroup,
    MenuRadioItem,
    MenuSeparator,
    MenuShortcut,
    MenuTrigger,
} from "@/components/ui/menu";
import { Input } from "@/components/ui/input";

export default function Filter() {
    return (
        <div className="flex items-center gap-2 justify-between">
            <div className="col-span-full sm:col-span-3">
                <Input
                    type="text"
                    id="first-name"
                    name="first-name"
                    placeholder="Search catalogue"
                    className="w-80  focus-visible:ring-0" />
            </div>

            <div className="flex items-center gap-2 ">
                <Menu>
                    <MenuTrigger render={<Button size={"sm"} variant="secondary" />}><FilterIcon /> Sort</MenuTrigger>
                    <MenuPopup align="start">
                        <MenuGroup>
                            <MenuGroupLabel>Status</MenuGroupLabel>
                            <MenuRadioGroup>
                                <MenuRadioItem value="processing">Processing</MenuRadioItem>
                                <MenuRadioItem value="completed">Completed</MenuRadioItem>
                                <MenuRadioItem value="failed">Failed</MenuRadioItem>
                            </MenuRadioGroup>
                        </MenuGroup>
                        <MenuSeparator />
                        <MenuGroup>
                            <MenuGroupLabel>Sort by</MenuGroupLabel>
                            <MenuRadioGroup>
                                <MenuRadioItem value="ascending">Ascending</MenuRadioItem>
                                <MenuRadioItem value="descending">Descending</MenuRadioItem>
                            </MenuRadioGroup>
                        </MenuGroup>
                        <MenuSeparator />
                        <MenuItem variant="destructive">
                            <TrashIcon />
                            Delete
                            <MenuShortcut>⌘⌫</MenuShortcut>
                        </MenuItem>
                    </MenuPopup>
                </Menu>
            </div>
        </div>
    );
}
