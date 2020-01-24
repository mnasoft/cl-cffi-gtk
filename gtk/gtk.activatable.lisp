;;; ----------------------------------------------------------------------------
;;; gtk.activatable.lisp
;;;
;;; The documentation of this file is taken from the GTK+ 3 Reference Manual
;;; Version 3.24 and modified to document the Lisp binding to the GTK+ library.
;;; See <http://www.gtk.org>. The API documentation of the Lisp binding is
;;; available from <http://www.crategus.com/books/cl-cffi-gtk/>.
;;;
;;; Copyright (C) 2009 - 2011 Kalyanov Dmitry
;;; Copyright (C) 2011 - 2020 Dieter Kaiser
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
;;; GtkActivatable
;;;
;;;     An interface for activatable widgets
;;;
;;; Types and Values
;;;
;;;     GtkActivatable
;;;
;;; Functions
;;;
;;;     gtk_activatable_do_set_related_action
;;;     gtk_activatable_get_related_action
;;;     gtk_activatable_get_use_action_appearance
;;;     gtk_activatable_sync_action_properties
;;;     gtk_activatable_set_related_action
;;;     gtk_activatable_set_use_action_appearance
;;;
;;; Properties
;;;
;;;     GtkAction*   related-action           Read / Write
;;;      gboolean    use-action-appearance    Read / Write
;;;
;;; Object Hierarchy
;;;
;;;     GInterface
;;;     ╰── GtkActivatable
;;;
;;; Prerequisites
;;;
;;;     GtkActivatable requires GObject.
;;;
;;; Known Implementations
;;;
;;;     GtkActivatable is implemented by GtkButton, GtkCheckButton,
;;;     GtkCheckMenuItem, GtkColorButton, GtkFontButton, GtkImageMenuItem,
;;;     GtkLinkButton, GtkLockButton, GtkMenuButton, GtkMenuItem,
;;;     GtkMenuToolButton, GtkModelButton, GtkRadioButton, GtkRadioMenuItem,
;;;     GtkRadioToolButton, GtkRecentChooserMenu, GtkScaleButton,
;;;     GtkSeparatorMenuItem, GtkSeparatorToolItem, GtkSwitch,
;;;     GtkTearoffMenuItem, GtkToggleButton, GtkToggleToolButton,
;;;     GtkToolButton, GtkToolItem and GtkVolumeButton.
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; GtkActivatable
;;; ----------------------------------------------------------------------------

