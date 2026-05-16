# Travel Agency Knowledge Base - Mock Travel Packages

This document contains mock internal travel-agency package data for a RAG-based AI Travel Package Builder demo. The assistant must use these packages, rules, and policies when generating customer-ready itineraries and internal travel-agent summaries.

---

## Global Business Rules

### Package Selection Rules
- Always select a package that matches the customer's destination, budget, travel style, number of travelers, and interests.
- If more than one package matches, prioritize the package with the highest customer fit and margin.
- Do not recommend a package if the customer budget is more than 15% below the package's minimum expected cost.
- For relaxed travelers, avoid more than three scheduled activities per day.
- For adventure travelers, include at least one outdoor or active experience when weather allows.
- For family travelers, avoid late-night-only activities and prioritize safe, convenient, low-walking routes.
- For romantic/couple travelers, prioritize scenic viewpoints, premium dining, shows, and relaxed pacing.
- For food-focused travelers, include at least one signature local food experience.
- If the customer mentions "premium", "luxury", or "special occasion", prioritize partner hotels and high-margin add-ons.
- If the customer mentions "budget", "cheap", or "affordable", select lower-cost activities and avoid premium upsells unless requested.

### Weather Rules
- If maximum temperature is above 95°F / 35°C, schedule outdoor activities before 11:00 AM or after 6:00 PM.
- If rain probability is above 50%, replace outdoor activities with indoor alternatives such as museums, shows, food halls, shopping districts, or cultural venues.
- If UV index is high, avoid long midday walking tours.
- If the destination is hot and the traveler wants a relaxed style, include hotel rest time or indoor breaks.
- Outdoor scenic activities should be marked as weather-dependent.

### Budget Rules
- The generated package must show whether it is within budget, near budget, or above budget.
- If estimated package cost is within 10% of the budget, label it "Within budget".
- If estimated package cost is 10% to 20% above budget, label it "Slightly above budget" and suggest removing one optional add-on.
- If estimated package cost is more than 20% above budget, select a different package or recommend a shorter itinerary.
- Upsells must be presented as optional, not mandatory.

### Partner Vendor Rules
- Prefer partner hotels when budget allows.
- Prefer partner restaurants when they match the customer's food preferences.
- Prefer partner tours when they improve margin without reducing customer fit.
- If customer requests premium experience, include one high-margin partner add-on.
- If customer requests budget experience, avoid high-margin luxury add-ons unless there is remaining budget.

### Internal Agent Summary Rules
Every response must include:
- Selected package name.
- Fit score from 0 to 100.
- Budget status.
- Business rules applied.
- Recommended upsell.
- Risk flags.
- Reason the package was selected.
- Suggested next action for the travel agent.

---

## Customer Preference Tags

Use these tags to match packages:
- romantic
- relaxed
- family
- adventure
- food
- culture
- music
- nightlife
- scenic
- luxury
- budget
- first-time visitor
- low walking
- outdoors
- shopping
- shows
- wellness
- national parks
- city highlights

---

# Package 001: Vegas Couple Escape

## Basic Information
- Package ID: PKG-LAS-001
- Destination: Las Vegas, Nevada
- Duration: 3 days / 2 nights
- Best For: Couples, romantic trips, first-time Las Vegas visitors, show lovers
- Travel Style: Premium but relaxed
- Customer Tags: romantic, relaxed, shows, good food, scenic, nightlife, first-time visitor
- Budget Range: 1800 to 2400 USD per couple
- Estimated Base Cost: 1850 USD per couple
- Expected Margin: 18%
- Priority Level: High
- Partner Package: Yes

## Package Description
A romantic Las Vegas weekend designed for couples who want a premium but relaxed experience. The package includes a partner hotel near the Strip, scenic evening experiences, one premium show recommendation, and optional luxury add-ons.

## Included Experience Types
- Partner hotel near the Strip
- Relaxed dinner recommendation
- Bellagio fountains or Strip evening walk
- Morning scenic activity
- Premium evening show
- Brunch or light shopping

## Sample Itinerary
### Day 1
- Arrive in Las Vegas.
- Check in at partner hotel near the Strip.
- Relax at the hotel.
- Evening dinner near Bellagio or Caesars Palace.
- Watch Bellagio fountains and enjoy a short relaxed walk.

### Day 2
- Morning visit to Red Rock Canyon or scenic viewpoint.
- Afternoon rest at hotel or optional spa time.
- Evening premium show such as Cirque-style performance, concert, or magic show.
- Late dessert or lounge stop if customer prefers nightlife.

