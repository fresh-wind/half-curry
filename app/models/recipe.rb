require 'net/http'
require 'uri'
require 'json'

#レシピ検索カテゴリ情報を取得
uri = URI.parse('https://app.rakuten.co.jp/services/api/Recipe/CategoryList/20121121?format=json&applicationId=1071761952832394228')
json = Net::HTTP.get(uri)
recipe = JSON.parse(json)

#カテゴリ情報の中身を確認してみる
#puts recipe["result"]["large"][0]

puts "---large-----------------"
for i in 0..(recipe["result"]["large"].length-1) do
    print "No." + (i+1).to_s + " "
    print recipe["result"]["large"][i]["categoryName"] + " "
    puts recipe["result"]["large"][i]["categoryUrl"]
end

#puts "---medium-----------------"
#for i in 0..(recipe["result"]["medium"].length-1) do
#    print "No." + i.to_s + " "
#    print recipe["result"]["medium"][i]["categoryName"] + " "
#    puts recipe["result"]["medium"][i]["categoryUrl"]
#end

#puts "---small-----------------"
#for i in 0..(recipe["result"]["small"].length-1) do
#    print "No." + i.to_s + " "
#    print recipe["result"]["small"][i]["categoryName"] + " "
#    puts recipe["result"]["small"][i]["categoryUrl"]
#end
