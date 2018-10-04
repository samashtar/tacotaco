User.destroy_all
Ingredient.destroy_all
Category.destroy_all
Taco.destroy_all
Location.destroy_all

categories = [
  {name: "protein"},
  {name: "topping"},
  {name: "tortilla"},
  {name: "sauce"},
  {name: "bean"},
  {name: "rice"}
]

categories.each {|category| Category.create(category)}

ingredients = [
  {name: "lettuce", price: 0, calories: 5, category_id: Category.find_by(name: "topping").id},
  {name: "cheese", price: 0, calories: 113, category_id: Category.find_by(name: "topping").id},
  {name: "tomato", price: 0, calories: 22, category_id: Category.find_by(name: "topping").id},
  {name: "guacamole", price: 0.25, calories: 155, category_id: Category.find_by(name: "topping").id},
  {name: "fajita veggies", price: 0, calories: 30, category_id: Category.find_by(name: "topping").id},
  {name: "queso", price: 0.25, calories: 113, category_id: Category.find_by(name: "topping").id},
  {name: "corn", price: 0, calories: 85, category_id: Category.find_by(name: "topping").id},

  {name: "beef", price: 0, calories: 213, category_id: Category.find_by(name: "protein").id},
  {name: "chicken", price: 0, calories: 335, category_id: Category.find_by(name: "protein").id},
  {name: "chorizo", price: 0, calories: 206, category_id: Category.find_by(name: "protein").id},
  {name: "tofu", price: 0, calories: 94, category_id: Category.find_by(name: "protein").id},

  {name: "multigrain", price: 0, calories: 60, category_id: Category.find_by(name: "tortilla").id},
  {name: "white", price: 0, calories: 70, category_id: Category.find_by(name: "tortilla").id},
  {name: "corn", price: 0, calories: 65, category_id: Category.find_by(name: "tortilla").id},
  {name: "gluten free", price: 0.25, calories: 60, category_id: Category.find_by(name: "tortilla").id},

  {name: "mild", price: 0, calories: 0, category_id: Category.find_by(name: "sauce").id},
  {name: "medium", price: 0, calories: 0, category_id: Category.find_by(name: "sauce").id},
  {name: "hot", price: 0, calories: 0, category_id: Category.find_by(name: "sauce").id},

  {name: "black", price: 0, calories: 162, category_id: Category.find_by(name: "bean").id},
  {name: "pinto", price: 0, calories: 142, category_id: Category.find_by(name: "bean").id},

  {name: "brown rice", price: 0, calories: 216, category_id: Category.find_by(name: "rice").id},
  {name: "white rice", price: 0, calories: 206, category_id: Category.find_by(name: "rice").id},
]

ingredients.each {|ingredient| Ingredient.create(ingredient)}

locations = [
  {address: "dupont circle",
  phone_number: 5555739283,
  email: "dupont@tacos.com",
  name: "Dupont Circle"},
  {address: "southwest",
  phone_number: 5559874273,
  email: "southwest@tacos.com",
  name: "Southwest Location"},
  {address: "metro center",
  phone_number: 5557388372,
  email: "metrocenter@tacos.com",
  name: "Metro Center"}
]

locations.each {|location| Location.create(location)}

users = [
  {name: "Patti",
    username: "patti",
    password: "password",
    email: "patti@gmail.com",
    address: "somewhere in dc",
    phone_number: 5555379372,
    location_id: Location.find_by(address: "southwest").id,
    taco_points: 0},
  {name: "Sam",
    username: "samtheham",
    password: "password",
    email: "sam@gmail.com",
    address: "somewhere in virginia",
    phone_number: 5552342986,
    location_id: Location.find_by(address: "metro center").id,
    taco_points: 0},
  {name: "Barack",
    username: "baracktherock",
    password: "password",
    email: "bobama@whitehouse.gov",
    address: "somewhere in dc",
    phone_number: 5558783729,
    location_id: Location.find_by(address: "dupont circle").id,
    taco_points: 0},
]

users.each {|user| User.create(user)}

cheese = Ingredient.find_by(name: "cheese")
chicken = Ingredient.find_by(name: "chicken")
tofu = Ingredient.find_by(name: "tofu")
beef = Ingredient.find_by(name: "beef")
black_beans = Ingredient.find_by(name: "black")
tomato = Ingredient.find_by(name: "tomato")
brown_rice = Ingredient.find_by(name: "brown rice")
guacamole = Ingredient.find_by(name: "guacamole")
medium = Ingredient.find_by(name: "medium")
multigrain = Ingredient.find_by(name: "multigrain")

tacoboutit =  Taco.create(
  name: "Taco 'bout it'",
  protein: chicken.id,
  toppings: [guacamole.id, cheese.id],
  sauces: [medium.id],
  bean: black_beans.id,
  rice: brown_rice.id,
  tortilla: multigrain.id)
lost_in_the_sauce = Taco.create(
  name: "Lost in the Sauce",
  protein: chicken.id,
  toppings: [guacamole.id, cheese.id],
  sauces: [medium.id],
  bean: black_beans.id,
  rice: brown_rice.id,
  tortilla: multigrain.id)
beanormous = Taco.create(
  name: "Beanormous",
  protein: chicken.id,
  toppings: [guacamole.id, cheese.id],
  sauces: [medium.id],
  bean: black_beans.id,
  rice: brown_rice.id,
  tortilla: multigrain.id)
cheese_louise = Taco.create(
  name: "Cheese Louise",
  protein: chicken.id,
  toppings: [guacamole.id, cheese.id],
  sauces: [medium.id],
  bean: black_beans.id,
  rice: brown_rice.id,
  tortilla: multigrain.id)
macho_taco = Taco.create(
  name: "Macho Taco",
  protein: chicken.id,
  toppings: [guacamole.id, cheese.id],
  sauces: [medium.id],
  bean: black_beans.id,
  rice: brown_rice.id,
  tortilla: multigrain.id)
