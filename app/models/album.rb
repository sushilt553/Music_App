class Album < ApplicationRecord

    validates :name, :year, presence: true
    validates :live, inclusion: {in: [true, false]}

    belongs_to :band,
        primary_key: :id,
        foreign_key: :band_id,
        class_name: :Band

    # after_initialize :set_defaults

    # def set_defaults
    #     self.live ||= false
    # end
end
