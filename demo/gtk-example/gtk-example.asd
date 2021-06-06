;;;; gtk-example.asd

(asdf:defsystem :gtk-example
  :author "Dieter Kaiser"
  :license "LLGPL"
  :serial t
  :depends-on (:cl-cffi-gtk :split-sequence)
  :components ((:file "gtk-example")
               (:file "utils")
               (:file "alignment")
               (:file "alignment-new")
               (:file "application-simple")
               (:file "aspect-frame")                  ; Layout Widgets
               (:file "bloat-pad")
               (:file "box-packing")                   ; Packing Widgets
               (:file "box-simple")                    ; Packing Widgets
               (:file "button-box")                    ; Layout Widgets
               (:file "button-image")                  ; Button Widgets
               (:file "button-more")                   ; Button Widgets
               (:file "color-button")
               (:file "color-button-label")            ; Selecting Colors, ...
               (:file "color-chooser-dialog")          ; Selecting Colors, ...
               (:file "cell-renderer-properties")      ; Tree and List Widgets
               (:file "clipboard")
               (:file "combo-box")
               (:file "combo-box-text")
               (:file "custom-window")
               (:file "dialog")                        ; Dialog Windows
               (:file "drag-and-drop")
               (:file "drag-and-drop-simple")
               (:file "drawing-area")
               (:file "drawing-area-input")            ; Getting started
               (:file "event-handler")
               (:file "file-chooser-button")           ; Selecting Colors, ...
               (:file "fixed")                         ; Layout Widgets
               (:file "font-button-label")             ; Selecting Colors, ...
               (:file "frame")                         ; Layout Widgets
               (:file "frame-properties")              ; Layout Widgets
               (:file "getting-started")               ; Getting started
               (:file "grab")
               (:file "grid-packing")                  ; Packing Widgets
               (:file "grid-simple")                   ; Packing Widgets
               (:file "grid-spacing")                  ; Packing Widgets
               (:file "hello-world")                   ; Getting started
               (:file "hello-world-upgraded")          ; Getting started
               (:file "hello-world-upgraded-2")        ; Getting started
               (:file "icon-view")                     ; Tree and List Widgets
               (:file "image")                         ; Display Widgets
               (:file "image-button-press")
               (:file "image-menu-item")
               (:file "info-bar")                      ; Display Widgets
               (:file "label")                         ; Display Widgets
               (:file "label-more")                    ; Display Widgets
               (:file "layout")                        ; Layout Widgets
               (:file "level-bar")
               (:file "link-button")                   ; Button Widgets
;               (:file "list-box")
;               (:file "list-store")
               (:file "menu-by-hand")                  ; Menus and Toolbars
               (:file "menu-builder")
               (:file "menu-popup")                    ; Menus and Toolbars
               (:file "message-dialog-new")
               (:file "notebook")                      ; Layout Widgets
               (:file "page-setup-dialog")
               (:file "paned-window")                  ; Layout Widgets
               (:file "pointer-device")
               (:file "progress-bar")                  ; Display Widgets
               (:file "print-dialog")
               (:file "print-operation")
               (:file "query-settings")
               (:file "radio-button")
               (:file "revealer")
               (:file "revealer-icon")
               (:file "scale-button")
               (:file "scale-widget")
               (:file "scrolled-window")
               (:file "show-about-dialog")
               (:file "statusbar")                     ; Display Widgets
               (:file "switch")                        ; Button widgets
               (:file "toggle-buttons")                ; Button Widgets
               (:file "text-view-attributes")          ; Multiline Text Widget
               (:file "text-view-find-next")           ; Multiline Text Widget
               (:file "text-view-insert")              ; Multiline Text Widget
               (:file "text-view-insert-image")        ; Multiline Text Widget
               (:file "text-view-insert-widget")       ; Multiline Text Widget
               (:file "text-view-search")              ; Multiline Text Widget
               (:file "text-view-simple")              ; Multiline Text Widget
               (:file "text-view-tags")                ; Multiline Text Widget
               (:file "text-view-tooltip")             ; Multiline Text Widget
               (:file "tool-palette")
               (:file "toolbar-by-hand")
               (:file "tree-view-path")                ; Tree and List Widgets
               (:file "tree-view-simple")              ; Tree and List Widgets
               (:file "tree-view-example")             ; Tree and List Widgets
               (:file "tree-view-editable")            ; Tree and List Widgets
               (:file "tree-view-sortable")            ; Tree and List Widgets
               (:file "tree-view-dump-model")          ; Tree and List Widgets
               (:file "tree-view-content-type")        ; Tree and List Widgets
               (:file "tree-view-context-menu")        ; Tree and List Widgets
               (:file "tree-view-drag-and-drop")       ; Tree and List Widgets
               (:file "widget-pointer")
               (:file "window-simple")                 ; Getting started
              ))

;;; 2021-6-4
