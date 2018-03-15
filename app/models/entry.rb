class Entry < ApplicationRecord
include PgSearch
  pg_search_scope :search_attr, :against => [:idparcel] 
    belongs_to :desti
end
