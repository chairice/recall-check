# ReGuard

## Inspiration
With food, drug, and item recalls on the rise (a nearly 20% jump in three years), we saw an opportunity to create a tool that protects the average consumer from a lesser-known yet dangerous situation. Item recalls happen due to unannounced allergens, bacterial and material contaminations, and overall when public health and safety are at risk. With ReGuard, we optimized the process of checking for recalls because government websites and databases are hard to navigate, and local news sites struggle to stay up-to-date on product information. The easy-to-use and tailored app features real data and incentivizes consumers to stay up to date on their products’ information.

## What it does 
ReGuard scans any barcode and lets users know if any of the items in their list are recalled. It also includes a beta receipt scanning feature and a map where local businesses or news sites can release updates on any recalled or substandard products.

## How we built it
ReGuard was built using Swift & SwiftUI. We began by creating multiple views and models, such as CameraView, DataScannerView, BarCodeTextScannerApp, and AppViewModel. AVKit and VisisonKit were two of the main sources we used to help us implement a functioning camera. We then programmed the code to scan lines of a barcode and return the number as well as read any text on the product. Using some backend functions and Ui linking, the barcode number is read, analyzed, and displayed on the screen to the user as either red or green based on whether or not the product has been recalled. We also have a MapView file that implements our local map. The map centers on the neighborhood where you live and has map markers that, when tapped, show a description of any recent recalls or quality incidents.

## Challenges we ran into
A couple of difficulties we encountered involved bridging multiple frameworks from the front end to the back end. For example, each language formats data in a unique way (i.e. C inputting CSV files while the front end returns solely strings and streams of recognized text). Furthermore, efficiently scraping the FDA and USDA databases to compare with our scanned data proved to be an obstacle we spent the most time on tackling, and in the end we decided to opt for a subset of data rather than linking databases. We also ran into some issues with data saving and ended up having to rely on local device data. We tried to use MongoDB as well as Swift CoreData to save and log information, however, it proved to be time-consuming.

## Accomplishments that we're proud of

We’re definitely proud of creating an MVP that we are satisfied with. There were recurring times in our project process when we felt that we could not have made this goal, but ultimately we accomplished the minimum of the multitude of ambitious ideas we had. We’re also proud of working cohesively as a team and never blaming each other for obstacles or stagnant periods of coding. Our positive affirmations to each other uplifted each and every one of our spirits and made us more productive, if not emotionally ameliorated.


## What we learned

We learned that Hackathons can be fun! A shared all-nighter is definitely a great way to know each other and our fellow STEM majors. We also learned that, while we take pride in being ambitious and pushing our potential, it is also good to be realistic and true to yourself so you can set and scale goals appropriately. We went into the hackathon with such a structured plan but eventually changed a lot of the schedule due to debugging and other issues we ran into while working. From this, we learned that being adaptable and persistent are good qualities to have.

## What's next for ReGuard
Presently, our product scans UPC barcodes and immediately compares the product data to all previously recalled products, clearly indicating if an item has been recalled in the past. This, in tandem with our map and location feature, is particularly useful for shoppers seeking immediate feedback on recalled products. To help consumers stay aware of new recalls and health alerts post-purchase, our app will log receipt scans and update the saved shopping items as the FDA updates product recalls (daily or weekly depending on the product). Furthermore, as saved items become flagged as newly recalled products, the user will receive an alert in real-time. 

## How to use
Setup: This app is run and modeled from Xcode. Into a new repository, start by doing
```
clone https://github.com/chairice/recall-check.git
```
to install all files on your local device. Make sure that Xcode is installed, then connect a mobile IOS device to your machine via cable. Then, run Xcode and open `RecallChecker.xcodeproj` to use the app on your phone.
