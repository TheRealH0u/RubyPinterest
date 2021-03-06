module PinsHelper
  def display_index_pin_links(pin)
    capture do
      concat content_tag(:td, link_to('Show', pin))
      if current_user == pin.user
        concat content_tag(:td, link_to('Edit', edit_pin_path(pin)))
        concat content_tag(:td, link_to('Destroy', pin, method: :delete, data: { confirm: 'Are you sure?' }))
      end
    end
  end

  def display_show_pin_links(pin)
    capture do
      concat link_to 'Edit', edit_pin_path(pin) if current_user == pin.user
      concat ' | ' if current_user == pin.user
      concat link_to 'Destroy', pin, method: :delete, data: { confirm: 'Are you sure? '} if current_user == pin.user
      concat ' | ' if current_user == pin.user
      concat link_to 'Back', pins_path
    end
  end
end
