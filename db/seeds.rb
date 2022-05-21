# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

100.times do
  items = Item.create(
    name: "#{Faker::Commerce.product_name}",
    description: "#{Faker::Lorem.paragraph}",
    deleted_at: nil
  )
  items.save
end

puts "Created #{Item.count} items"

# 20.times do
#   comments = Comment.create(
#     body: "#{Faker::Lorem.paragraph}",
#     item_id: Item.deleted.ids.map(&:to_s) ,
#   )
#   comments.save
# end

# puts "Created #{Comment.count} comments"