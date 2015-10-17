require 'net/http'
require 'uri'
require 'json'

class Recipe
    
    def get_recipes
        #レシピ検索カテゴリ情報を取得
        uri = URI.parse('https://app.rakuten.co.jp/services/api/Recipe/CategoryList/20121121?format=json&applicationId=1071761952832394228')
        json = Net::HTTP.get(uri)
        recipe = JSON.parse(json)
        
        return recipe["result"]["small"]
    end
end
