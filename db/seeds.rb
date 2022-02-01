# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = User.create([{ name: "John", postscounter: 0}, { name: "Jane", postscounter: 0}])
posts = Post.create([{ title: "First Post", text: "This is the first post", author_id: 1, comments_counter: 0, likes_counter: 0}, { title: "Second Post", text: "This is the second post", author_id: 2, comments_counter: 0, likes_counter: 0}])