### Day 3
- Late breakfast or brunch.
- Light shopping or photo stop.
- Check out and depart.

## Destination Rules
- Red Rock Canyon should be scheduled in the morning during hot weather.
- Avoid pairing Grand Canyon day trip with a late-night show on a 3-day relaxed trip.
- Avoid more than three scheduled activities per day for relaxed couples.
- If customer wants nightlife, suggest one optional late-night activity, not multiple.
- For low-walking customers, keep activities close to the Strip.

## Partner Rules
- Prioritize partner hotels near the Strip when customer budget is above 1800 USD.
- Recommend partner show tickets if available.
- Recommend partner dinner venues only if customer mentions premium dining or romantic dining.

## Upsell Options
- VIP show tickets
- Helicopter night tour
- Premium restaurant reservation
- Spa package
- Private airport transfer

## Risk Flags
- Outdoor activities may be uncomfortable during extreme heat.
- Premium shows may increase cost above budget.
- Some Strip walking can be tiring for low-walking travelers.

## Recommended Internal Summary
Selected because it matches romantic, relaxed, scenic, good food, and show-based intent. This package has high customer appeal and strong upsell potential through VIP show tickets or helicopter night tours.

---

# Package 002: Vegas Budget Highlights

## Basic Information
- Package ID: PKG-LAS-002
- Destination: Las Vegas, Nevada
- Duration: 3 days / 2 nights
- Best For: Budget travelers, friends, first-time visitors
- Travel Style: Affordable and energetic
- Customer Tags: budget, nightlife, shows, shopping, first-time visitor
- Budget Range: 900 to 1400 USD per couple
- Estimated Base Cost: 1100 USD per couple
- Expected Margin: 10%
- Priority Level: Medium
- Partner Package: Partial

## Package Description
An affordable Las Vegas trip for travelers who want the main Vegas experience without premium pricing. It focuses on free attractions, budget dining, casual entertainment, and flexible exploration.

## Included Experience Types
- Budget-friendly hotel recommendation
- Free Strip attractions
- Casual food court or local dining
- Optional affordable show
- Shopping or photo stops

## Sample Itinerary
### Day 1
- Arrive and check in.
- Explore the Strip.
- Visit Bellagio fountains, Venetian canals, and photo spots.
- Casual dinner.

### Day 2
- Morning visit to Welcome to Fabulous Las Vegas sign.
- Afternoon shopping at outlet mall or hotel pool time.
- Evening affordable show or live entertainment.

### Day 3
- Brunch.
- Free time.
- Depart.

## Destination Rules
- Prioritize free attractions and low-cost entertainment.
- Avoid premium dining unless customer asks.
- Avoid expensive add-ons if customer budget is below 1200 USD.
- Keep transportation simple.

## Upsell Options
- Affordable show tickets
- Outlet shopping shuttle
- Casual food tour

## Risk Flags
- Budget hotels may be farther from premium Strip locations.
- Event tickets can change package cost quickly.

---

# Package 003: Austin Food and Music Weekend

## Basic Information
- Package ID: PKG-AUS-001
- Destination: Austin, Texas
- Duration: 3 days / 2 nights
- Best For: Food lovers, music fans, couples, friends
- Travel Style: Relaxed local culture
- Customer Tags: food, music, relaxed, culture, outdoors, couples, weekend
- Budget Range: 1200 to 1700 USD per couple
- Estimated Base Cost: 1350 USD per couple
- Expected Margin: 15%
- Priority Level: High
- Partner Package: Yes

## Package Description
A relaxed Austin weekend built around barbecue, food trucks, live music, outdoor views, and local neighborhoods. Good for customers who want authentic local culture without a rushed schedule.

## Included Experience Types
- Downtown or South Congress hotel
- BBQ or food truck experience
- Lady Bird Lake walk or kayaking
- Live music evening
- Coffee or brunch experience
- Optional Hill Country add-on

## Sample Itinerary
### Day 1
- Arrive and check in.
- Explore South Congress Avenue.
- Dinner at a barbecue or local restaurant.
- Optional live music in the evening.

### Day 2
- Morning Lady Bird Lake walk or kayaking.
- Lunch at food truck park.
- Afternoon rest or local shopping.
- Evening live music event.

### Day 3
- Brunch.
- Visit local art, coffee shop, or shopping district.
- Depart.

