;;; ----------------------------------------------------------------------------
;;; gtk.message-dialog.lisp
;;;
;;; The documentation of this file is taken from the GTK 3 Reference Manual
;;; Version 3.24 and modified to document the Lisp binding to the GTK library.
;;; See <http://www.gtk.org>. The API documentation of the Lisp binding is
;;; available from <http://www.crategus.com/books/cl-cffi-gtk/>.
;;;
;;; Copyright (C) 2009 - 2011 Kalyanov Dmitry
;;; Copyright (C) 2011 - 2021 Dieter Kaiser
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
;;;
;;; GtkMessageDialog
;;;
;;;     A convenient message window
;;;
;;; Types and Values
;;;
;;;     GtkMessageDialog
;;;     GtkMessageType
;;;     GtkButtonsType
;;;
;;; Functions
;;;
;;;     gtk_message_dialog_new
;;;     gtk_message_dialog_new_with_markup
;;;     gtk_message_dialog_set_markup
;;;     gtk_message_dialog_set_image
;;;     gtk_message_dialog_get_image
;;;     gtk_message_dialog_format_secondary_text
;;;     gtk_message_dialog_format_secondary_markup
;;;     gtk_message_dialog_get_message_area
;;;
;;; Properties
;;;
;;;     GtkButtonsType   buttons                 Write / Construct
;;;          GtkWidget*  image                   Read / Write
;;;          GtkWidget*  message-area            Read
;;;     GtkMessageType   message-type            Read / Write / Construct
;;;              gchar*  secondary-text          Read / Write
;;;           gboolean   secondary-use-markup    Read / Write
;;;              gchar*  text                    Read / Write
;;;           gboolean   use-markup              Read / Write
;;;
;;; Style Properties
;;;
;;;               gint   message-border          Read
;;;
;;; Object Hierarchy
;;;
;;;     GObject
;;;     ╰── GInitiallyUnowned
;;;         ╰── GtkWidget
;;;             ╰── GtkContainer
;;;                 ╰── GtkBin
;;;                     ╰── GtkWindow
;;;                         ╰── GtkDialog
;;;                             ╰── GtkMessageDialog
;;;
;;; Implemented Interfaces
;;;
;;;     GtkMessageDialog implements AtkImplementorIface and GtkBuildable.
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; enum GtkMessageType
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkMessageType" gtk-message-type
  (:export t
   :type-initializer "gtk_message_type_get_type")
  (:info 0)
  (:warning 1)
  (:question 2)
  (:error 3)
  (:other 4))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-message-type atdoc:*symbol-name-alias*)
      "GEnum"
      (gethash 'gtk-message-type atdoc:*external-symbols*)
 "@version{2021-10-4}
  @begin{short}
    The type of message being displayed in the message dialog.
  @end{short}
  @begin{pre}
(define-g-enum \"GtkMessageType\" gtk-message-type
  (:export t
   :type-initializer \"gtk_message_type_get_type\")
  (:info 0)
  (:warning 1)
  (:question 2)
  (:error 3)
  (:other 4))
  @end{pre}
  @begin[code]{table}
    @entry[:info]{Informational message.}
    @entry[:warning]{Nonfatal warning message.}
    @entry[:question]{Question requiring a choice.}
    @entry[:error]{Fatal error message.}
    @entry[:other]{None of the above, does not get an icon.}
  @end{table}
  @see-class{gtk-message-dialog}")

;;; ----------------------------------------------------------------------------
;;; enum GtkButtonsType
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkButtonsType" gtk-buttons-type
  (:export t
   :type-initializer "gtk_buttons_type_get_type")
  (:none 0)
  (:ok 1)
  (:close 2)
  (:cancel 3)
  (:yes-no 4)
  (:ok-cancel 5))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-buttons-type atdoc:*symbol-name-alias*)
      "GEnum"
      (gethash 'gtk-buttons-type atdoc:*external-symbols*)
 "@version{2021-10-4}
  @begin{short}
    Prebuilt sets of buttons for the dialog.
  @end{short}
  If none of these choices are appropriate, simply use the @code{:none} value
  and call the @fun{gtk-dialog-add-buttons} function to add your own buttons.

  Please note that the @code{:ok}, @code{:yes-no} and @code{:ok-cancel} values
  are discouraged by the GNOME Human Interface Guidelines.
  @begin{pre}
(define-g-enum \"GtkButtonsType\" gtk-buttons-type
  (:export t
   :type-initializer \"gtk_buttons_type_get_type\")
  (:none 0)
  (:ok 1)
  (:close 2)
  (:cancel 3)
  (:yes-no 4)
  (:ok-cancel 5))
  @end{pre}
  @begin[code]{table}
    @entry[:none]{No buttons at all.}
    @entry[:ok]{An OK button.}
    @entry[:close]{A Close button.}
    @entry[:cancel]{A Cancel button.}
    @entry[:yes-no]{Yes and No buttons.}
    @entry[:ok-cancel]{OK and Cancel buttons.}
  @end{table}
  @see-class{gtk-message-dialog}
  @see-function{gtk-dialog-add-buttons}")

;;; ----------------------------------------------------------------------------
;;; struct GtkMessageDialog
;;; ----------------------------------------------------------------------------

(define-g-object-class "GtkMessageDialog" gtk-message-dialog
  (:superclass gtk-dialog
   :export t
   :interfaces ("AtkImplementorIface"
                "GtkBuildable")
   :type-initializer "gtk_message_dialog_get_type")
  ((buttons
    gtk-message-dialog-buttons
    "buttons" "GtkButtonsType" nil nil)
   (image
    gtk-message-dialog-image
    "image" "GtkWidget" t t)
   (message-area
    gtk-message-dialog-message-area
    "message-area" "GtkWidget" t nil)
   (message-type
    gtk-message-dialog-message-type
    "message-type" "GtkMessageType" t t)
   (secondary-text
    gtk-message-dialog-secondary-text
    "secondary-text" "gchararray" t t)
   (secondary-use-markup
    gtk-message-dialog-secondary-use-markup
    "secondary-use-markup" "gboolean" t t)
   (text
    gtk-message-dialog-text
    "text" "gchararray" t t)
   (use-markup
    gtk-message-dialog-use-markup
    "use-markup" "gboolean" t t)))

#+cl-cffi-gtk-documentation
(setf (documentation 'gtk-message-dialog 'type)
 "@version{2021-10-4}
  @begin{short}
    A @sym{gtk-message-dialog} widget presents a dialog with some message text.
  @end{short}
  It is simply a convenience widget. You could construct the equivalent of a
  message dialog from a @class{gtk-dialog} widget without too much effort, but
  the @sym{gtk-message-dialog} widget saves typing.

  @image[messagedialog]{}

  One difference from the @class{gtk-dialog} widget is that the message dialog
  sets the @slot[gtk-window]{skip-taskbar-hint} property to @em{true}, so that
  the message dialog is hidden from the taskbar by default.

  The easiest way to do a modal message dialog is to use the
  @fun{gtk-dialog-run} function, though you can also pass in the @code{:modal}
  flag of type @symbol{gtk-dialog-flags}, the @fun{gtk-dialog-run} function
  automatically makes the message dialog modal and waits for the user to respond
  to it. The @fun{gtk-dialog-run} function returns when any message dialog
  button is clicked.
  @begin[Examples]{dictionary}
    A modal message dialog.
    @begin{pre}
(let ((dialog (gtk-message-dialog-new main-window
                                      '(:destroy-with-parent)
                                      :error
                                      :close
                                      \"Error loading file ~s\"
                                      filename)))
  (gtk-dialog-run dialog)
  (gtk-widget-destroy dialog))
    @end{pre}
    You might do a non-modal message dialog as follows.
    @begin{pre}
(let ((dialog (gtk-message-dialog-new main-window
                                      '(:destroy-with-parent)
                                      :error
                                      :close
                                      \"Error loading file ~s\"
                                      filename)))
  ;; Destroy the dialog when the user responds to it
  (g-signal-connect dialog \"response\"
                    (lambda (dialog response-id)
                      (declare (ignore response-id))
                      (gtk-widget-destroy dialog)))
  ... )
    @end{pre}
  @end{dictionary}
  @begin[GtkMessageDialog as GtkBuildable]{dictionary}
    The @sym{gtk-message-dialog} implementation of the @class{gtk-buildable}
    interface exposes the message area as an internal child with the name
    @code{message_area}.
  @end{dictionary}
  @begin[Style Properties]{dictionary}
    @begin[code]{table}
      @begin[message-border]{entry}
        The @code{message-border} style property of type @code{:int} (Read)@br{}
        Width of border around the label and image in the message dialog. @br{}
        Allowed values: >= 0 @br{}
        Default value: 12
      @end{entry}
    @end{table}
  @end{dictionary}
  @see-slot{gtk-message-dialog-buttons}
  @see-slot{gtk-message-dialog-image}
  @see-slot{gtk-message-dialog-message-area}
  @see-slot{gtk-message-dialog-message-type}
  @see-slot{gtk-message-dialog-secondary-text}
  @see-slot{gtk-message-dialog-secondary-use-markup}
  @see-slot{gtk-message-dialog-text}
  @see-slot{gtk-message-dialog-use-markup}
  @see-class{gtk-dialog}")

;;; ----------------------------------------------------------------------------
;;; Property and Accessor Details
;;; ----------------------------------------------------------------------------

;;; --- gtk-message-dialog-buttons ---------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "buttons"
                                               'gtk-message-dialog) 't)
 "The @code{buttons} property of type @symbol{gtk-buttons-type}
  (Write / Construct Only) @br{}
  The buttons shown in the message dialog. @br{}
  @em{Warning:} This property is not accessible from the Lisp binding. @br{}
  Default value: @code{:none}")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-message-dialog-buttons atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-message-dialog-buttons 'function)
 "@version{2021-10-4}
  @begin{short}
    Accessor of the @slot[gtk-message-dialog]{buttons} slot of the
    @class{gtk-message-dialog} class.
  @end{short}
  @begin[Note]{dictionary}
    This property is not accessible from the Lisp binding.
  @end{dictionary}
  @see-class{gtk-message-dialog}")

;;; --- gtk-message-dialog-image -----------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "image" 'gtk-message-dialog) 't)
 "The @code{image} property of type @class{gtk-widget} (Read / Write) @br{}
  The image for the message dialog. @br{}
  @em{Warning:} The @code{image} property has been deprecated since version 3.12
  and should not be used in newly written code. Use the @class{gtk-dialog}
  widget to create dialogs with images.")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-message-dialog-image atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-message-dialog-image 'function)
 "@version{2021-10-4}
  @syntax[]{(gtk-message-dialog-image object) => image}
  @syntax[]{(setf (gtk-message-dialog-image object) image)}
  @argument[object]{a @class{gtk-message-dialog} widget}
  @argument[image]{a @class{gtk-widget} image}
  @begin{short}
    Accessor of the @slot[gtk-message-dialog]{image} slot of the
    @class{gtk-message-dialog} class.
  @end{short}

  The @sym{gtk-message-dialog-image} slot access function returns the image of
  the message dialog. The @sym{(setf gtk-message-dialog-image)} slot access
  function sets the image.
  @begin[Warning]{dictionary}
    The @sym{gtk-message-dialog-image} function has been deprecated since
    version 3.12 and should not be used in newly written code. Use the
    @class{gtk-dialog} widget to create dialogs with images.
  @end{dictionary}
  @see-class{gtk-message-dialog}
  @see-class{gtk-widget}")

;;; --- gtk-message-dialog-message-area ----------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "message-area"
                                               'gtk-message-dialog) 't)
 "The @code{message-area} property of type @class{gtk-widget} (Read) @br{}
  The @class{gtk-box} widget of @code{:vertical} orientation that corresponds
  to the message area of the message dialog. See the
  @fun{gtk-message-dialog-message-area} function for a detailed description of
  the message area.")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-message-dialog-message-area atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-message-dialog-message-area 'function)
 "@version{2021-10-4}
  @syntax[]{(gtk-message-dialog-message-area object) => area}
  @argument[dialog]{a @class{gtk-message-dialog} widget}
  @argument[area]{a @class{gtk-box} widget of @code{:vertical} orientation}
  @begin{short}
    Accessor of the @slot[gtk-message-dialog]{message-area} slot of the
    @class{gtk-message-dialog} class.
  @end{short}

  The @sym{gtk-message-dialog-message-area} slot access function returns the
  @class{gtk-box} widget with @code{:vertical} orientation corresponding to
  the \"message area\" in the message dialog. This is the box where the primary
  and secondary labels of the message dialog are packed.

  You can add your own extra content to that box and it will appear below those
  labels. See the @fun{gtk-dialog-content-area} function for the corresponding
  function in the parent @class{gtk-dialog} class.
  @see-class{gtk-message-dialog}
  @see-class{gtk-box}
  @see-class{gtk-dialog}
  @see-function{gtk-dialog-content-area}")

