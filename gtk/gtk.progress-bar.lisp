;;; ----------------------------------------------------------------------------
;;; gtk.progress-bar.lisp
;;;
;;; This file contains code from a fork of cl-gtk2.
;;; See <http://common-lisp.net/project/cl-gtk2/>.
;;;
;;; The documentation has been copied from the GTK+ 3 Reference Manual
;;; Version 3.6.4. See <http://www.gtk.org>. The API documentation of the
;;; Lisp binding is available at <http://www.crategus.com/books/cl-cffi-gtk/>.
;;;
;;; Copyright (C) 2009 - 2011 Kalyanov Dmitry
;;; Copyright (C) 2011 - 2013 Dieter Kaiser
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
;;; GtkProgressBar
;;; 
;;; A widget which indicates progress visually
;;;     
;;; Synopsis
;;; 
;;;     GtkProgressBar
;;;
;;;     gtk_progress_bar_new
;;;     gtk_progress_bar_pulse
;;;     gtk_progress_bar_set_fraction
;;;     gtk_progress_bar_get_fraction
;;;     gtk_progress_bar_set_inverted
;;;     gtk_progress_bar_get_inverted
;;;     gtk_progress_bar_set_show_text
;;;     gtk_progress_bar_get_show_text
;;;     gtk_progress_bar_set_text
;;;     gtk_progress_bar_get_text
;;;     gtk_progress_bar_set_ellipsize
;;;     gtk_progress_bar_get_ellipsize
;;;     gtk_progress_bar_set_pulse_step
;;;     gtk_progress_bar_get_pulse_step
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; struct GtkProgressBar
;;; ----------------------------------------------------------------------------

(define-g-object-class "GtkProgressBar" gtk-progress-bar
  (:superclass gtk-widget
   :export t
   :interfaces ("AtkImplementorIface"
                "GtkBuildable"
                "GtkOrientable")
   :type-initializer "gtk_progress_bar_get_type")
  ((ellipsize
    gtk-progress-bar-ellipsize
    "ellipsize" "PangoEllipsize" t t)
   (fraction
    gtk-progress-bar-fraction
    "fraction" "gdouble" t t)
   (inverted
    gtk-progress-bar-inverted
    "inverted" "gboolean" t t)
   (pulse-step
    gtk-progress-bar-pulse-step
    "pulse-step" "gdouble" t t)
   (show-text
    gtk-progress-bar-show-text
    "show-text" "gboolean" t t)
   (text
    gtk-progress-bar-text
    "text" "gchararray" t t)))

