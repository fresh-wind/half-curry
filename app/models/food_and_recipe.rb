class Food_and_recipe

    def three_food_data_creater
        # 旬の食材情報取得
        foods = Food.new().get_foods_array()
        # レシピ一覧情報取得
        recipes = Recipe.new().get_recipes()
        
        food_data = Struct.new("SeasonalFoodData", :name, :url, :seasonal_start, :seasonal_end)
        food_data_array = []

        # 食材情報の配列を生成
        for i in 0..(recipes.length-1) do
            recipe_category_name = recipes[i]["categoryName"]
            recipe_url = recipes[i]["categoryUrl"]
            is_include = false

            foods.each do |items|
                food_info = items.to_a

                # TODO いずれキーで値をとれるような配列アクセスにしたい
                title = food_info[0][1]
                event_start = food_info[1][1]
                event_end = food_info[2][1]

                if(title == recipe_category_name) then
                    is_include = true
                    food_data_struct = food_data.new(recipe_category_name, recipe_url, event_start, event_end)
                    food_data_array.push(food_data_struct)
                    break
                end
            end
        end

        # ランダムに3つ食材情報を生成
        result_array = []
        for i in 1..3 do
            random = Random.new
            random_num = random.rand(0..food_data_array.length-1)
            result_array.push(food_data_array[random_num])
        end
        
        puts "*************************************************************************"
        for i in 0..result_array.length-1 do
            puts result_array[i][:name]
        end
        puts "*************************************************************************"
        
        return result_array
    end
    
end