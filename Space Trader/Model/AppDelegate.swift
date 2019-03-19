//
//  AppDelegate.swift
//  Space Trader
//
//  Created by Max Zuo on 3/6/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        initializeAvailablePlanetNames()
        
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let universeViewController = storyboard.instantiateViewController(withIdentifier: "UniverseVieWController")
        let configurationViewController = storyboard.instantiateViewController(withIdentifier: "ConfigurationViewController")
        
//        do {
//            var mAuth = Auth.auth().addStateDidChangeListener { (auth, <#User?#>) in
//                <#code#>
//            }
//        } catch {
//
//        }
//        if let ref.child()
        let defaults = UserDefaults.standard
        if let uid = defaults.object(forKey: "uid") {
            //sign in user
            self.window?.rootViewController = universeViewController
            self.window?.makeKeyAndVisible()
        } else if false {
            // check local version of the
        } else {
            self.window?.rootViewController = configurationViewController
            self.window?.makeKeyAndVisible()
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Space_Trader")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func initializeAvailablePlanetNames() {
        var names: Array<String> = [
            "Acamar",
            "Adahn",        // The alternate personality for The Nameless One in "Planescape: Torment"
            "Aldea",
            "Andevian",
            "Antedi",
            "Balosnee",
            "Baratas",
            "Brax",            // One of the heroes in Master of Magic
            "Bretel",        // This is a Dutch device for keeping your pants up.
            "Calondia",
            "Campor",
            "Capelle",        // The city I lived in while programming this game
            "Carzon",
            "Castor",        // A Greek demi-god
            "Cestus",
            "Cheron",
            "Courteney",    // After Courteney Cox…
            "Daled",
            "Damast",
            "Davlos",
            "Deneb",
            "Deneva",
            "Devidia",
            "Draylon",
            "Drema",
            "Endor",
            "Esmee",        // One of the witches in Pratchett's Discworld
            "Exo",
            "Ferris",        // Iron
            "Festen",        // A great Scandinavian movie
            "Fourmi",        // An ant, in French
            "Frolix",        // A solar system in one of Philip K. Dick's novels
            "Gemulon",
            "Guinifer",        // One way of writing the name of king Arthur's wife
            "Hades",        // The underworld
            "Hamlet",        // From Shakespeare
            "Helena",        // Of Troy
            "Hulst",        // A Dutch plant
            "Iodine",        // An element
            "Iralius",
            "Janus",        // A seldom encountered Dutch boy's name
            "Japori",
            "Jarada",
            "Jason",        // A Greek hero
            "Kaylon",
            "Khefka",
            "Kira",            // My dog's name
            "Klaatu",        // From a classic SF movie
            "Klaestron",
            "Korma",        // An Indian sauce
            "Kravat",        // Interesting spelling of the French word for "tie"
            "Krios",
            "Laertes",        // A king in a Greek tragedy
            "Largo",
            "Lave",            // The starting system in Elite
            "Ligon",
            "Lowry",        // The name of the "hero" in Terry Gilliam's "Brazil"
            "Magrat",        // The second of the witches in Pratchett's Discworld
            "Malcoria",
            "Melina",
            "Mentar",        // The Psilon home system in Master of Orion
            "Merik",
            "Mintaka",
            "Montor",        // A city in Ultima III and Ultima VII part 2
            "Mordan",
            "Myrthe",        // The name of my daughter
            "Nelvana",
            "Nix",            // An interesting spelling of a word meaning "nothing" in Dutch
            "Nyle",            // An interesting spelling of the great river
            "Odet",
            "Og",            // The last of the witches in Pratchett's Discworld
            "Omega",        // The end of it all
            "Omphalos",        // Greek for navel
            "Orias",
            "Othello",        // From Shakespeare
            "Parade",        // This word means the same in Dutch and in English
            "Penthara",
            "Picard",        // The enigmatic captain from ST:TNG
            "Pollux",        // Brother of Castor
            "Quator",
            "Rakhar",
            "Ran",            // A film by Akira Kurosawa
            "Regulas",
            "Relva",
            "Rhymus",
            "Rochani",
            "Rubicum",        // The river Ceasar crossed to get into Rome
            "Rutia",
            "Sarpeidon",
            "Sefalla",
            "Seltrice",
            "Sigma",
            "Sol",            // That's our own solar system
            "Somari",
            "Stakoron",
            "Styris",
            "Talani",
            "Tamus",
            "Tantalos",        // A king from a Greek tragedy
            "Tanuga",
            "Tarchannen",
            "Terosa",
            "Thera",        // A seldom encountered Dutch girl's name
            "Titan",        // The largest moon of Jupiter
            "Torin",        // A hero from Master of Magic
            "Triacus",
            "Turkana",
            "Tyrus",
            "Umberlee",        // A god from AD&D, which has a prominent role in Baldur's Gate
            "Utopia",        // The ultimate goal
            "Vadera",
            "Vagra",
            "Vandor",
            "Ventax",
            "Xenon",
            "Xerxes",        // A Greek hero
            "Yew",            // A city which is in almost all of the Ultima games
            "Yojimbo",        // A film by Akira Kurosawa
            "Zalkon",
            "Zuul"]
        names.shuffle()
        Planet.AVAILABLE_PLANET_NAMES = names
    }

}

