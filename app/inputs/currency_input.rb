class CurrencyInput < SimpleForm::Inputs::Base
  enable :placeholder, :maxlength, :minlength

  def input(wrapper_options = nil)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    template.content_tag(:span, "$", class: "input-group-addon") + @builder.input_field(attribute_name, merged_input_options)
  end
end
