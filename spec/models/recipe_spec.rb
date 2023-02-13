require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user1) do
    User.create(
      name: 'Tom'
    )
  end

  let(:recipe) do
    Recipe.create(
      user: user1,
      name: "chicken stew",                                                
      preparation_time: 10,                                              
      cooking_time: 15,
      description: "Very hot and spicy",
      public: "dodo",
    )
  end

  it 'The user should be present' do
    recipe.user = nil
    expect(recipe).to_not be_valid
  end

  it 'title must not be blank' do
    recipe.name = nil
    expect(recipe).to_not be_valid
  end

  it 'title between 3 and 250 should be valid' do
    recipe.description = "Very hot and spicy"
    expect(recipe).to be_valid
  end

  it 'Preparation time must be an integer' do
    recipe.preparation_time = 10
    expect(recipe).to be_valid
  end

  it 'Working time must be an integer' do
    recipe.cooking_time = 15
    expect(recipe).to be_valid
  end
end
