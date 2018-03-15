class Entry < ApplicationRecord
include PgSearch
  pg_search_scope :search_attr, :against => [:idparcel] 
end
