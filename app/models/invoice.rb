class Invoice < ApplicationRecord
  belongs_to :user

  enum status: { in_progress: 0, finished: 1 }

  validates :amount_cents, presence: true, numericality: { greater_than: 0 }
  validates :due_date, presence: true

  monetize :amount_cents

  scope :in_progress, -> { where(status: :in_progress) }
  scope :finished, -> { where(status: :finished) }
end
