class RadioColorInput < SimpleForm::Inputs::CollectionRadioButtonsInput

  def input
    label_method, value_method = detect_collection_methods

    @builder.send("collection_radio_buttons",
      attribute_name, collection, value_method, label_method,
      input_options, input_html_options, &collection_block_for_nested_boolean_style
    )
  end

  protected

  
  def build_nested_boolean_style_item_tag(collection_builder)
    tag = String.new
    tag << '<div class="ui radio checkbox">'.html_safe
    tag << collection_builder.radio_button + collection_builder.label
    tag << '</div>'.html_safe
    return tag.html_safe
  end # method
    
 

end