;;; --- gtk-message-dialog-message-type ----------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "message-type"
                                               'gtk-message-dialog) 't)
 "The @code{message-type} property of type @symbol{gtk-message-type}
  (Read / Write / Construct) @br{}
  The type of the message. The type is used to determine the image that is
  shown in the message dialog, unless the image is explicitly set by the
  @code{image} property. @br{}
  Default value: @code{:info}")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-message-dialog-message-type atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-message-dialog-message-type 'function)
 "@version{2021-10-4}
  @syntax[]{(gtk-message-dialog-message-type object) => type}
  @argument[object]{a @class{gtk-message-dialog} widget}
  @argument[type]{a value of the @symbol{gtk-message-type} enumeration}
  @begin{short}
    Accessor of the @slot[gtk-message-dialog]{message-type} slot of the
    @class{gtk-message-dialog} class.
  @end{short}

  The type of the message. The type is used to determine the image that is
  shown in the message dialog, unless the image is explicitly set by the
  @code{image} property.
  @see-class{gtk-message-dialog}
  @see-symbol{gtk-message-type}")

;;; --- gtk-message-dialog-secondary-text --------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "secondary-text"
                                               'gtk-message-dialog) 't)
 "The @code{secondary-text} property of type @code{:string} (Read / Write) @br{}
  The secondary text of the message dialog. @br{}
  Default value: @code{nil}")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-message-dialog-secondary-text atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-message-dialog-secondary-text 'function)
 "@version{2021-10-4}
  @syntax[]{(gtk-message-dialog-secondary-text object) => text}
  @syntax[]{(setf (gtk-message-dialog-secondary-text object) text)}
  @argument[object]{a @class{gtk-message-dialog} widget}
  @argument[text]{a string with the secondary text of the message dialog}
  @begin{short}
    Accessor of the @slot[gtk-message-dialog]{secondary-text} slot of the
    @class{gtk-message-dialog} class.
  @end{short}

  The secondary text of the message dialog.
  @see-class{gtk-message-dialog}
  @see-function{gtk-message-dialog-format-secondary-text}")

