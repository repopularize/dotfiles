import GObject from "gi://GObject?version=2.0";
import { Gtk, Gdk, Widget, astalify, type ConstructProps } from "astal/gtk3";

export class ListBox extends astalify(Gtk.ListBox) {
  static {
    GObject.registerClass(this);
  }
  
  constructor(props: ConstructProps<ListBox, Gtk.ListBox.ConstructorProps>) {
    super(props as any);
  }
}

export class ListBoxRow extends astalify(Gtk.ListBoxRow) {
    static {
      GObject.registerClass(this);
    }
    
    constructor(props: ConstructProps<ListBoxRow, Gtk.ListBoxRow.ConstructorProps>) {
      super(props as any);
    }
  }
