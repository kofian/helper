class Cart < ActiveRecord::Base
  has_many :pledges, dependent: :destroy
 
  attr_accessor :amount  

  def add_project(project_id)
  current_pledge = pledges.find_by(project_id: project_id)
   if current_pledge
    current_pledge.interval += 1
    #current_pledge.amount += amount.to_i
   else
    #current_pledge = pledges.amount
    current_pledge = pledges.build(project_id: project_id)
   end
    current_pledge
  end
 
 
  def total_estimate
    #pledges.to_a.sum { |pledge| pledge.total_estimate }
     pledges.to_a.sum { |pledge| pledge.total_amount }
  end
end
