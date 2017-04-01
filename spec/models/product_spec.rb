require 'rails_helper'

RSpec.describe Project, type: :model do
  def valid_attributes(new_attributes)
    attributes = {
      title: "Homework",
      description: "Learn stuff",
      due_date: '2017-04-01 00:00:00 -0000'
    }
    attributes.merge(new_attributes)
  end

  describe "validations" do
    context "title" do
      it 'requires a title' do
        project = Project.new(valid_attributes({ title: nil }))
        expect(project).to be_invalid
      end
      it 'requires title to be unique' do
        project = Project.new(valid_attributes({ title: "Homework" }))
        project2 = Project.new(valid_attributes({ title: "Homework" }))
        project.save
        expect(project2).to be_invalid
      end
    end

    context "due_date" do
      it "requires due_date to be greater than today's date" do
        project = Project.new(valid_attributes({ due_date: '2017-01-31 17:11:36 -0700' }))
        project.save
        expect(project.errors.messages).to have_key(:due_date)
      end
    end

  end
end
