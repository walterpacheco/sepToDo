class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :completes
  has_many :lists, through: :completes

  after_create :task_assignment

  def task_assignment
    List.all.each do |list|
      self.lists << list
    end
  end
  def completes_count
    self.completes.where(listo: true).count
  end
  end
