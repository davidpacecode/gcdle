# lib/tasks/import.rake
namespace :import do
  desc "Import 5 lettter word list from CSV"
  task five_letter_word_list: :environment do
    require "csv"

    csv_file = Rails.root.join("data", "words.csv")

    puts "Importing five letter word list from #{csv_file}"
    count = 0

    CSV.foreach(csv_file, headers: true) do |row|
      word = Word.find_or_initialize_by(
        value: row["value"]
      )

      if word.save
        count += 1
      else
        puts "Error importing row: #{row.inspect}"
        puts word.errors.full_messages.join(", ")
      end
    end

    puts "Imported #{count} words successfully!"
  end
end
