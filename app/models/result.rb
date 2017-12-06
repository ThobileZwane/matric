class Result < ApplicationRecord
   validates :name, presence: true, uniqueness: true

   def self.search(search)
    where("name ILIKE ? OR centre_no ILIKE ?", "%#{search}%", "%#{search}%") 
   end
  
  
end