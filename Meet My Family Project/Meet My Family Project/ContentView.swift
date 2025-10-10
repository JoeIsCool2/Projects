//
//  ContentView.swift
//  Meet My Family Project
//
//  Created by joseph wright on 10/9/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                AnimatedBackground()
                ScrollView{
                    VStack {
                        ProfileCard(
                            name: "Joe",
                            photo: "JoeProfilePic",
                            shortDescription: "He's pretty cool.",
                            longDescription: "Joe brings calm to chaos. He’s thoughtful, clever, and always ready to help. Whether it’s fixing a bug or planning a family hike, he’s the go-to guy who makes things happen without making a fuss.",
                            favoritFood: "Pizza — How to make it: Make a quick dough (2 cups flour, 1 tsp yeast, pinch of salt, warm water). Let rise 45–60 min. Stretch dough, top with crushed tomatoes, mozzarella, olive oil, and basil. Bake at 500°F (260°C) on a preheated stone or sheet for 8–10 minutes until blistered."
                        )

                        ProfileCard(
                            name: "Reagan",
                            photo: "ReaganProfilePic",
                            shortDescription: "Always up to something interesting.",
                            longDescription: "Reagan’s curiosity is contagious. She’s constantly exploring new hobbies, diving into creative projects, and finding ways to make life more fun for everyone around her. Her energy keeps the family on its toes.",
                            favoritFood: "Sushi Bowl — How to make it: Cook sushi rice and season with rice vinegar, sugar, and salt. Top with sliced salmon or tuna (or tofu), cucumber, avocado, nori strips, and sesame. Drizzle soy sauce and a little spicy mayo."
                        )

                        ProfileCard(
                            name: "Ella",
                            photo: "EllaProfilePic",
                            shortDescription: "Loves to laugh and lead the way.",
                            longDescription: "Ella is a natural leader with a big heart. She’s the first to organize a game night, rally the crew for an adventure, or crack a joke that gets everyone laughing. Her warmth and confidence make her unforgettable.",
                            favoritFood: "Pasta Alfredo — How to make it: Cook fettuccine in salted water. In a pan, melt butter, add cream, simmer, then whisk in grated Parmesan. Toss pasta with sauce, season with salt, pepper, and parsley."
                        )

                        ProfileCard(
                            name: "Max",
                            photo: "MaxProfilePic",
                            shortDescription: "Quiet thinker with a wild side.",
                            longDescription: "Max might seem reserved at first, but his imagination runs deep. He’s the kind of person who surprises you with brilliant ideas, unexpected humor, and a fearless streak when it’s time to take a leap.",
                            favoritFood: "Smash Burgers — How to make it: Heat a cast-iron skillet until smoking. Roll ground beef into balls, smash onto the pan, season with salt/pepper, cook 1–2 minutes per side. Add cheese, stack on toasted buns with pickles and sauce."
                        )

                        ProfileCard(
                            name: "Lucy",
                            photo: "LucyProfilePic",
                            shortDescription: "Creative, curious, and full of heart.",
                            longDescription: "Lucy sees the world through a lens of wonder. Whether she’s sketching, storytelling, or asking thoughtful questions, she brings a spark of creativity and kindness that makes every moment feel special.",
                            favoritFood: "Mac & Cheese — How to make it: Cook elbow macaroni. Make a roux with butter and flour, whisk in milk to a smooth sauce, melt in cheddar and a little Gruyère. Combine with pasta, top with breadcrumbs, and bake until golden."
                        )

                        ProfileCard(
                            name: "Bizzy",
                            photo: "BizzyProfilePic",
                            shortDescription: "Keeps everyone on their toes.",
                            longDescription: "Bizzy is a whirlwind of energy and wit. She’s sharp, spontaneous, and always ready to stir things up in the best way. Her bold personality and quick comebacks make her the life of any room.",
                            favoritFood: "Loaded Nachos — How to make it: Layer tortilla chips with shredded cheese, black beans, and jalapeños. Bake until melty. Top with pico de gallo, avocado, sour cream, and a squeeze of lime."
                        )

                        ProfileCard(
                            name: "Tim",
                            photo: "TimProfilePic",
                            shortDescription: "Chill vibes and clever comebacks.",
                            longDescription: "Tim is effortlessly cool. He’s laid-back but never checked out — always listening, always ready with a clever remark or a surprising insight. He’s the quiet anchor who keeps things grounded.",
                            favoritFood: "Steak & Fries — How to make it: Salt steak and let it come to room temp. Sear in a hot skillet with butter and garlic to desired doneness; rest. Bake or air-fry fries until crisp. Serve with a simple pan sauce."
                        )

                        ProfileCard(
                            name: "Jamie",
                            photo: "JamieProfilePic",
                            shortDescription: "Big energy, bigger imagination.",
                            longDescription: "Jamie lives in full color. Whether it’s a wild idea, a dramatic performance, or a spontaneous adventure, Jamie brings joy and creativity to everything. You never know what’s next — and that’s the fun of it.",
                            favoritFood: "Pancakes — How to make it: Mix 1 cup flour, 1 tbsp sugar, 1 tsp baking powder, pinch of salt. Whisk in 1 egg, 3/4 cup milk, 1 tbsp melted butter. Cook on a buttered griddle until bubbles form; flip and finish. Serve with fruit and syrup."
                        )
                    }
                }.navigationTitle("My Family")
            }
        }
    }
}


#Preview {
    ContentView()
}
