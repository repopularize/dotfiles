import GObject from "gi://GObject"
import { Gtk, Gdk, Widget, astalify, type ConstructProps } from "astal/gtk3"

export class ListBox extends astalify(Gtk.ListBox) {
    static { GObject.registerClass(this) }

    constructor(props: ConstructProps<
        ListBox,
        Gtk.ListBox.ConstructorProps,
        { onColorSet: [] } // signals of Gtk.ColorButton have to be manually typed
    >) {
        super(props as any)
    }
}


export class ListBoxRow extends astalify(Gtk.ListBoxRow) {
    static { GObject.registerClass(this) }

    constructor(props: ConstructProps<
        ListBoxRow,
        Gtk.ListBoxRow.ConstructorProps,
        { onColorSet: [] } // signals of Gtk.ColorButton have to be manually typed
    >) {
        super(props as any)
    }
}