;;; --- gtk-message-dialog-secondary-use-markup --------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "secondary-use-markup"
                                               'gtk-message-dialog) 't)
 "The @code{secondary-use-markup} property of type @code{:boolean}
  (Read / Write) @br{}
  @em{True} if the secondary text of the message dialog includes Pango markup.
  @br{}
  Default value: @em{false}")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-message-dialog-secondary-use-markup
               atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-message-dialog-secondary-use-markup 'function)
 "@version{2021-10-4}
  @syntax[]{(gtk-message-dialog-secondary-use-markup object) => setting}
  @syntax[]{(setf (gtk-message-dialog-secondary-use-markup object) setting)}
  @argument[object]{a @class{gtk-message-dialog} widget}
  @argument[setting]{a boolean whether to use Pango markup}
  @begin{short}
    Accessor of the @slot[gtk-message-dialog]{secondary-use-markup} slot of the
    @class{gtk-message-dialog} class.
  @end{short}

  @em{True} if the secondary text of the message dialog includes Pango markup.
  @see-class{gtk-message-dialog}
  @see-function{gtk-message-dialog-format-secondary-markup}")

;;; --- gtk-message-dialog-text ------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "text" 'gtk-message-dialog) 't)
 "The @code{text} property of type @code{:string} (Read / Write) @br{}
  The primary text of the message dialog. If the dialog has a secondary text,
  this will appear as the title. @br{}
  Default value: \"\"")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-message-dialog-text atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-message-dialog-text 'function)
 "@version{2021-10-4}
  @syntax[]{(gtk-message-dialog-text object) => text}
  @syntax[]{(setf (gtk-message-dialog-text object) text)}
  @argument[object]{a @class{gtk-message-dialog} widget}
  @argument[text]{a string with the primary text of the message dialog}
  @begin{short}
    Accessor of the @slot[gtk-message-dialog]{text} slot of the
    @class{gtk-message-dialog} class.
  @end{short}

  The primary text of the message dialog. If the dialog has a secondary text,
  this will appear as the title.
  @see-class{gtk-message-dialog}")

