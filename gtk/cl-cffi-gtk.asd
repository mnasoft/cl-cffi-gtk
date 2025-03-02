;;; ----------------------------------------------------------------------------
;;; cl-cffi-gtk.asd
;;;
;;; Copyright (C) 2011 - 2019 Dieter Kaiser
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU Lesser General Public License for Lisp
;;; as published by the Free Software Foundation, either version 3 of the
;;; License, or (at your option) any later version and with a preamble to
;;; the GNU Lesser General Public License that clarifies the terms for use
;;; with Lisp programs and is referred as the LLGPL.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU Lesser General Public License for more details.
;;;
;;; You should have received a copy of the GNU Lesser General Public
;;; License along with this program and the preamble to the Gnu Lesser
;;; General Public License.  If not, see <http://www.gnu.org/licenses/>
;;; and <http://opensource.franz.com/preamble.html>.
;;; ----------------------------------------------------------------------------

(defpackage #:cl-cffi-gtk-system
  (:use #:cl #:asdf))

(in-package #:cl-cffi-gtk-system)

;(defclass gtk-source-file (cl-source-file) ())

;#+sbcl
;(defmethod perform :around ((o compile-op) (s gtk-source-file))
;  (handler-bind ((sb-ext:compiler-note #'muffle-warning))
;    (let ((*compile-print* nil))
;      (call-next-method))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (asdf:load-system 'cl-cffi-gtk-init))

(defsystem :cl-cffi-gtk
;  :default-component-class gtk-source-file
  :name :cl-cffi-gtk
  :version "3.24.4"                     ; Version of the library
  :author "Dieter Kaiser"
  :license "LLGPL"
  :serial t
  :components
  ((:file "gtk.package")
   (:file "gtk.child-properties")

   ;; Gtk+ Core
   (:file "gtk.version")               ; Version Information
   (:file "gtk.enumerations")          ; Standard Enumerations
   (:file "gtk.main-loop")             ; Main event loop, and events
   (:file "gtk.accel-group")           ; Accelerator Groups
   (:file "gtk.accel-map")             ; Loadable keyboard accelerator
   (:file "gtk.selection")             ; Inter-process communication
   (:file "gtk.drag-and-drop")         ; Controlling drag and drop
;   (:file "gtk.stock-item")            ; Stock Items
   (:file "gtk.clipboard")             ; Storing data on clipboards
   (:file "gtk.settings")              ; Sharing settings
   (:file "gtk.bindings")              ; Key bindings for individual widgets
   (:file "gtk.mount-operation")       ; Filesystem utilities

   ;; Interface builder
   (:file "gtk.buildable")             ; GtkBuildable
   (:file "gtk.builder")               ; Build an interface

   ;; Theming in Gtk+
   (:file "gtk.stock-images")          ; Manipulating stock icons
   (:file "gtk.widget-path")           ; Widget path abstraction
   (:file "gtk.style-provider")        ; Interface to provide style information
   (:file "gtk.css-provider")          ; CSS-like styling for widgets
   (:file "gtk.style-context")         ; Rendering UI elements
;   (:file "gtk.theming-engine")        ; Theming renderers
   (:file "gtk.icon-theme")            ; Looking up icons by name
   (:file "gtk.style")                 ; Functions for drawing widget parts
   (:file "gtk.numerable-icon")        ; A GIcon that allows numbered emblems

   ;; Inferfaces
   (:file "atk.implementor-iface")     ; AtkImplementorIface
   (:file "gtk.orientable")            ; Interface for flippable widgets
   (:file "gtk.activatable")           ; Interface for activatable widgets
   (:file "gtk.scrollable")            ; Interface for scrollable widgets
   (:file "gtk.actionable")            ; Interface for widgets that have actions

   ;; Abstract Base Classes
   (:file "gtk.widget")                ; Base class for all widgets
   (:file "gtk.misc")                  ; Base class for alignments
   (:file "gtk.container")             ; GtkContainer
   (:file "gtk.bin")                   ; Container with just one child
   (:file "gtk.range")                 ; Base class for adjustments
   (:file "gtk.menu-shell")            ; Base class for menu objects
   (:file "gtk.im-context")            ; Base class for input contexts

   ;; Layout Containers
   (:file "gtk.box")                   ; Container box
   (:file "gtk.grid")                  ; Pack widgets in a rows and columns
   (:file "gtk.revealer")              ; Hide and show with animation
   (:file "gtk.list-box")              ; A list container
   (:file "gtk.flow-box")              ; Allows reflowing its children
   (:file "gtk.stack")                 ; A stacking container
   (:file "gtk.stack-switcher")        ; A controller for GtkStack
   (:file "gtk.stack-sidebar")         ; An automatic sidebar widget
   (:file "gtk.action-bar")            ; A bar for presenting contextual actions
   (:file "gtk.header-bar")            ; Box with a centered child
   (:file "gtk.overlay")               ; Container which overlays widgets
   (:file "gtk.button-box")            ; Container for arranging buttons
   (:file "gtk.paned")                 ; Two adjustable panes
   (:file "gtk.layout")                ; Infinite scrollable
   (:file "gtk.notebook")              ; Tabbed notebook container
   (:file "gtk.expander")              ; Container which can hide childs
   (:file "gtk.aspect-frame")          ; Constrain childs to a aspect ratio
   (:file "gtk.fixed")                 ; Widgets at fixed coordinates

   ;; Ornaments
   (:file "gtk.separator")             ; Separator widget
   (:file "gtk.frame")                 ; Decorative frame

   ;; Scrolling
   (:file "gtk.scrollbar")             ; GtkScrollbar
   (:file "gtk.scrolled-window")       ; Adds scrollbars

   ;; Windows
   (:file "gtk.window")                ; GtkWindow
   (:file "gtk.dialog")                ; GtkDialog
   (:file "gtk.invisible")             ; GtkInvisible
   (:file "gtk.message-dialog")        ; GtkMessageDialog
   (:file "gtk.window-group")          ; GtkWindowGroup
   (:file "gtk.about-dialog")          ; GtkAboutDialog
   (:file "gtk.assistant")             ; GtkAssistant
   (:file "gtk.offscreen-window")      ; GtkOffscreenWindow

   ;; Display Widgets
   (:file "gtk.label")                 ; GtkLabel
   (:file "gtk.accel-label")           ; GtkAccelLabel
   (:file "gtk.image")                 ; GtkImage
   (:file "gtk.progress-bar")          ; GtkProgessBar
   (:file "gtk.statusbar")             ; GTKStatusbar
   (:file "gtk.level-bar")             ; GtkLevelBar
   (:file "gtk.info-bar")              ; GtkInfoBar
   (:file "gtk.status-icon")           ; GtkStatusIcon
   (:file "gtk.spinner")               ; GtkSpinner

   ;; Buttons and Toggles
   (:file "gtk.button")                ; GtkButton
   (:file "gtk.toggle-button")         ; GtkToggleButton
   (:file "gtk.check-button")          ; GtkCheckButton
   (:file "gtk.radio-button")          ; GtkRadioButton
   (:file "gtk.link-button")           ; GtkLinkButton
   (:file "gtk.menu-button")           ; GtkMenuButton
   (:file "gtk.scale-button")          ; GtkScaleButton
   (:file "gtk.volume-button")         ; GtkVolumeButton
   (:file "gtk.switch")                ; GtkSwitch
   ;; GtkLockButton not implemented
   (:file "gtk.model-button")          ; A button that uses a GAction as model

   ;; Multiline Text Editor
   (:file "gtk.text-attributes")       ; GtkTextAttributes
   (:file "gtk.text-iter")             ; GtkTextIter
   (:file "gtk.text-tag")              ; GtkTextTag
   (:file "gtk.text-mark")             ; GtkTextMark
   (:file "gtk.text-buffer")           ; GtkTextBuffer
   (:file "gtk.text-tag-table")        ; GtkTextTagTable
   (:file "gtk.text-view")             ; GtkTextView

   ;; Tree, List and Icon Grid Widgets
   (:file "gtk.tree-model")            ; Tree interface
   (:file "gtk.cell-layout")           ; Interface for packing cells
   (:file "gtk.tree-sortable")
   (:file "gtk.tree-view-drag-and-drop")
   (:file "gtk.tree-model-sort")       ; GtkTreeModelSort
   (:file "gtk.tree-model-filter")     ; GtkTreeModelFilter
   (:file "gtk.tree-view")             ; Displaying both trees and lists
   (:file "gtk.tree-view-column")      ; Visible column in GtkTreeView
   (:file "gtk.tree-store")            ; Tree-like data structure
   (:file "gtk.tree-selection")        ; Selection object for GtkTreeView
   (:file "gtk.cell-editable")         ; GtkCellEditable
   (:file "gtk.cell-renderer")         ; Object for rendering a cell
   (:file "gtk.cell-renderer-text")    ; Renders text in a cell
   (:file "gtk.cell-renderer-pixbuf")  ; Renders a pixbuf in a cell
   (:file "gtk.cell-renderer-progress"); Renders numbers as progress bars
   (:file "gtk.cell-renderer-accel")   ; Renders a keyboard accelerator
   (:file "gtk.cell-renderer-combo")   ; Renders a combobox in a cell
   (:file "gtk.cell-renderer-spin")    ; Renders a spin button in a cell
   (:file "gtk.cell-renderer-toggle")  ; Renders a toggle button in a cell
   (:file "gtk.cell-renderer-spinner") ; Renders a spinning animation in a cell
   (:file "gtk.cell-area")             ; Laying out GtkCellRenderers
   (:file "gtk.cell-area-box")         ; GtkCellAreaBox
   (:file "gtk.cell-area-context")     ; gtkCellAreaContext
   (:file "gtk.cell-view")             ; Displaying a single row
   (:file "gtk.icon-view")             ; List of icons in a grid
   (:file "gtk.list-store")            ; List-like data structure

   ;; Numeric/Text Data Entry
   (:file "gtk.editable")              ; GtkEditable
   (:file "gtk.entry")                 ; GtkEntry
   (:file "gtk.entry-buffer")          ; GtkEntryBuffer
   (:file "gtk.entry-completion")      ; GtkEntryCompletion
   (:file "gtk.scale")                 ; GtkScale, GtkHScale, GtkVScale
   (:file "gtk.spin-button")           ; GtkSpinButton
   (:file "gtk.search-entry")          ; GtkSearchEntry
   (:file "gtk.search-bar")            ; GtkSearchBar

   ;; Menus, Combo Box, Toolbar
   (:file "gtk.menu-item")             ; Widget used for item in menus
   (:file "gtk.menu")                  ; Menu widget
   (:file "gtk.menu-bar")              ; Subclass for GtkMenuItem widgets
   (:file "gtk.check-menu-item")       ; Menu item with a check box
   (:file "gtk.radio-menu-item")       ; Choice from multiple check menu items
   (:file "gtk.image-menu-item")       ; Menu item with an icon
   (:file "gtk.separator-menu-item")   ; Separator used in menus
   (:file "gtk.tearoff-menu-item")     ; Menu item used to tear off and reattach
   (:file "gtk.combo-box")             ; GtkComboBox
   (:file "gtk.combo-box-text")        ; Simple, text-only combo box
   (:file "gtk.tool-shell")            ; Interface for GtkToolItem
   (:file "gtk.tool-item")             ; GtkToolItem
   (:file "gtk.tool-item-group")       ; GtkToolItemGroup
   (:file "gtk.toolbar")               ; Create bars of buttons
   (:file "gtk.tool-palette")          ; Tool palette with categories
   (:file "gtk.separator-tool-item")   ; Toolbar item that separates groups
   (:file "gtk.tool-button")           ; GtkToolButton
   (:file "gtk.toggle-tool-button")    ; GtkToggleToolButton
   (:file "gtk.radio-tool-button")     ; GtkRadioToolButton
   (:file "gtk.menu-tool-button")      ; GtkMenuToolButton
   (:file "gtk.popover")               ; Context dependent bubbles
   (:file "gtk.popover-menu")          ; Popovers to use as menus

   ;; Selectors
   (:file "gtk.color-chooser")         ; Interface for choosing colors
   (:file "gtk.color-button")          ; Launch a color selection dialog
   (:file "gtk.color-chooser-widget")  ; Widget for choosing colors
   (:file "gtk.color-chooser-dialog")  ; Dialog for choosing colors
   (:file "gtk.color-selection")       ; Widget used to select a color
   (:file "gtk.color-selection-dialog"); Widget used to select a color
   (:file "gtk.hsv")                   ; GtkHSV
   (:file "gtk.file-chooser")          ; File chooser interface
   (:file "gtk.file-chooser-widget")   ; File chooser widget
   (:file "gtk.file-chooser-button")   ; Button to launch a file selection
   (:file "gtk.file-chooser-dialog")   ; File chooser dialog
   (:file "gtk.file-chooser-native"    ; A native file chooser dialog
          :if-feature :gtk-3-20)
   (:file "gtk.file-filter")           ; Selecting a file subset
   (:file "gtk.font-chooser")          ; Interface for displaying fonts
   (:file "gtk.font-button")           ; Button to launch a font chooser dialog
   (:file "gtk.font-chooser-widget")   ; Widget for selecting fonts
   (:file "gtk.font-chooser-dialog")   ; Dialog for selecting fonts
   (:file "gtk.font-selection")        ; Deprecated widget for selecting fonts
   (:file "gtk.font-selection-dialog") ; Deprecated widget for selecting fonts
   (:file "gtk.places-sidebar")        ; Displays frequently-used places

   ;; Miscellaneous
   (:file "gtk.adjustment")            ; Representation of a bounded value
   (:file "gtk.arrow")                 ; Displays an arrow
   (:file "gtk.calendar")              ; Displays a calendar
   (:file "gtk.drawing-area")          ; Custom user interface elements
   (:file "gtk.event-box")             ; Widget used to catch events
   (:file "gtk.handle-box")            ; Widget for detachable window portions
   (:file "gtk.im-context-simple")     ; Table-based input methods
   (:file "gtk.im-multicontext")       ; Multiple, loadable input methods
   (:file "gtk.size-group")            ; Grouping widgets to the same size
   (:file "gtk.tooltip")               ; Add tips to your widgets
   (:file "gtk.viewport")              ; Adapter which makes widgets scrollable

   ;; Cross-process Embedding
   #-win32
   (:file "gtk.plug")                  ; Embedding into other processes
   #-win32
   (:file "gtk.socket")                ; For widgets from other processes

   ;; Recently Used Documents
   (:file "gtk.recent-manager")        ; Managing recently used files
   (:file "gtk.recent-chooser")        ; Displaying recently used files
   (:file "gtk.recent-chooser-dialog") ; Displays recently used files
   (:file "gtk.recent-chooser-menu")   ; Displays recently used files in a menu
   (:file "gtk.recent-chooser-widget") ; Displays recently used files
   (:file "gtk.recent-filter")         ; Selecting recently used files

   ;; Action-based menus and toolbars
   (:file "gtk.action-group")          ; Group of actions
   (:file "gtk.action")                ; GtkAction
   (:file "gtk.toggle-action")         ; GtkToggleAction
   (:file "gtk.radio-action")          ; GtkRadioAction
   (:file "gtk.recent-action")         ; List of recently used files

   ;; Choosing from installed applications
   (:file "gtk.app-chooser")           ; Interface for choosing an application
   (:file "gtk.app-chooser-button")    ; Button to launch an application
   (:file "gtk.app-chooser-dialog")    ; Application chooser dialog
   (:file "gtk.app-chooser-widget")    ; Application chooser widget

   ;; Gestures and event handling
   (:file "gtk.event-controller")       ; Handler of series of events
   (:file "gtk.event-controller-key"    ; Event controller for key events
          :if-feature :gtk-3-24)
   (:file "gtk.event-controller-scroll" ; Event controller for scroll events
          :if-feature :gtk-3-24)
   (:file "gtk.event-controller-motion" ; Event controller for motion events
          :if-feature :gtk-3-24)
   (:file "gtk.gesture")                ; Base class for gestures
   (:file "gtk.gesture-single")         ; Base class for single-touch gestures
   (:file "gtk.gesture-drag")           ; Drag gesture
   (:file "gtk.gesture-long-press")     ; "Press and Hold" gesture
   (:file "gtk.gesture-multi-press")    ; Multipress gesture
   (:file "gtk.gesture-pan")            ; Pan gesture
   (:file "gtk.gesture-swipe")          ; Swipe gesture
   (:file "gtk.gesture-rotate")         ; Rotate gesture
   (:file "gtk.gesture-zoom")           ; Zoom gesture
   (:file "gtk.gesture-stylus"          ; Gesture for stylus input
          :if-feature :gtk-3-24)
   (:file "gtk.pad-controller"          ; Controller for drawing tablet pads
          :if-feature :gtk-3-22)

   ;; Printing
   (:file "gtk.print-operation")       ; High-level Printing API
   (:file "gtk.print-context")         ; Encapsulates context for drawing pages
   (:file "gtk.paper-size")            ; Support for named paper sizes
   (:file "gtk.print-settings")        ; Stores print settings
   (:file "gtk.page-setup")            ; Stores page setup information
   #-win32
   (:file "gtk.print-unix-dialog")     ; A print dialog
   #-win32
   (:file "gtk.page-setup-unix-dialog"); A page setup dialog
   #-win32
   (:file "gtk.printer")               ; Represents a printer
   #-win32
   (:file "gtk.print-job")             ; Represents a print job

   ;; Shortcuts Overview
   (:file "gtk.shortcuts-window"       ; Toplevel which shows help for shortcuts
          :if-feature :gtk-3-20)
   (:file "gtk.shortcuts-section"      ; An app mode in a GtkShortcutsWindow
          :if-feature :gtk-3-20)
   (:file "gtk.shortcuts-group"        ; Represents a group of shortcuts
          :if-feature :gtk-3-20)
   (:file "gtk.shortcuts-shortcut"     ; Represents a keyboard shortcut
          :if-feature :gtk-3-20)

   ;; Application support
   (:file "gtk.application")           ; Application class
   (:file "gtk.application-window")    ; GtkApplicationWindow

   ;; Deprecated
;   (:file "gtk.style")                 ; Functions for drawing widget parts
   (:file "gtk.alignment")             ; GtkAlignment
;   (:file "gtk.resource-files")        ; Routines for handling resource files
   (:file "gtk.table")                 ; Pack widgets in regular patterns
   (:file "gtk.ui-manager")            ; Constructing menus and toolbars

   ;; Lisp
   (:file "gtk.init")
)
  :depends-on (:cl-cffi-gtk-glib
               :cl-cffi-gtk-gobject
               :cl-cffi-gtk-gio
               :cl-cffi-gtk-gdk
               :cl-cffi-gtk-gdk-pixbuf
               :cl-cffi-gtk-pango
               :cl-cffi-gtk-cairo
               :cffi
               :bordeaux-threads
               :iterate
               :trivial-features
               :split-sequence))

;;; --- End of file cl-cffi-gtk.asd --------------------------------------------
