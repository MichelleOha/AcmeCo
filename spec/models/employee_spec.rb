require 'rails_helper'

RSpec.describe Employee, type: :model do
  context 'validations' do
    it 'is valid with all attributes' do
      employee = Employee.new(first_name: 'test', last_name: 'employee', email: 'testemployee@example.com')
      expect(employee).to be_valid
    end

    it 'is not valid without a first name' do
      employee = Employee.new( last_name: 'employee', email: 'testemployee@example.com')
      expect(employee).to_not be_valid
      expect(employee.errors[:first_name]).to include('Please add a first name!')
    end

    it 'is not valid without a last name' do
      employee = Employee.new( first_name: 'test', email: 'testemployee@example.com')
      expect(employee).to_not be_valid
      expect(employee.errors[:last_name]).to include('Please add a last name!')
    end

    it 'is not valid without an email address' do
      employee = Employee.new(first_name: 'test', last_name: 'employee')
      expect(employee).to_not be_valid
      expect(employee.errors[:email]).to include("can't be blank")
    end

    it 'is not valid with an already existing email address' do
      Employee.create(first_name: 'test', last_name: 'employee', email: 'testemployee@example.com')
      employee = Employee.new(first_name: 'test', last_name: 'employee', email: 'testemployee@example.com')
      expect(employee).to_not be_valid
      expect(employee.errors[:email]).to include('has already been taken')
    end

    it 'is not valid with an invalid email format' do
      employee = Employee.new(first_name: 'test', last_name: 'employee', email: 'invalid_email')
      expect(employee).to_not be_valid
      expect(employee.errors[:email]).to include('is invalid')
    end

  end
end
