class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :short_description, :long_description, :goal, :backers, :pledged, :progress
  
  def backers
    Refinery::Orders::Order.pledgers
  end

  def pledged
    Refinery::Orders::Order.pledged
  end

  def progress
    Refinery::Orders::Order.pledged/(object.goal/100)
  end
end