module DowncaseAttributes
  extend ActiveSupport::Concern

  included do
    # allow access to columns using their lowercase name
    self.columns.each do |attribute|
      unless attribute.name == attribute.name.downcase
        alias_attribute attribute.name.downcase.to_sym, attribute.name.to_sym
      end
    end
  end
end
