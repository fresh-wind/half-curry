class Food_and_recipe

    def food_data_creater
        # 旬の食材情報取得
        foods = Food.new().get_foods()
        # レシピ一覧情報取得
        recipes = Recipe.new().get_recipes()
        
        # 食材名, レシピ一覧URL, 旬の季節, 旬の期間を保持する構造体
        food_data = Struct.new("SeasonalFoodData", :name, :url, :seasonal_start, :seasonal_end)
    
        # 食材データを保持する配列生成
        food_data_array = []
        
        for i in 0..(recipes.length-1) do
    
            recipe_category_name = recipes[i]["categoryName"]
            recipe_url = recipes[i]["categoryUrl"]
            is_include = false
    
            for j in 0..(foods.length) do
                if(foods[j].title == recipe_category_name) then
                    is_include = true
                    break
                end
            end
    
            # カテゴリ名と旬の食材名が一致した場合
            if is_include == true then
                food_data.new(recipe_category_name, recipe_url, food.start, food.end)
                food_data_array.push(food_data)
            end
        end
        puts food_data_array
#        return food_data_array
    end
end