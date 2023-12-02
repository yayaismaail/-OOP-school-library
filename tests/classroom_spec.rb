require 'rspec'
require './classroom'
require './student'

describe Classroom do
  let(:classroom_label) { 'Geography' }
  let(:student1) { Student.new(20, 'Ted', true) }
  let(:student2) { Student.new(23, 'Stu', false) }
  let(:classroom) { Classroom.new(classroom_label) }

  # Describe initialization
  describe '#initialize' do
    it 'creates a new classroom with a label' do
      expect(classroom.label).to eq(classroom_label)
    end

    it 'initializes an empty array of students' do
      expect(classroom.students).to eq([])
    end
  end

  
end
