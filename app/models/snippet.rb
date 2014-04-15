class Snippet < ActiveRecord::Base

  validates :title, :lang, :code, presence: true

end