## Destination Rules
- Outdoor lake activities should be scheduled in the morning during hot weather.
- If customer is food-focused, include barbecue or food trucks.
- If customer is music-focused, include at least one live music event.
- If rain probability is high, replace kayaking with museum, food hall, or indoor music venue.
- Keep travel distances short by grouping downtown, South Congress, and East Austin activities.

## Partner Rules
- Prefer partner boutique hotels near downtown or South Congress.
- Recommend partner food tour if customer says "foodie" or "local food".
- Recommend music venue tickets if live events are available.

## Upsell Options
- Guided BBQ food tour
- VIP live music tickets
- Hill Country winery half-day trip
- Private city tour

## Risk Flags
- Summer heat can make afternoon outdoor activities uncomfortable.
- Live music availability depends on date.
- Parking may be difficult downtown.

## Recommended Internal Summary
Selected because it matches food, music, relaxed travel, and local culture. Good margin potential through food tours and VIP live music ticket upsells.

---

# Package 004: Austin Hill Country Escape

## Basic Information
- Package ID: PKG-AUS-002
- Destination: Austin and Texas Hill Country
- Duration: 4 days / 3 nights
- Best For: Couples, nature lovers, wine lovers, relaxed travelers
- Travel Style: Scenic and relaxing
- Customer Tags: scenic, relaxed, food, wine, outdoors, romantic
- Budget Range: 1800 to 2600 USD per couple
- Estimated Base Cost: 2100 USD per couple
- Expected Margin: 17%
- Priority Level: Medium
- Partner Package: Yes

## Package Description
A scenic getaway combining Austin city comfort with Hill Country charm. This package includes winery-style experiences, scenic drives, relaxed dining, and nature stops.

## Sample Itinerary
### Day 1
- Arrive in Austin.
- Check in at partner boutique hotel.
- Relaxed dinner.

### Day 2
- Morning scenic drive to Hill Country.
- Winery or vineyard-style experience.
- Lunch in Fredericksburg or Dripping Springs.
- Return to Austin or stay overnight in Hill Country.

### Day 3
- Morning nature stop or local market.
- Afternoon rest.
- Evening dinner and live music.

### Day 4
- Brunch and departure.

## Destination Rules
- Avoid too many winery stops in one day.
- For relaxed travelers, limit driving-heavy days to one.
- During hot weather, schedule nature stops early.
- If customer does not drink alcohol, replace wineries with scenic towns, farms, parks, or food experiences.

## Upsell Options
- Private driver
- Premium vineyard lunch
- Boutique cabin stay
- Scenic photography session

## Risk Flags
- Driving times can be long.
- Winery availability varies.
- Outdoor comfort depends on season.

---

# Package 005: New Orleans Culture and Cuisine

## Basic Information
- Package ID: PKG-MSY-001
- Destination: New Orleans, Louisiana
- Duration: 4 days / 3 nights
- Best For: Culture lovers, food lovers, couples, music fans
- Travel Style: Cultural and culinary
- Customer Tags: food, culture, music, history, relaxed, nightlife
- Budget Range: 1600 to 2300 USD per couple
- Estimated Base Cost: 1800 USD per couple
- Expected Margin: 17%
- Priority Level: High
- Partner Package: Yes

## Package Description
A New Orleans experience focused on food, jazz, history, architecture, and unique local culture. Ideal for customers who want character, cuisine, and music rather than a generic city trip.

## Included Experience Types
- French Quarter stay or nearby hotel
- Cajun or Creole dining
- Jazz night
- Garden District or French Quarter walking tour
- Optional swamp or steamboat tour
- Cooking class or cocktail history add-on

## Sample Itinerary
### Day 1
- Arrive and check in.
- French Quarter orientation walk.
- Cajun or Creole dinner.

### Day 2
- Morning Garden District tour.
- Lunch at local restaurant.
- Afternoon steamboat cruise or museum.
- Evening jazz club.

### Day 3
- Swamp tour or plantation-style history tour.
- Afternoon rest.
- Cooking class or cocktail history experience.

### Day 4
- Brunch.
- Free time for shopping or museum.
- Depart.

## Destination Rules
- If customer is food-focused, include Cajun/Creole dining and optional cooking class.
- If customer is music-focused, include jazz evening.
- If rain probability is high, replace walking tour with museum, cooking class, or indoor jazz experience.
- For family customers, avoid late-night Bourbon Street focus.
- For relaxed customers, include afternoon rest due to humidity.

