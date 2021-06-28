class Bug < ApplicationRecord

  has_one_attached :screenshot
  validates :title, :uniqueness => true, :presence => true
  validates :bug_type, :presence => true
  validate :correct_image_type

  belongs_to :project
  belongs_to :created_by, class_name: "User"
  # belongs_to :user
  belongs_to :solved_by, class_name: "User", optional: true
  # belongs_to :user

  enum bug_type: {
    feature: 0,
    bug: 1
  }
  
  enum feature_status: {
    new_feature: 0,
    started_feature: 1,
    completed: 2
  }

  enum bug_status: {
    new_bug: 0,
    started_bug: 1,
    resolved: 2
  }

  private

  def correct_image_type
    if screenshot.attached? && !screenshot.content_type.in?(%w(image/png image/gif))
      # screenshot.purge # delete the uploaded file
      errors.add(:screenshot, 'Must be a PNG or a GIF file')
    end
  end

end