(define-g-interface "GtkActivatable" gtk-activatable
  (:export t
   :type-initializer "gtk_activatable_get_type")
  (related-action
   gtk-activatable-related-action
   "related-action" "GtkAction" t t)
  (use-action-appearance
   gtk-activatable-use-action-appearance
   "use-action-appearance" "gboolean" t t))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-activatable atdoc:*class-name-alias*) "Interface"
      (documentation 'gtk-activatable 'type)
 "@version{2013-6-2}
  @begin{short}
    Activatable widgets can be connected to a @class{gtk-action} and reflects
    the state of its action. A @sym{gtk-activatable} can also provide feedback
    through its action, as they are responsible for activating their related
    actions.
  @end{short}

  @subheading{Implementing gtk-activatable}
    When extending a class that is already @sym{gtk-activatable}; it is only
    necessary to implement the @code{GtkActivatable->sync_action_properties()}
    and @code{GtkActivatable->update()} methods and chain up to the parent
    implementation, however when introducing a new @sym{gtk-activatable} class;
    the @code{related-action} and @code{use-action-appearance} properties need
    to be handled by the implementor. Handling these properties is mostly a
    matter of installing the action pointer and boolean flag on your instance,
    and calling @fun{gtk-activatable-do-set-related-action} and
    @fun{gtk-activatable-sync-action-properties} at the appropriate times.

    @b{Example:} A class fragment implementing @sym{gtk-activatable}
    @begin{pre}
 enum {
   ...

   PROP_ACTIVATABLE_RELATED_ACTION,
   PROP_ACTIVATABLE_USE_ACTION_APPEARANCE
   @}

   struct _FooBarPrivate
   {

     ...

     GtkAction      *action;
     gboolean        use_action_appearance;
   @};

   ...

   static void foo_bar_activatable_interface_init
                                          (GtkActivatableIface *iface);
   static void foo_bar_activatable_update (GtkActivatable *activatable,
                                           GtkAction      *action,
                                           const gchar    *property_name);
   static void foo_bar_activatable_sync_action_properties
                                          (GtkActivatable *activatable,
                                           GtkAction      *action);
   ...

   static void
   foo_bar_class_init (FooBarClass *klass)
   {

     ...

     g_object_class_override_property (gobject_class,
                                       PROP_ACTIVATABLE_RELATED_ACTION,
                                       \"related-action\");
     g_object_class_override_property (gobject_class,
                                       PROP_ACTIVATABLE_USE_ACTION_APPEARANCE,
                                       \"use-action-appearance\");

     ...
   @}

   static void
   foo_bar_activatable_interface_init (GtkActivatableIface  *iface)
   {
     iface->update = foo_bar_activatable_update;
     iface->sync_action_properties =
                                  foo_bar_activatable_sync_action_properties;
   @}

   ... Break the reference using gtk_activatable_do_set_related_action()...

   static void
   foo_bar_dispose (GObject *object)
   {
     FooBar *bar = FOO_BAR (object);
     FooBarPrivate *priv = FOO_BAR_GET_PRIVATE (bar);

     ...

    if (priv->action)
      {
         gtk_activatable_do_set_related_action (GTK_ACTIVATABLE (bar), NULL);
        priv->action = NULL;
      @}
     G_OBJECT_CLASS (foo_bar_parent_class)->dispose (object);
   @}

   ... Handle the \"related-action\" and \"use-action-appearance\" properties ...

   static void
   foo_bar_set_property (GObject         *object,
                         guint            prop_id,
                         const GValue    *value,
                         GParamSpec      *pspec)
   {
     FooBar *bar = FOO_BAR (object);
     FooBarPrivate *priv = FOO_BAR_GET_PRIVATE (bar);

     switch (prop_id)
       {

         ...

       case PROP_ACTIVATABLE_RELATED_ACTION:
         foo_bar_set_related_action (bar, g_value_get_object (value));
         break;
       case PROP_ACTIVATABLE_USE_ACTION_APPEARANCE:
         foo_bar_set_use_action_appearance (bar,
                                            g_value_get_boolean (value));
         break;
       default:
         G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
         break;
       @}
   @}

   static void
   foo_bar_get_property (GObject         *object,
                            guint         prop_id,
                            GValue       *value,
                            GParamSpec   *pspec)
   {
     FooBar *bar = FOO_BAR (object);
     FooBarPrivate *priv = FOO_BAR_GET_PRIVATE (bar);

     switch (prop_id)
       {

         ...

       case PROP_ACTIVATABLE_RELATED_ACTION:
         g_value_set_object (value, priv->action);
         break;
       case PROP_ACTIVATABLE_USE_ACTION_APPEARANCE:
         g_value_set_boolean (value, priv->use_action_appearance);
         break;
       default:
         G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
         break;
       @}
  @}


  static void
  foo_bar_set_use_action_appearance (FooBar   *bar,
                     gboolean  use_appearance)
  {
    FooBarPrivate *priv = FOO_BAR_GET_PRIVATE (bar);

    if (priv->use_action_appearance != use_appearance)
      {
        priv->use_action_appearance = use_appearance;

        gtk_activatable_sync_action_properties (GTK_ACTIVATABLE (bar),
                                                priv->action);
      @}
  @}

... call gtk_activatable_do_set_related_action() and then assign the action
pointer, no need to reference the action here since
gtk_activatable_do_set_related_action() already holds a reference here for
you...

  static void
  foo_bar_set_related_action (FooBar    *bar,
                  GtkAction *action)
  {
    FooBarPrivate *priv = FOO_BAR_GET_PRIVATE (bar);

    if (priv->action == action)
      return;

    gtk_activatable_do_set_related_action (GTK_ACTIVATABLE (bar), action);

    priv->action = action;
  @}

... Selectively reset and update activatable depending on the
use-action-appearance property ...

  static void
  gtk_button_activatable_sync_action_properties
                                               (GtkActivatable *activatable,
                                                GtkAction      *action)
  {
    GtkButtonPrivate *priv = GTK_BUTTON_GET_PRIVATE (activatable);

    if (!action)
      return;

    if (gtk_action_is_visible (action))
      gtk_widget_show (GTK_WIDGET (activatable));
    else
      gtk_widget_hide (GTK_WIDGET (activatable));

    gtk_widget_set_sensitive (GTK_WIDGET (activatable),
                              gtk_action_is_sensitive (action));

    ...

    if (priv->use_action_appearance)
      {
        if (gtk_action_get_stock_id (action))
      foo_bar_set_stock (button, gtk_action_get_stock_id (action));
        else if (gtk_action_get_label (action))
      foo_bar_set_label (button, gtk_action_get_label (action));

        ...

      @}
  @}

  static void
  foo_bar_activatable_update (GtkActivatable       *activatable,
                              GtkAction            *action,
                              const gchar          *property_name)
  {
    FooBarPrivate *priv = FOO_BAR_GET_PRIVATE (activatable);

    if (strcmp (property_name, \"visible\") == 0)
      {
        if (gtk_action_is_visible (action))
      gtk_widget_show (GTK_WIDGET (activatable));
        else
      gtk_widget_hide (GTK_WIDGET (activatable));
      @}
    else if (strcmp (property_name, \"sensitive\") == 0)
      gtk_widget_set_sensitive (GTK_WIDGET (activatable),
                                gtk_action_is_sensitive (action));

    ...

    if (!priv->use_action_appearance)
      return;

    if (strcmp (property_name, \"stock-id\") == 0)
      foo_bar_set_stock (button, gtk_action_get_stock_id (action));
    else if (strcmp (property_name, \"label\") == 0)
      foo_bar_set_label (button, gtk_action_get_label (action));

    ...
  @}
    @end{pre}
  @see-slot{gtk-activatable-related-action}
  @see-slot{gtk-activatable-use-action-appearance}")

;;; ----------------------------------------------------------------------------
;;; Property and Accessor Details
;;; ----------------------------------------------------------------------------

;;; --- gtk-activatable-related-action -----------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "related-action"
                                               'gtk-activatable) 't)
 "The @code{related-action} property of type @class{gtk-action}
  (Read / Write) @br{}
  The action that this activatable will activate and receive updates from for
  various states and possibly appearance. @br{}
  @em{Note:} @class{gtk-activatable} implementors need to handle this
  property and call the @fun{gtk-activatable-do-set-related-action} function
  when it changes.")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-activatable-related-action atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-activatable-related-action 'function)
 "@version{2020-1-22}
  @syntax[]{(gtk-activatable-related-action object) => action}
  @syntax[]{(setf (gtk-activatable-related-action object) action)}
  @argument[activatable]{a @class{gtk-activatable} object}
  @argument[action]{the @class{gtk-action} object to set}
  @begin{short}
    Accessor of the @slot[gtk-activatable]{related-action} slot of the
    @class{gtk-activatable} class.
  @end{short}

  The @sym{gtk-activatable-related-action} slot access function
  gets the related @class{gtk-action} object for @arg{activatable}.

  The @sym{(setf gtk-activatable-related-action)} slot access function
  sets the related action on the activatable object.
  @begin[Note]{dictionary}
    @class{gtk-activatable} implementors need to handle the
    @slot[gtk-activatable]{related-action} property and call the
    @fun{gtk-activatable-do-set-related-action} function when it changes.
  @end{dictionary}
  @begin[Warning]{dictionary}
    The function @sym{gtk-activatable-related-action} has been deprecated
    since version 3.10 and should not be used in newly-written code.
  @end{dictionary}
  @see-class{gtk-activatable}
  @see-function{gtk-activatable-get-related-action}
  @see-function{gtk-activatable-set-related-action}")

;;; --- gtk-activatable-use-action-appearance ----------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "use-action-appearance"
                                               'gtk-activatable) 't)
 "The @code{use-action-appearance} property of type @code{:boolean}
  (Read / Write) @br{}
  Whether this activatable should reset its layout and appearance when setting
  the related action or when the action changes appearance. See the
  @class{gtk-action} documentation directly to find which properties should be
  ignored by the @class{gtk-activatable} when this property is @code{nil}. @br{}
  @em{Note:}
  @class{gtk-activatable} implementors need to handle this property and call
  @fun{gtk-activatable-sync-action-properties} on the activatable widget when
  it changes. @br{}
  Default value: @code{true}")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-activatable-use-action-appearance
               atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-activatable-use-action-appearance 'function)
 "@version{2020-1-22}
  @syntax[]{(gtk-activatable-use-action-appearance object) => action}
  @syntax[]{(setf (gtk-activatable-use-action-appearance object) action)}
  @argument[activatable]{a @class{gtk-activatable} object}
  @argument[use-appearance]{whether to use the actions appearance}
  @begin{short}
    Accessor of the @slot[gtk-activatable]{use-action-appearance} slot of the
    @class{gtk-activatable} class.
  @end{short}

  The @sym{gtk-activatable-use-action-appearance} slot access function
  gets whether this activatable should reset its layout and appearance when
  setting the related action or when the action changes appearance.

  The @sym{(setf gtk-activatable-use-action-appearance)} slot access function
  sets whether this activatable should reset its layout and appearance when
  setting the related action or when the action changes appearance.
  @begin[Note]{dictionary}
    @class{gtk-activatable} implementors need to handle the
    @slot[gtk-activatable]{use-action-appearance} property and call the
    @fun{gtk-activatable-sync-action-properties} function to update
    @arg{activatable} if needed.
  @end{dictionary}
  @begin[Warning]{dictionary}
    The function @sym{gtk-activatable-use-action-appearance} has been deprecated
    since version 3.10 and should not be used in newly-written code.
  @end{dictionary}
  @see-class{gtk-activatable}")

;;; ----------------------------------------------------------------------------
;;; gtk_activatable_do_set_related_action ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_activatable_do_set_related_action"
           gtk-activatable-do-set-related-action) :void
 #+cl-cffi-gtk-documentation
 "@version{2020-1-22}
  @argument[activatable]{a @class{gtk-activatable} object}
  @argument[action]{the @class{gtk-action} object to set}
  @begin{short}
    This is a utility function for @class{gtk-activatable} interface
    implementors.
  @end{short}

  When implementing the @class{gtk-activatable} interface you must call this
  when handling changes of the @slot[gtk-activatable]{related-action} property,
  and you must also use this to break references in @code{GObject->dispose()}.

  This function adds a reference to the currently set related action for you,
  it also makes sure the @code{GtkActivatable->update()} method is called when
  the related @class{gtk-action} object properties change and registers to the
  action's proxy list.
  @begin[Note]{dictionary}
    Be careful to call this before setting the local copy of the
    @class{gtk-action} object property, since this function uses
    @fun{gtk-activatable-get-related-action} to retrieve the previous action.
  @end{dictionary}
  @begin[Warning]{dictionary}
    The function @sym{gtk-activatable-do-set-related-action} has been deprecated
    since version 3.10 and should not be used in newly-written code.
  @end{dictionary}
  @see-class{gtk-activatable}
  @see-class{gtk-action}
  @see-function{gtk-activatable-get-related-action}"
  (activatable (g-object gtk-activatable))
  (action (g-object gtk-action)))

(export 'gtk-activatable-do-set-related-action)

;;; ----------------------------------------------------------------------------
;;; gtk_activatable_sync_action_properties ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_activatable_sync_action_properties"
           gtk-activatable-sync-action-properties) :void
 #+cl-cffi-gtk-documentation
 "@version{2020-1-22}
  @argument[activatable]{a @class{gtk-activatable} object}
  @argument[action]{the related @class{gtk-action} or @code{nil}}
  @begin{short}
    This is called to update the @arg{activatable} completely, this is called
    internally when the @slot[gtk-activatable]{related-action} property is set
    or unset and by the implementing class when
    @slot[gtk-activatable]{use-action-appearance} changes.
  @end{short}
  @begin[Warning]{dictionary}
    The function @sym{gtk-activatable-sync-action-properties} has been
    deprecated since version 3.10 and should not be used in newly-written code.
  @end{dictionary}
  @see-class{gtk-activatable}
  @see-class{gtk-action}"
  (activatable (g-object gtk-activatable))
  (action (g-object gtk-action)))

(export 'gtk-activatable-sync-action-properties)

;;; --- End of file gtk.activatable.lisp ---------------------------------------
