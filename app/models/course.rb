class Course < ApplicationRecord
    
    has_rich_text :description
    validates :title,  presence: true, length: { :minimum => 5 }
    validates :description, presence: true, length: { :minimum => 5 }
    
    def to_s
        title
    end
end
