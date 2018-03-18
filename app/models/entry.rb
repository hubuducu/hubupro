class Entry < ApplicationRecord
    belongs_to :desti
include PgSearch
  pg_search_scope :search_attr, :against => [:idparcel],    associated_against: {
      desti: [ :name]
    } 

end
