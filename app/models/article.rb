class Article < ApplicationRecord

  after_initialize :default_values

  def default_values
      self.version ||= 0
  end

end
