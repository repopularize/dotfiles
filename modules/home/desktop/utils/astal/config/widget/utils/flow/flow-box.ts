import { Gtk, astalify, type ConstructProps } from "astal/gtk3"
import GObject from "gi://GObject"

export class FlowBox extends astalify(Gtk.FlowBox) {
    static { GObject.registerClass(this) }
    constructor(props: ConstructProps<
        FlowBox,
        Gtk.FlowBox.ConstructorProps,
        { onSelectedChildrenChanged:[] } // signals TODO: Add signals if needed
    >) {
        super(props as any)
    }
}