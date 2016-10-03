require 'rails_helper'

RSpec.describe Project, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "must not have empty attributes" do
   project = Project.new
   expect(project).to be_valid
  end

  it "must not have empty title attribute" do
   project = Project.new(title: " ", description: "Sir francis drake ", image_url: "drake.png", estimate: 1.00)
   expect(project).to_not be_valid
   expect(project.errors[:title]).to eq(["can't be blank"])
  end

  it "must not have empty description attribute" do
   project = Project.new(title: "New world", description: " ", image_url: "drake.png", estimate: 1.00)
   expect(project).to_not be_valid
   expect(project.errors[:description]).to eq(["can't be blank"])
  end

  it "must not have empty image_url attribute" do
   project = Project.new(title: "New world", description: "Sir Francis Drake", estimate: 1.00)
   project.image_url = "kik"
   expect(project).to_not be_valid
   expect(project.errors[:image_url]).to eq(["must be a URL for GIF, JPG or PNG image."])
  end

  it "must have positive estimate attribute" do
   project = Project.new(title: "New world", description: "Sir Francis Drake", image_url: "drake.png")
   project.estimate = -1
   expect(project).to_not be_valid
   #expect([project.errors]).to eq(["must be greater than or equal to 0.01"])
   expect(project.errors[:estimate]).to eq(["must be greater than or equal to 0.01"])
  end

  it "must have more than zero as estimate attribute" do
   project = Project.new(title: "New world", description: "Sir Francis Drake", image_url: "drake.png")
   project.estimate = 0
   expect(project).to_not be_valid
   expect(project.errors[:estimate]).to eq([ "must be greater than or equal to 0.01" ])
   
  end
end
