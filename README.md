# Mofa's Kitchen Buddy

Mofa's Kitchen Buddy is a backend application that helps users manage their kitchen ingredients and suggests recipes based on the available ingredients at home. The system includes an API for managing ingredients, storing recipes, and integrating a chatbot to suggest recipes based on user preferences.

## Features

- **Ingredient Management**: Input, update, and retrieve ingredients in your kitchen.
- **Recipe Suggestions**: Suggest recipes based on the ingredients available in your kitchen.
- **Chatbot Integration**: A chatbot can interact with the user and suggest recipes based on cravings or specific dietary preferences (e.g., sweet dishes, specific cuisines).

## Technologies

- **Node.js**: JavaScript runtime for building scalable applications.
- **Express**: Web framework for Node.js used to build APIs.
- **Prisma**: ORM for interacting with PostgreSQL database.
- **PostgreSQL**: Relational database for storing ingredient and recipe data.
- **Google Gemini AI**: API for generating content and recipe recommendations based on user preferences.

## Setup

### Prerequisites

Before setting up the project, make sure you have the following installed:

- Node.js (v14 or higher)
- PostgreSQL
- Prisma CLI

### 1. Clone the repository

```bash
git clone (https://github.com/MdKaif2782/kuet-hackathon-preli)
cd Challenge-2

2. Install dependencies

Run the following command to install all necessary dependencies:

npm install

3. Set up environment variables

Create a .env file in the root directory and add your environment variables:

DATABASE_URL="your_database_url_here"
PORT=5000
GENAI_API_KEY="your_google_gemini_api_key_here"

4. Set up the database

    Run the Prisma migration command to create your database tables:

npx prisma migrate dev --name init

    Generate the Prisma client:

npx prisma generate

5. Run the application

Start the server:

npm start

The application will now be running on http://localhost:5000.
API Endpoints
1. POST /api/item

Create a new ingredient.
Request Body:

{
  "name": ["ingredient1", "ingredient2", "ingredient3"]
}

Response:

{
  "id": 1,
  "name": ["ingredient1", "ingredient2", "ingredient3"]
}

2. GET /api/item

Retrieve all available ingredients.
Response:

[
  {
    "id": 1,
    "name": ["ingredient1", "ingredient2"]
  },
  {
    "id": 2,
    "name": ["ingredient3", "ingredient4"]
  }
]

3. PUT /api/item/:id

Update an existing ingredient.
Request Body:

{
  "name": ["new_ingredient1", "new_ingredient2"]
}

Response:

{
  "id": 1,
  "name": ["new_ingredient1", "new_ingredient2"]
}


Recipes
1. GET /api/recipe

Retrieve all available recipes.
Example Response:

[
  {
    "id": 1,
    "name": "Pasta Primavera",
    "ingredients": "["pasta", "tomato", "garlic", "olive oil"]",
    "cuisine": "Italian",
    "taste": "Savory",
    "prep_time": "20 minutes",
    "reviews": 5
  },
  {
    "id": 2,
    "name": "Chocolate Cake",
    "ingredients": "["flour", "sugar", "cocoa", "butter"]",
    "cuisine": "American",
    "taste": "Sweet",
    "prep_time": "45 minutes",
    "reviews": 4
  }
]

2. POST /api/recipe

Create a new recipe.
Request Body:

{
  "name": "Chocolate Cake",
  "ingredients": ["flour", "sugar", "cocoa", "butter"],
  "cuisine": "American",
  "taste": "Sweet",
  "prep_time": "45 minutes",
  "reviews": 4
}

Response:

{
  "id": 3,
  "name": "Chocolate Cake",
  "ingredients": "[\"flour\", \"sugar\", \"cocoa\", \"butter\"]",
  "cuisine": "American",
  "taste": "Sweet",
  "prep_time": "45 minutes",
  "reviews": 4
}


When a new recipe is successfully added via the POST /api/recipe endpoint, it will be appended to a local text file named my_fav_recipes.txt. This file will store a textual representation of the recipe with details such as the name, ingredients, cuisine, taste, prep time, and reviews.



POST /generate

This endpoint generates a recipe based on user input preferences, such as cravings for a certain taste (e.g., sour, sweet, savory).
Request Body:

{
  "preference": "I want something sour today"
}





