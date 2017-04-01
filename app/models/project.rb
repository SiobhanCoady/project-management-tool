class Project < ApplicationRecord
  validates(:title, { presence: true, uniqueness: true })
  validates(:due_date, { presence: true })

  validate :due_date_is_in_future

  private

  def due_date_is_in_future
    if due_date < Time.now
      errors.add(:due_date, "Date must be in the future")
    end
  end
end