## Partner Rules
- Prefer partner hotel near French Quarter but not directly in loud nightlife zones for relaxed customers.
- Recommend partner cooking class for food-focused travelers.
- Recommend jazz club tickets when customer mentions music.

## Upsell Options
- Cooking class
- Cocktail history tour
- Premium jazz club seating
- Private Garden District guide
- Swamp tour

## Risk Flags
- Humidity can be high.
- Nightlife areas can be noisy.
- Walking tours may be weather-sensitive.

---

# Package 006: San Francisco Family Adventure

## Basic Information
- Package ID: PKG-SFO-001
- Destination: San Francisco, California
- Duration: 4 days / 3 nights
- Best For: Families, first-time visitors, educational travel
- Travel Style: Family-friendly city adventure
- Customer Tags: family, scenic, culture, outdoors, first-time visitor, low walking
- Budget Range: 2200 to 3200 USD per family
- Estimated Base Cost: 2600 USD per family
- Expected Margin: 20%
- Priority Level: Medium
- Partner Package: Yes

## Package Description
A family-friendly San Francisco itinerary combining iconic sights, science experiences, scenic views, and manageable pacing. Designed to reduce unnecessary walking while still showing major highlights.

## Included Experience Types
- Family-friendly hotel
- Fisherman's Wharf and Pier 39
- Golden Gate Park or Exploratorium
- Golden Gate Bridge viewpoint
- Muir Woods or Sausalito optional day trip
- Alcatraz optional tour

## Sample Itinerary
### Day 1
- Arrive and check in.
- Visit Fisherman's Wharf and Pier 39.
- Casual family dinner.

### Day 2
- Morning Exploratorium or museum.
- Afternoon Golden Gate Park.
- Evening Chinatown dinner.

### Day 3
- Muir Woods and Sausalito day trip.
- Return for relaxed evening.

### Day 4
- Optional Alcatraz tour or bay cruise.
- Depart.

## Destination Rules
- For low-walking customers, avoid stacking Fisherman's Wharf, Golden Gate Park, and Chinatown in one day.
- If weather is rainy, prioritize Exploratorium, museums, indoor food markets, or aquarium.
- If children are included, avoid late-night activities.
- Alcatraz tickets should be treated as availability-dependent.

## Partner Rules
- Prefer family-friendly partner hotel with easy transit access.
- Recommend partner bay cruise if Alcatraz is unavailable.
- Recommend guided Muir Woods tour to simplify transportation.

## Upsell Options
- Bay cruise
- Private family guide
- Muir Woods guided tour
- Bike rental for older children
- Alcatraz tickets

## Risk Flags
- Fog and wind may affect scenic viewpoints.
- Some areas require walking on hills.
- Alcatraz availability can be limited.

---

# Package 007: New York City Highlights

## Basic Information
- Package ID: PKG-NYC-001
- Destination: New York City, New York
- Duration: 5 days / 4 nights
- Best For: First-time visitors, city lovers, couples, families
- Travel Style: Iconic city highlights
- Customer Tags: city highlights, culture, shopping, food, shows, first-time visitor, luxury
- Budget Range: 2800 to 4200 USD per couple
- Estimated Base Cost: 3300 USD per couple
- Expected Margin: 22%
- Priority Level: High
- Partner Package: Yes

## Package Description
A complete first-time New York City package covering major landmarks, neighborhoods, food experiences, shopping, and one premium evening show.

## Included Experience Types
- Partner hotel in Midtown or nearby
- Times Square and Broadway
- Statue of Liberty or harbor experience
- Central Park and museum option
- High Line and Chelsea Market
- Brooklyn Bridge photo stop
- Optional rooftop experience

## Sample Itinerary
### Day 1
- Arrive and check in.
- Evening Times Square walk.
- Casual dinner.

### Day 2
- Statue of Liberty or harbor cruise.
- Lower Manhattan visit.
- Evening Broadway show.

### Day 3
- Central Park and museum.
- Fifth Avenue shopping.
- Dinner reservation.

### Day 4
- High Line and Chelsea Market.
- Brooklyn Bridge photo stop.
- Optional rooftop experience.

### Day 5
- Free morning.
- Depart.

