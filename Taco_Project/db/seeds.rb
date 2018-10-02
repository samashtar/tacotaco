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
  {name: "bean"}
]

categories.each {|category| Category.create(category)}

ingredients = [
  {name: "lettuce", price: 0, calories: 0, category_id: Category.find_by(name: "topping").id},
  {name: "cheese", price: 0, calories: 0, category_id: Category.find_by(name: "topping").id},
  {name: "tomato", price: 0, calories: 0, category_id: Category.find_by(name: "topping").id},

  {name: "beef", price: 0, calories: 0, category_id: Category.find_by(name: "protein").id},
  {name: "chicken", price: 0, calories: 0, category_id: Category.find_by(name: "protein").id},
  {name: "tofu", price: 0, calories: 0, category_id: Category.find_by(name: "protein").id},

  {name: "multigrain", price: 0, calories: 0, category_id: Category.find_by(name: "tortilla").id},
  {name: "white", price: 0, calories: 0, category_id: Category.find_by(name: "tortilla").id},
  {name: "corn", price: 0, calories: 0, category_id: Category.find_by(name: "tortilla").id},
  {name: "gluten free", price: 0, calories: 0, category_id: Category.find_by(name: "tortilla").id},

  {name: "mild", price: 0, calories: 0, category_id: Category.find_by(name: "sauce").id},
  {name: "medium", price: 0, calories: 0, category_id: Category.find_by(name: "sauce").id},
  {name: "hot", price: 0, calories: 0, category_id: Category.find_by(name: "sauce").id},

  {name: "black", price: 0, calories: 0, category_id: Category.find_by(name: "bean").id},
  {name: "pinto", price: 0, calories: 0, category_id: Category.find_by(name: "bean").id}
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


tacoboutit =  Taco.create(name: "Taco 'bout it'")
lost_in_the_sauce = Taco.create(name: "Lost in the Sauce")
beanormous = Taco.create(name: "Beanormous")
cheese_louise = Taco.create(name: "Cheese Louise")
macho_taco = Taco.create(name: "Macho Taco")

cheese = Ingredient.find_by(name: "cheese")
chicken = Ingredient.find_by(name: "chicken")
black_beans = Ingredient.find_by(name: "black")
tomato = Ingredient.find_by(name: "tomato")
