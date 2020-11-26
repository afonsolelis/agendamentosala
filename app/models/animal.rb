class Animal < ApplicationRecord
  has_one_attached :photo
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  SPECIES = %w(Cachorro Gato)
  validates :specie, inclusion: { in: SPECIES }
  SIZE = %w(Pequeno Medio Grande)
  validates :size, inclusion: { in: SIZE }
  SEX = %w(Macho Fêmea)
  validates :sex, inclusion: { in: SEX }
  YESNO = %w(Sim Não)
  validates :health_castrated, inclusion: { in: YESNO }
  validates :health_vaccinated, inclusion: { in: YESNO }
  validates :health_dewormed, inclusion: { in: YESNO }
  validates :health_special, inclusion: { in: YESNO }
end