;;; --- gtk-message-dialog-use-markup ------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "use-markup"
                                               'gtk-message-dialog) 't)
 "The @code{use-markup} property of type @code{:boolean} (Read / Write) @br{}
  @em{True} if the primary text of the message dialog includes Pango markup.
  @br{}
  Default value: @em{false}")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-message-dialog-use-markup atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-message-dialog-use-markup 'function)
 "@version{2021-10-4}
  @syntax[]{(gtk-message-dialog-use-markup object) => setting}
  @syntax[]{(setf (gtk-message-dialog-use-markup object) setting)}
  @argument[object]{a @class{gtk-message-dialog} widget}
  @argument[setting]{a boolean whether to use Pango markup}
  @begin{short}
    Accessor of the @slot[gtk-message-dialog]{use-markup} slot of the
    @class{gtk-message-dialog} class.
  @end{short}

  @em{True} if the primary text of the message dialog includes Pango markup.
  @see-class{gtk-message-dialog}")

;;; ----------------------------------------------------------------------------
;;; gtk_message_dialog_new ()
;;; ----------------------------------------------------------------------------

(defun gtk-message-dialog-new (parent flags type buttons message &rest args)
 #+cl-cffi-gtk-documentation
 "@version{2021-10-4}
  @argument[parent]{transient @class{gtk-window} parent, or @code{nil} for none}
  @argument[flags]{a value of the @symbol{gtk-dialog-flags} flags}
  @argument[type]{a value of the @symbol{gtk-message-type} enumeration for the
    type of the message}
  @argument[buttons]{set of values of the @symbol{gtk-buttons-type} enumeration
    for the buttons to use}
  @argument[message]{format string, or @code{nil}}
  @argument[args]{the arguments for @arg{message}}
  @return{A new @class{gtk-message-dialog} widget.}
  @begin{short}
    Creates a new message dialog, which is a simple dialog with some text the
    user may want to see.
  @end{short}
  When the user clicks a button a \"response\" signal is emitted with response
  IDs from the @symbol{gtk-response-type} enumeration. See the
  @class{gtk-dialog} widget for more details.
  @see-class{gtk-message-dialog}
  @see-class{gtk-dialog}
  @see-class{gtk-window}
  @see-symbol{gtk-dialog-flags}
  @see-symbol{gtk-message-type}
  @see-symbol{gtk-buttons-type}
  @see-symbol{gtk-response-type}"
  (let ((dialog (make-instance 'gtk-message-dialog
                               :message-type type
                               :buttons buttons)))
    (if message
        (setf (gtk-message-dialog-text dialog)
        (apply #'format (cons nil (cons message args)))))
    (if parent
        (setf (gtk-window-transient-for dialog) parent))
    (if (member :modal flags)
        (setf (gtk-window-modal dialog) t))
    (if (member :destroy-with-parent flags)
        (setf (gtk-window-destroy-with-parent dialog) t))
    dialog))

(export 'gtk-message-dialog-new)

;;; ----------------------------------------------------------------------------
;;; gtk_message_dialog_new_with_markup ()
;;; ----------------------------------------------------------------------------

(defun gtk-message-dialog-new-with-markup (parent flags type buttons message
                                           &rest args)
 #+cl-cffi-gtk-documentation
 "@version{2021-10-4}
  @argument[parent]{transient @class{gtk-window} parent, or @code{nil} for none}
  @argument[flags]{flags of type @symbol{gtk-dialog-flags}}
  @argument[type]{type of message of type @symbol{gtk-message-type}}
  @argument[buttons]{set of buttons to use of type @symbol{gtk-buttons-type}}
  @argument[message]{format string, or @code{nil}}
  @argument[args]{the arguments for @arg{message}}
  @return{A new @class{gtk-message-dialog} widget.}
  @begin{short}
    Creates a new message dialog, which is a simple dialog with some text which
    is marked up with the Pango text markup language.
  @end{short}
  When the user clicks a button a \"response\" signal is emitted with response
  IDs from the @symbol{gtk-response-type} enumeration. See the
  @class{gtk-dialog} class for more details.

  Special XML characters in the message arguments passed to this function will
  automatically be escaped as necessary. Usually this is what you want, but if
  you have an existing Pango markup string that you want to use literally as the
  label, then you need to use the @fun{gtk-message-dialog-set-markup} function
  instead, since you cannot pass the markup string either as the format, it
  might contain '%' characters, or as a string argument.
  @begin[Examples]{dictionary}
    @begin{pre}
(let ((dialog (gtk-message-dialog-new main-window
                                      '(:destroy-with-parent)
                                      :error
                                      close
                                      nil)))
  (gtk-message-dialog-set-markup dialog markup)
  ... )
    @end{pre}
  @end{dictionary}
  @see-class{gtk-message-dialog}
  @see-class{gtk-window}
  @see-class{gtk-dialog}
  @see-symbol{gtk-dialog-flags}
  @see-symbol{gtk-message-type}
  @see-symbol{gtk-buttons-type}
  @see-symbol{gtk-response-type}
  @see-function{gtk-message-dialog-set-markup}"
  (let ((dialog (make-instance 'gtk-message-dialog
                               :use-markup t
                               :message-type type
                               :buttons buttons)))
    (if message
        (setf (gtk-message-dialog-text dialog)
        (apply #'format (cons nil (cons message args)))))
    (if parent
        (setf (gtk-window-transient-for dialog) parent))
    (if (member :modal flags)
        (setf (gtk-window-modal dialog) t))
    (if (member :destroy-with-parent flags)
        (setf (gtk-window-destroy-with-parent dialog) t))
    dialog))

(export 'gtk-message-dialog-new-with-markup)

;;; ----------------------------------------------------------------------------
;;; gtk_message_dialog_set_markup ()
;;; ----------------------------------------------------------------------------

(defun gtk-message-dialog-set-markup (dialog text)
 #+cl-cffi-gtk-documentation
 "@version{2021-10-4}
  @argument[dialog]{a @class{gtk-message-dialog} widget}
  @argument[text]{a markup string, see Pango markup format}
  @begin{short}
    Sets the text of the message dialog to be @arg{text}, which is marked
    up with the Pango text markup language.
  @end{short}
  @see-class{gtk-message-dialog}"
  (setf (gtk-message-dialog-use-markup dialog) t
        (gtk-message-dialog-text dialog) text))

(export 'gtk-message-dialog-set-markup)

;;; ----------------------------------------------------------------------------
;;; gtk_message_dialog_format_secondary_text ()
;;; ----------------------------------------------------------------------------

;; TODO: Improve the implementation

(declaim (inline gtk-message-dialog-format-secondary-text))

(defun gtk-message-dialog-format-secondary-text (dialog message &rest args)
 #+cl-cffi-gtk-documentation
 "@version{2021-10-4}
  @argument[dialog]{a @class{gtk-message-dialog} widget}
  @argument[message]{a format string, or @code{nil}}
  @argument[args]{the arguments for @arg{message}}
  @begin{short}
    Sets the secondary text of the message dialog to be @arg{message} with
    the arguments in @arg{args}.
  @end{short}
  Note that setting a secondary text makes the primary text become bold, unless
  you have provided explicit markup.
  @see-class{gtk-message-dialog}
  @see-function{gtk-message-dialog-format-secondary-markup}"
  (setf (gtk-message-dialog-secondary-text dialog)
        (apply #'format (cons nil (cons message args)))))

(export 'gtk-message-dialog-format-secondary-text)

;;; ----------------------------------------------------------------------------
;;; gtk_message_dialog_format_secondary_markup ()
;;; ----------------------------------------------------------------------------

;; TODO: Improve the implementation

(declaim (inline gtk-message-dialog-format-secondary-markup))

(defun gtk-message-dialog-format-secondary-markup (dialog message &rest args)
 #+cl-cffi-gtk-documentation
 "@version{2021-10-4}
  @argument[dialog]{a @class{gtk-message-dialog} widget}
  @argument[message]{a markup string, see Pango markup format, or @code{nil}}
  @argument[args]{the arguments for @arg{message}}
  @begin{short}
    Sets the secondary text of the message dialog to be @arg{message} with
    the arguments in @arg{args}, which is marked up with the Pango text markup
    language.
  @end{short}
  Note that setting a secondary text makes the primary text become bold,
  unless you have provided explicit markup. Due to an oversight in the C
  implementation, this function does not escape special XML characters like the
  @fun{gtk-message-dialog-new-with-markup} function does.
  @see-class{gtk-message-dialog}
  @see-function{gtk-message-dialog-new-with-markup}
  @see-function{gtk-message-dialog-format-secondary-text}"
  (setf (gtk-message-dialog-secondary-use-markup dialog) t
        (gtk-message-dialog-secondary-text dialog)
        (apply #'format (cons nil (cons message args)))))

(export 'gtk-message-dialog-format-secondary-markup)

;;; --- End of file gtk.message-dialog.lisp ------------------------------------
