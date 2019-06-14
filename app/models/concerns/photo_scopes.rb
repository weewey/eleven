module PhotoScopes
  extend ActiveSupport::Concern

  class_methods do
    def of_race_with_tags(race_id, tags)
      Photo.where(race_id: race_id).where("tags @> ARRAY[?]::varchar[]", tags)
    end
  end
end
