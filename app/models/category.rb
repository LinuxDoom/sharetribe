class Category < ActiveRecord::Base

  # Classification module contains methods that are common to Category and ShareType
  include Classification

  has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id"
  # children is a more generic alias for sub categories, used in classification.rb
  has_many :children, :class_name => "Category", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Category"
  has_many :community_categories, :dependent => :destroy 
  has_many :communities, :through => :community_categories
  has_many :listings
  has_many :translations, :class_name => "CategoryTranslation", :dependent => :destroy

  has_many :category_custom_fields, :dependent => :destroy
  has_many :custom_fields, :through => :category_custom_fields

  has_many :category_transaction_types, :dependent => :destroy
  has_many :transaction_types, :through => :category_transaction_types
  

end