;;; ----------------------------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation 'gtk-progress-bar 'type)
 "@version{2013-4-23}
  @begin{short}
    The @sym{gtk-progress-bar} is typically used to display the progress of a
    long running operation. It provides a visual clue that processing is
    underway. The @sym{gtk-progress-bar} can be used in two different modes:
    percentage mode and activity mode.
  @end{short}

  When an application can determine how much work needs to take place (e. g.
  read a fixed number of bytes from a file) and can monitor its progress, it
  can use the @sym{gtk-progress-bar} in percentage mode and the user sees a
  growing bar indicating the percentage of the work that has been completed.
  In this mode, the application is required to call the function
  @fun{gtk-progress-bar-set-fraction} periodically to update the progress bar.

  When an application has no accurate way of knowing the amount of work to do,
  it can use the @sym{gtk-progress-bar} in activity mode, which shows activity
  by a block moving back and forth within the progress area. In this mode, the
  application is required to call the function @fun{gtk-progress-bar-pulse}
  periodically to update the progress bar.

  There is quite a bit of flexibility provided to control the appearance of
  the @sym{gtk-progress-bar}. Functions are provided to control the orientation
  of the bar, optional text can be displayed along with the bar, and the step
  size used in activity mode can be set.
  @begin[Style Property Details]{dictionary}
    @subheading{The \"min-horizontal-bar-height\" style property}
      @code{\"min-horizontal-bar-height\"} of type @code{:int}
      (Read / Write)@br{}
      Minimum horizontal height of the progress bar. @br{}
      Allowed values: >= 1 @br{}
      Default value: 20 @br{}
      Since 2.14

    @subheading{The \"min-horizontal-bar-width\" style property}
      @code{\"min-horizontal-bar-width\"} of type @code{:int}
      (Read / Write)@br{}
      The minimum horizontal width of the progress bar. @br{}
      Allowed values: >= 1 @br{}
      Default value: 150 @br{}
      Since 2.14

    @subheading{The \"min-vertical-bar-height\" style property}
      @code{\"min-vertical-bar-height\"} of type @code{:int} (Read / Write)@br{}
      The minimum vertical height of the progress bar. @br{}
      Allowed values: >= 1 @br{}
      Default value: 80 @br{}
      Since 2.14

    @subheading{The \"min-vertical-bar-width\" style property}
      @code{\"min-vertical-bar-width\"} of type @code{:int} (Read / Write)@br{}
      The minimum vertical width of the progress bar. @br{}
      Allowed values: >= 1 @br{}
      Default value: 22 @br{}
      Since 2.14

    @subheading{The \"xspacing\" style property}
      @code{\"xspacing\"} of type @code{:int} (Read / Write)@br{}
      Extra spacing applied to the width of a progress bar. @br{}
      Allowed values: >= 0 @br{}
      Default value: 7

    @subheading{The \"yspacing\" style property}
      @code{\"yspacing\"} of type @code{:int} (Read / Write)@br{}
      Extra spacing applied to the height of a progress bar. @br{}
      Allowed values: >= 0 @br{}
      Default value: 7
  @end{dictionary}
  @see-slot{gtk-progress-bar-ellipsize}
  @see-slot{gtk-progress-bar-fraction}
  @see-slot{gtk-progress-bar-inverted}
  @see-slot{gtk-progress-bar-pulse-step}
  @see-slot{gtk-progress-bar-show-text}
  @see-slot{gtk-progress-bar-text}")

;;; ----------------------------------------------------------------------------
;;;
;;; Property Details
;;;
;;; ----------------------------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "ellipsize"
                                               'gtk-progress-bar) 't)
 "The @code{\"ellipsize\"} property of type @symbol{pango-ellipsize-mode}
  (Read / Write)@br{}
  The preferred place to ellipsize the string, if the progress bar does not
  have enough room to display the entire string, specified as a
  @symbol{pango-ellipsize-mode}.
  Note that setting this property to a value other than @code{:none} has the
  side-effect that the progress bar requests only enough space to display the
  ellipsis (\"...\"). Another means to set a progress bar's width is the
  function @fun{gtk-widget-set-size-request}.@br{}
  Default value: @code{:none}@br{}
  Since 2.6")

;;; ----------------------------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "fraction" 'gtk-progress-bar) 't)
 "The @code{\"fraction\"} property of type @code{:double} (Read / Write)@br{}
  The fraction of total work that has been completed.@br{}
  Allowed values: [0,1]@br{}
  Default value: 0")

;;; ----------------------------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "inverted" 'gtk-progress-bar) 't)
 "The @code{\"inverted\"} property of type @code{:boolean} (Read / Write)@br{}
  Invert the direction in which the progress bar grows.@br{}
  Default value: @code{nil}")

;;; ----------------------------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "pulse-step"
                                               'gtk-progress-bar) 't)
 "The @code{\"pulse-step\"} property of type @code{:double} (Read / Write)@br{}
  The fraction of total progress to move the bouncing block when pulsed.@br{}
  Allowed values: [0,1]@br{}
  Default value: 0.1")

;;; ----------------------------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "show-text"
                                               'gtk-progress-bar) 't)
 "The @code{\"show-text\"} property of type @code{:boolean} (Read / Write)@br{}
  Sets whether the progress bar will show text superimposed over the bar.
  The shown text is either the value of the @code{\"text\"} property or, if that
  is @code{nil}, the @code{\"fraction\"} value, as a percentage.
  To make a progress bar that is styled and sized suitably for containing text
  (even if the actual text is blank), set @code{\"show-text\"} to @em{true} and
  @code{\"text\"} to the empty string (not @code{nil}).@br{}
  Default value: @code{nil}@br{}
  Since 3.0")

;;; ----------------------------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "text" 'gtk-progress-bar) 't)
 "The @code{\"text\"} property of type @code{:string} (Read / Write)@br{}
  Text to be displayed in the progress bar.@br{}
  Default value: @code{nil}")

;;; ----------------------------------------------------------------------------
;;;
;;; Accessors of Properties
;;;
;;; ----------------------------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-progress-bar-ellipsize atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-progress-bar-ellipsize 'function)
 "@version{2013-3-17}
  Accessor of the slot @code{\"ellipsize\"} of the @class{gtk-progress-bar}
  class.")

;;; ----------------------------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-progress-bar-fraction atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-progress-bar-fraction 'function)
 "@version{2013-3-17}
  Accessor of the slot @code{\"fraction\"} of the @class{gtk-progress-bar}
  class.")

;;; ----------------------------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-progress-bar-inverted atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-progress-bar-inverted 'function)
 "@version{2013-3-17}
  Accessor of the slot @code{\"inverted\"} of the @class{gtk-progress-bar}
  class.")

;;; ----------------------------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-progress-bar-pulse-step atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-progress-bar-pulse-step 'function)
 "@version{2013-3-17}
  Accessor of the slot @code{\"pulse-step\"} of the @class{gtk-progress-bar}
  class.")

;;; ----------------------------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-progress-bar-show-text atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-progress-bar-show-text 'function)
 "@version{2013-3-17}
  Accessor of the slot @code{\"show-text\"} of the @class{gtk-progress-bar}
  class.")

;;; ----------------------------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-progress-bar-text atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-progress-bar-text 'function)
 "@version{2013-3-17}
  Accessor of the slot @code{\"text\"} of the @class{gtk-progress-bar}
  class.")

;;; ----------------------------------------------------------------------------
;;; gtk_progress_bar_new ()
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-progress-bar-new))

(defun gtk-progress-bar-new ()
 #+cl-cffi-gtk-documentation
 "@version{2013-4-23}
  @return{A @class{gtk-progress-bar} widget.}
  Creates a new @class{gtk-progress-bar} widget."
  (make-instance 'gtk-progress-bar))

(export 'gtk-progress-bar-new)

;;; ----------------------------------------------------------------------------
;;; gtk_progress_bar_pulse ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_progress_bar_pulse" gtk-progress-bar-pulse) :void
 #+cl-cffi-gtk-documentation
 "@version{2013-4-23}
  @argument[pbar]{a @class{gtk-progress-bar} widget}
  @begin{short}
    Indicates that some progress has been made, but you do not know how much.
    Causes the progress bar to enter \"activity mode\", where a block bounces
    back and forth.
  @end{short}
  Each call to @sym{gtk-progress-bar-pulse} causes the block to move by
  a little bit (the amount of movement per pulse is determined by the function
  @fun{gtk-progress-bar-set-pulse-step}).
  @see-function{gtk-progress-bar-set-pulse-step}"
  (pbar (g-object gtk-progress-bar)))

(export 'gtk-progress-bar-pulse)

;;; ----------------------------------------------------------------------------
;;; gtk_progress_bar_set_fraction ()
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-progress-bar-set-fraction))

(defun gtk-progress-bar-set-fraction (pbar fraction)
 #+cl-cffi-gtk-documentation
 "@version{2013-4-23}
  @argument[pbar]{a @class{gtk-progress-bar} widget}
  @argument[fraction]{fraction of the task that is been completed}
  @begin{short}
    Causes the progress bar to \"fill in\" the given fraction of the bar.
  @end{short}
  The fraction should be between 0.0 and 1.0, inclusive."
  (setf (gtk-progress-bar-fraction pbar) fraction))

(export 'gtk-progress-bar-set-fraction)

;;; ----------------------------------------------------------------------------
;;; gtk_progress_bar_get_fraction ()
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-progress-bar-get-fraction))

(defun gtk-progress-bar-get-fraction (pbar)
 #+cl-cffi-gtk-documentation
 "@version{2013-4-23}
  @argument[pbar]{a @class{gtk-progress-bar} widget}
  @return{A fraction from 0.0 to 1.0 of the progress bar.}
  Returns the current fraction of the task that is been completed."
  (gtk-progress-bar-fraction pbar))

(export 'gtk-progress-bar-get-fraction)

;;; ----------------------------------------------------------------------------
;;; gtk_progress_bar_set_inverted ()
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-progress-bar-set-inverted))

(defun gtk-progress-bar-set-inverted (pbar inverted)
 #+cl-cffi-gtk-documentation
 "@version{2013-4-23}
  @argument[pbar]{a @class{gtk-progress-bar} widget}
  @argument[inverted]{@em{true} to invert the progress bar}
  Progress bars normally grow from top to bottom or left to right. Inverted
  progress bars grow in the opposite direction."
  (setf (gtk-progress-bar-inverted pbar) inverted))

(export 'gtk-progress-bar-set-inverted)

;;; ----------------------------------------------------------------------------
;;; gtk_progress_bar_get_inverted ()
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-progress-bar-get-inverted))

(defun gtk-progress-bar-get-inverted (pbar)
 #+cl-cffi-gtk-documentation
 "@version{2013-4-23}
  @argument[pbar]{a @class{gtk-progress-bar} widget}
  @return{@em{True} if the progress bar is inverted.}
  Gets the value set by the function @fun{gtk-progress-bar-set-inverted}.
  @see-function{gtk-progress-bar-set-inverted}"
  (gtk-progress-bar-inverted pbar))

(export 'gtk-progress-bar-get-inverted)

;;; ----------------------------------------------------------------------------
;;; gtk_progress_bar_set_show_text ()
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-progress-bar-set-show-text))

(defun gtk-progress-bar-set-show-text (pbar show-text)
 #+cl-cffi-gtk-documentation
 "@version{2013-4-23}
  @argument[pbar]{a @class{gtk-progress-bar} widget}
  @argument[show-text]{whether to show superimposed text}
  @begin{short}
    Sets whether the progress bar will show text superimposed over the bar. The
    shown text is either the value of the @code{\"text\"} property or, if that
    is @code{nil}, the @code{\"fraction\"} value, as a percentage.
  @end{short}
  To make a progress bar that is styled and sized suitably for containing text
  (even if the actual text is blank), set the @code{\"show-text\"} property to
  @em{true} and the @code{\"text\"} property to the empty string
  (not @code{nil}.

  Since 3.0"
  (setf (gtk-progress-bar-show-text pbar) show-text))

(export 'gtk-progress-bar-set-show-text)

;;; ----------------------------------------------------------------------------
;;; gtk_progress_bar_get_show_text ()
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-progress-bar-get-show-text))

(defun gtk-progress-bar-get-show-text (pbar)
 #+cl-cffi-gtk-documentation
 "@version{2013-4-23}
  @argument[pbar]{a @class{gtk-progress-bar} widget}
  @return{@em{True} if text is shown in the progress bar.}
  @begin{short}
    Gets the value of the @code{\"show-text\"} property.
  @end{short}
  See the function @fun{gtk-progress-bar-set-show-text}.

  Since 3.0
  @see-function{gtk-progress-bar-set-show-text}"
  (gtk-progress-bar-show-text pbar))

(export 'gtk-progress-bar-get-show-text)

;;; ----------------------------------------------------------------------------
;;; gtk_progress_bar_set_text ()
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-progress-bar-set-text))

(defun gtk-progress-bar-set-text (pbar text)
 #+cl-cffi-gtk-documentation
 "@version{2013-4-23}
  @argument[pbar]{a @sym{gtk-progress-bar} widget}
  @argument[text]{a UTF-8 string, or @code{nil}}
  @begin{short}
    Causes the given text to appear superimposed on the progress bar.
  @end{short}

  If text is @code{nil} and the @code{\"show-text\"} property is @em{true}, the
  current value of the @code{\"fraction\"} property will be displayed as a
  percentage.

  If text is non-@code{nil} and the @code{\"show-text\"} property is @em{true},
  the text will be displayed. In this case, it will not display the progress
  percentage. If text is the empty string, the progress bar will still be styled
  and sized suitably for containing text, as long as the @code{\"show-text\"}
  property is @em{true}."
  (setf (gtk-progress-bar-text pbar) text))

(export 'gtk-progress-bar-set-text)

;;; ----------------------------------------------------------------------------
;;; gtk_progress_bar_get_text ()
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-progress-bar-get-text))

(defun gtk-progress-bar-get-text (pbar)
 #+cl-cffi-gtk-documentation
 "@version{2013-4-23}
  @argument[pbar]{a @sym{gtk-progress-bar} widget}
  @begin{return}
    Text, or @code{nil}; this string is owned by the widget and should not be
    modified or freed.
  @end{return}
  Retrieves the text displayed superimposed on the progress bar, if any,
  otherwise @code{nil}. The return value is a reference to the text, not a copy
  of it, so will become invalid if you change the text in the progress bar."
  (gtk-progress-bar-text pbar))

(export 'gtk-progress-bar-get-text)

;;; ----------------------------------------------------------------------------
;;; gtk_progress_bar_set_ellipsize ()
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-progress-bar-set-ellipsize))

(defun gtk-progress-bar-set-ellipsize (pbar mode)
 #+cl-cffi-gtk-documentation
 "@version{2013-4-23}
  @argument[pbar]{a @sym{gtk-progress-bar} widget}
  @argument[mode]{a @symbol{pango-ellipsize-mode}}
  @begin{short}
    Sets the mode used to ellipsize (add an ellipsis: \"...\") the text if there
    is not enough space to render the entire string.
  @end{short}

  Since 2.6"
  (setf (gtk-progress-bar-ellipsize pbar) mode))

(export 'gtk-progress-bar-set-ellipsize)

;;; ----------------------------------------------------------------------------
;;; gtk_progress_bar_get_ellipsize ()
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-progress-bar-get-ellipsize))

(defun gtk-progress-bar-get-ellipsize (pbar)
 #+cl-cffi-gtk-documentation
 "@version{2013-4-23}
  @argument[pbar]{a @sym{gtk-progress-bar} widget}
  @return{A @symbol{pango-ellipsize-mode}.}
  @begin{short}
    Returns the ellipsizing position of the progress bar.
  @end{short}
  See the function @fun{gtk-progress-bar-set-ellipsize}.

  Since 2.6
  @see-function{gtk-progress-bar-set-ellipsize}"
  (gtk-progress-bar-ellipsize pbar))

(export 'gtk-progress-bar-get-ellipsize)

;;; ----------------------------------------------------------------------------
;;; gtk_progress_bar_set_pulse_step ()
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-progress-bar-set-pulse-step))

(defun gtk-progress-bar-set-pulse-step (pbar fraction)
 #+cl-cffi-gtk-documentation
 "@version{2013-4-23}
  @argument[pbar]{a @sym{gtk-progress-bar} widget}
  @argument[fraction]{fraction between 0.0 and 1.0}
  Sets the fraction of total progress bar length to move the bouncing block
  for each call to the function @fun{gtk-progress-bar-pulse}.
  @see-function{gtk-progress-bar-pulse}"
  (setf (gtk-progress-bar-pulse-step pbar) fraction))

(export 'gtk-progress-bar-set-pulse-step)

;;; ----------------------------------------------------------------------------
;;; gtk_progress_bar_get_pulse_step ()
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-progress-bar-get-pulse-step))

(defun gtk-progress-bar-get-pulse-step (pbar)
 #+cl-cffi-gtk-documentation
 "@version{2013-4-23}
  @argument[pbar]{a @sym{gtk-progress-bar} widget}
  @return{a fraction from 0.0 to 1.0}
  Retrieves the pulse step set with the function
  @fun{gtk-progress-bar-set-pulse-step}.
  @see-function{gtk-progress-bar-set-pulse-step}"
  (gtk-progress-bar-pulse-step pbar))

(export 'gtk-progress-bar-get-pulse-step)

;;; --- End of file gtk.progress-bar.lisp --------------------------------------
