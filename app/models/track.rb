class Track < ApplicationRecord

    validates :name, :ord, :lyrics, presence: true
    validates :ord, uniqueness: { scope: :album_id }
    validates :bonus, inclusion: {in: [true, false]}

    belongs_to :album,
        primary_key: :id,
        foreign_key: :album_id,
        class_name: :Album

    has_one :band,
        through: :album,
        source: :band

    has_many :notes,
        primary_key: :id,
        foreign_key: :track_id,
        class_name: :Note
end