## Destination Rules
- For first-time visitors, include Times Square, Central Park, and one skyline/waterfront experience.
- For low-walking customers, reduce neighborhood hopping.
- If rain probability is high, replace walking-heavy activities with museums, Broadway, food halls, or shopping.
- Broadway show is a strong upsell for couples and premium travelers.
- Avoid packing more than four major stops per day.

## Partner Rules
- Prefer partner Midtown hotel if budget allows.
- Recommend partner Broadway tickets for show-focused customers.
- Recommend partner rooftop experience for romantic or premium travelers.

## Upsell Options
- Broadway premium seats
- Rooftop dining
- Private city guide
- Helicopter tour
- Museum pass

## Risk Flags
- Hotel costs can exceed budget quickly.
- Heavy walking may not fit low-walking customers.
- Event availability depends on dates.

---

# Package 008: Orlando Family Magic

## Basic Information
- Package ID: PKG-MCO-001
- Destination: Orlando, Florida
- Duration: 4 days / 3 nights
- Best For: Families, theme park visitors, first-time Orlando travelers
- Travel Style: Family entertainment
- Customer Tags: family, theme parks, entertainment, low walking, first-time visitor
- Budget Range: 2500 to 4000 USD per family
- Estimated Base Cost: 3100 USD per family
- Expected Margin: 16%
- Priority Level: Medium
- Partner Package: Partial

## Package Description
A family-focused Orlando package balancing theme park excitement with rest time and practical travel pacing. Best for families who want fun without exhausting the whole group.

## Sample Itinerary
### Day 1
- Arrive and check in.
- Pool or resort rest.
- Family dinner.

### Day 2
- Full theme park day.
- Midday rest if staying nearby.
- Early evening return.

### Day 3
- Second theme park or water park.
- Optional character dining or show.

### Day 4
- Brunch.
- Disney Springs or shopping.
- Depart.

## Destination Rules
- Do not schedule multiple theme parks on the same day for families.
- Include rest breaks for children.
- If rain probability is high, recommend indoor attractions, shopping, or resort activities.
- For budget-conscious families, suggest fewer ticketed park days and more free/low-cost activities.
- Theme park tickets are major cost drivers.

## Upsell Options
- Express pass
- Character dining
- Private airport transfer
- Premium hotel near park
- Photo package

## Risk Flags
- Theme park prices can exceed budget.
- Weather can impact outdoor attractions.
- Long walking days may be difficult for young children.

---

# Package 009: Denver and Rocky Mountain Sampler

## Basic Information
- Package ID: PKG-DEN-001
- Destination: Denver, Colorado
- Duration: 4 days / 3 nights
- Best For: Nature lovers, couples, friends, light adventure travelers
- Travel Style: Scenic outdoor sampler
- Customer Tags: scenic, outdoors, adventure, relaxed, food, national parks
- Budget Range: 1800 to 2600 USD per couple
- Estimated Base Cost: 2200 USD per couple
- Expected Margin: 16%
- Priority Level: Medium
- Partner Package: Yes

## Package Description
A balanced Denver and Rocky Mountain itinerary for travelers who want mountain views, city dining, scenic drives, and light outdoor activities without a strenuous adventure schedule.

## Sample Itinerary
### Day 1
- Arrive in Denver.
- Explore downtown or RiNo district.
- Dinner at local restaurant.

### Day 2
- Scenic mountain day trip.
- Short hikes or viewpoints.
- Return to Denver for relaxed evening.

### Day 3
- Red Rocks Amphitheatre visit.
- Local brewery or food experience.
- Optional evening event.

### Day 4
- Brunch.
- Depart.

## Destination Rules
- Weather changes quickly in mountain areas; keep a backup indoor plan.
- For relaxed travelers, avoid long hikes.
- In winter, check road conditions before mountain routes.
- Altitude can affect some travelers; do not over-schedule Day 1.
- Outdoor activities should be adjusted based on weather.

## Upsell Options
- Guided mountain tour
- Red Rocks event tickets
- Private scenic driver
- Premium downtown hotel

## Risk Flags
- Mountain weather can change quickly.
- Altitude may affect travelers.
- Driving times can vary.

---

# Package 010: Chicago Architecture and Food Weekend

## Basic Information
- Package ID: PKG-CHI-001
- Destination: Chicago, Illinois
- Duration: 3 days / 2 nights
- Best For: City travelers, food lovers, architecture fans, couples
- Travel Style: Urban culture and food
- Customer Tags: food, culture, city highlights, architecture, relaxed, shopping
- Budget Range: 1400 to 2200 USD per couple
- Estimated Base Cost: 1700 USD per couple
- Expected Margin: 15%
- Priority Level: Medium
- Partner Package: Yes

