# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
begin 

ChecklistItem.delete_all
Checklist.delete_all
Item.delete_all
Category.delete_all

categories = {
  'Server Backups' => ['DTL Master Backup', 'DTL Host Backup', 'Mohammed Folder Backup', 'Accounts Folder'],
  'Printers' => ['Kyocera TaskAlfa 358ci', 'Kyocera TaskAlfa 4012i'],
  'CCTV' => ['Entry Gate Projection', 'MD Screen Projection', 'Maintenance Projection', 'CCTV Backup'],
  'Applications over the network' => ['SAP Business One All Users', 'Microsoft Office All Users', 'Email on All Users', 'Biometric Device Cock-ins Recorded'],
  'Managing Directors Office' =>  ['Computer', 'Printer'],
  'Server Room' => ['AC working okay', 'Firewall Monitor Logs', 'Kaspersky Security Center Logs'],
  'Others' => ['Boardroom AC Working Okay', 'Mohammed AC Working Okay']
}

categories.each do |category_name, items|
  category = Category.create!(name: category_name)
  items.each do |item_name|
    Item.create!(name: item_name, category: category)
  end
end

Rails.logger.info("Data seeding was successful.")

puts "Data seeding was successful."

rescue => e
Rails.logger.error("Data seeding failed: #{e.message}")

puts "Data seeding failed: #{e.message}"
end
