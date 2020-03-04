class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
    private
        def picture_size
         if picture.size > 5.megabytes
            errors.add(:picture, "5MB以下にしてください")
         end
        end
end