## Package Description
A compact Chicago weekend focused on architecture, food, lakefront views, museums, and city neighborhoods.

## Sample Itinerary
### Day 1
- Arrive and check in.
- Millennium Park and riverwalk.
- Deep-dish pizza dinner.

### Day 2
- Architecture river cruise.
- Lunch near River North or West Loop.
- Art Institute or shopping.
- Evening rooftop or jazz option.

### Day 3
- Brunch.
- Lakefront walk or museum.
- Depart.

## Destination Rules
- Architecture river cruise is a strong fit for culture and city-highlight travelers.
- If weather is poor, replace lakefront walk with museum, food hall, or shopping.
- For food-focused customers, include pizza, West Loop dining, or food tour.
- Keep outdoor lakefront activities flexible due to wind and weather.

## Upsell Options
- Architecture cruise upgrade
- Food tour
- Rooftop dining
- Museum pass

## Risk Flags
- Weather can be cold or windy.
- Outdoor activities may need indoor replacements.
- Premium dining can raise cost.

---

# Mock Customer Profiles

## Customer Profile: CUST-1001
- Name: John
- Travel Style: relaxed
- Preferred Destinations: Las Vegas, Austin, New Orleans
- Interests: romantic, good food, scenic, shows
- Budget Preference: mid-range
- Avoids: too much walking, rushed schedules
- Good Match: Vegas Couple Escape, Austin Hill Country Escape, New Orleans Culture and Cuisine

## Customer Profile: CUST-1002
- Name: Sarah
- Travel Style: family-friendly
- Preferred Destinations: Orlando, San Francisco, Chicago
- Interests: family, educational, low walking, safe areas
- Budget Preference: flexible
- Avoids: late-night activities, excessive transfers
- Good Match: Orlando Family Magic, San Francisco Family Adventure

## Customer Profile: CUST-1003
- Name: Mike
- Travel Style: adventure
- Preferred Destinations: Denver, Austin, San Francisco
- Interests: outdoors, hiking, scenic, local food
- Budget Preference: mid-range
- Avoids: luxury shopping, long indoor museum days
- Good Match: Denver and Rocky Mountain Sampler, Austin Hill Country Escape

## Customer Profile: CUST-1004
- Name: Priya
- Travel Style: premium
- Preferred Destinations: New York City, Las Vegas, Chicago
- Interests: luxury, shows, shopping, food, skyline views
- Budget Preference: premium
- Avoids: budget hotels, long public transit routes
- Good Match: New York City Highlights, Vegas Couple Escape

---

# Mock Partner Hotels

## Partner Hotel: Vegas Strip Partner Hotel
- Destination: Las Vegas
- Preferred For: couples, premium, first-time visitors
- Approximate Cost: 280 to 450 USD per night
- Partner Margin: high
- Notes: Best used for Vegas Couple Escape when customer budget allows.
- Rule: Recommend for customers with budget above 1800 USD per couple.

## Partner Hotel: Austin Boutique Downtown Hotel
- Destination: Austin
- Preferred For: food lovers, music fans, couples
- Approximate Cost: 220 to 350 USD per night
- Partner Margin: medium
- Notes: Good base for South Congress, downtown, and live music activities.

## Partner Hotel: New Orleans Quiet French Quarter Edge Hotel
- Destination: New Orleans
- Preferred For: relaxed travelers, couples, culture lovers
- Approximate Cost: 200 to 330 USD per night
- Partner Margin: medium
- Notes: Close to French Quarter but avoids the loudest nightlife zones.

## Partner Hotel: New York Midtown Partner Hotel
- Destination: New York City
- Preferred For: first-time visitors, premium travelers, Broadway customers
- Approximate Cost: 350 to 550 USD per night
- Partner Margin: high
- Notes: Best for NYC Highlights when budget allows.

---

# Mock Upsell Catalog

## Upsell: VIP Show Tickets
- Best Destinations: Las Vegas, New York City
- Best Customer Tags: shows, romantic, premium, nightlife
- Margin: high
- Estimated Price: 150 to 350 USD per person
- Rule: Recommend when customer is under or near budget and interested in shows.

## Upsell: Private Airport Transfer
- Best Destinations: Las Vegas, Orlando, New York City, San Francisco
- Best Customer Tags: premium, family, low walking, relaxed
- Margin: medium
- Estimated Price: 80 to 180 USD
- Rule: Recommend for premium customers or families.

