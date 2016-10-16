class Pledge < ActiveRecord::Base
  belongs_to :donation
  belongs_to :user
  belongs_to :project
  belongs_to :cart
  validates :amount, :user_id, presence: true

    scope :recent, -> { order('created_at DESC') }
    
    def total_amount
     self.amount += cart.amount.to_i
    end

   #def total_estimate
     #to add form for pledge amount or implement it here
     #project.estimate/1000 * interval
    #end
end
