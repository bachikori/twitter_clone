# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!([
               { id: 1, email: 'test1@example.com', password: 'bbbbbb', nickname: '太郎', uid: SecureRandom.uuid, user_image: 'apple.png',
                 confirmed_at: Time.zone.now },
               { id: 2, email: 'test2@example.com', password: 'cccccc', nickname: '一郎', uid: SecureRandom.uuid, user_image: 'apple.png',
                 confirmed_at: Time.zone.now },
               { id: 3, email: 'test3@example.com', password: 'dddddd', nickname: '二郎', uid: SecureRandom.uuid, user_image: 'apple.png',
                 confirmed_at: Time.zone.now },
               { id: 4, email: 'test4@example.com', password: 'eeeeee', nickname: '三郎', uid: SecureRandom.uuid, user_image: 'apple.png',
                 confirmed_at: Time.zone.now },
               { id: 5, email: 'test5@example.com', password: 'ffffff', nickname: '四郎', uid: SecureRandom.uuid, user_image: 'apple.png',
                 confirmed_at: Time.zone.now },
               { id: 6, email: 'test6@example.com', password: 'gggggg', nickname: '五郎', uid: SecureRandom.uuid, user_image: 'apple.png',
                 confirmed_at: Time.zone.now },
               { id: 7, email: 'test7@example.com', password: 'hhhhhh', nickname: '六郎', uid: SecureRandom.uuid, user_image: 'apple.png',
                 confirmed_at: Time.zone.now }
             ])
Tweet.create!([
                { tweet: 'おはようございます', user_id: 1 },
                { tweet: 'おはようございます', user_id: 1 },
                { tweet: 'こんにちは', user_id: 2 },
                { tweet: 'おはようございます', user_id: 1 },
                { tweet: 'こんにちは', user_id: 2 },
                { tweet: 'こんにちは', user_id: 2 },
                { tweet: '初めまして', user_id: 3 },
                { tweet: '初めまして', user_id: 3 },
                { tweet: '初めまして', user_id: 3 },
                { tweet: 'こんばんは', user_id: 4 },
                { tweet: 'こんばんは', user_id: 4 },
                { tweet: 'こんばんは', user_id: 4 },
                { tweet: 'よろしくお願いします', user_id: 5 },
                { tweet: 'よろしくお願いします', user_id: 5 },
                { tweet: 'よろしくお願いします', user_id: 5 },
                { tweet: 'いただきます', user_id: 6 },
                { tweet: 'いただきます', user_id: 6 },
                { tweet: 'いただきます', user_id: 6 },
                { tweet: 'ごちそうさまです', user_id: 7 },
                { tweet: 'ごちそうさまです', user_id: 7 },
                { tweet: 'ごちそうさまです', user_id: 7 }
              ])
Relationship.create!([
                       { follower_id: 1, followed_id: 2 },
                       { follower_id: 1, followed_id: 5 },
                       { follower_id: 2, followed_id: 3 },
                       { follower_id: 2, followed_id: 4 },
                       { follower_id: 3, followed_id: 1 },
                       { follower_id: 3, followed_id: 6 },
                       { follower_id: 3, followed_id: 7 }
                     ])