## Upsell: Food Tour
- Best Destinations: Austin, Chicago, New Orleans, New York City
- Best Customer Tags: food, culture, local experience
- Margin: medium
- Estimated Price: 75 to 160 USD per person
- Rule: Recommend when customer mentions food, cuisine, BBQ, local culture, or restaurants.

## Upsell: Scenic Helicopter Tour
- Best Destinations: Las Vegas, New York City
- Best Customer Tags: luxury, romantic, scenic, special occasion
- Margin: high
- Estimated Price: 250 to 600 USD per person
- Rule: Recommend only for premium customers or special occasions.

## Upsell: Guided Nature Tour
- Best Destinations: Denver, Austin Hill Country, San Francisco
- Best Customer Tags: outdoors, scenic, adventure, family
- Margin: medium
- Estimated Price: 100 to 250 USD per person
- Rule: Recommend when customer wants nature but not complex self-driving logistics.

---

# Mock Cancellation and Policy Rules

## Cancellation Policy: Standard Package
- Free cancellation up to 7 days before trip start.
- 50% refund from 3 to 6 days before trip start.
- Non-refundable within 48 hours of trip start.
- Event tickets and show tickets may be non-refundable once booked.

## Cancellation Policy: Premium Add-ons
- Premium add-ons such as VIP show tickets, helicopter tours, and private guides may have stricter cancellation policies.
- Always mark premium add-ons as optional in customer proposal.

## Policy: Family Travel
- Avoid late-night activities unless specifically requested.
- Prefer hotels with easy transportation access.
- Include rest time between major activities.
- Avoid activity days requiring more than 4 hours of continuous walking.

## Policy: Relaxed Travel
- Avoid early starts after late-night activities.
- Avoid more than three scheduled activities per day.
- Include downtime after arrival.
- Prefer nearby activities grouped by location.

## Policy: Premium Travel
- Prioritize partner hotels and premium experiences.
- Include one optional high-margin add-on.
- Provide polished customer-facing wording.
- Avoid budget-focused language unless customer requests value.

## Policy: Budget Travel
- Prioritize free attractions, public spaces, casual dining, and flexible activities.
- Avoid luxury hotels and premium add-ons.
- Provide one optional low-cost upsell only.
- Do not exceed budget by more than 10% unless customer approves.

---

# Prompt Guidance for AI Agent

When generating a travel package, the AI agent must follow these rules:
- Use only package names found in this knowledge base.
- Do not invent hotels, package names, margin rules, or cancellation policies.
- Live attractions and weather may come from MCP tools.
- Internal package rules from RAG must take priority over generic LLM travel knowledge.
- If live weather conflicts with sample itinerary, modify the itinerary and explain the change.
- If no package fits, recommend the closest package and flag the gap.
- The final response must include customer-facing itinerary and internal travel-agent summary.
- Internal summary must mention fit score, budget status, business rules applied, recommended upsell, risk flags, and next action.

---

# Expected Output Schema

The final API response should follow this structure:

```json
{
  "packageName": "string",
  "customerItinerary": "string",
  "internalSummary": {
    "fitScore": 0,
    "estimatedBudgetStatus": "string",
    "businessRulesApplied": ["string"],
    "recommendedUpsell": "string",
    "riskFlags": ["string"],
    "selectionReason": "string",
    "nextAction": "string"
  }
}
```

---

# Example Customer Request

```json
{
  "customerName": "John",
  "destination": "Las Vegas",
  "startDate": "2026-08-10",
  "days": 3,
  "travelers": 2,
  "budget": 2000,
  "interests": ["romantic", "shows", "good food", "scenic"],
  "travelStyle": "relaxed"
}
```

# Example Matching Package

Package: Vegas Couple Escape

# Example Internal Summary

- Fit Score: 92
- Budget Status: Within budget
- Business Rules Applied:
  - Selected romantic and relaxed package.
  - Prioritized partner hotel near the Strip.
  - Kept itinerary under three scheduled activities per day.
  - Scheduled scenic outdoor activity in the morning due to heat rule.
- Recommended Upsell: VIP show tickets
- Risk Flags:
  - Outdoor activities may be uncomfortable during extreme heat.
  - Premium show tickets may increase total cost.
- Next Action: Send proposal to customer and offer VIP show ticket upgrade.
