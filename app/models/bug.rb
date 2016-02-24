class Bug < ActiveRecord::Base
    belongs_to :user
    validates :title, presence: true, length: {minimum: 5, maximum: 80}
    validates :description, presence: true, length: {minimum: 20, maximum: 600}
    
    enum status: [:open, :closed, :monitor]
    enum issue_type: [:issue, :enhancement, :feature]
    enum priority: [:low, :meduium, :high]
end
