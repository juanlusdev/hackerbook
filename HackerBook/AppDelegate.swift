//
//  AppDelegate.swift
//  HackerBook
//
//  Created by Juan Luis Garcia on 8/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //    "authors": "Scott Chacon, Ben Straub",
        //    "image_url": "http://hackershelf.com/media/cache/b4/24/b42409de128aa7f1c9abbbfa549914de.jpg",
        //    "pdf_url": "https://progit2.s3.amazonaws.com/en/2015-03-06-439c2/progit-en.376.pdf",
        //    "tags": "version control, git",
        //    "title": "Pro Git"
//        
//        let urlImageString = "http://hackershelf.com/media/cache/b4/24/b42409de128aa7f1c9abbbfa549914de.jpg"
//        let urlImage = NSURL(string: urlImageString)
//        let urlData = NSData(contentsOfURL: urlImage!)
        
        //let model = HackerBook(authors: "Scott Chacon, Ben Straub", image: UIImage(data: urlData!)!, pdfUrl: (NSURL(string: "https://progit2.s3.amazonaws.com/en/2015-03-06-439c2/progit-en.376.pdf"))!, tags: "version control, git", title: "Pro Git")
        
        do{
            
        
        let json = try loadFromLocalFile(fileName: "books_readable.json")
        
        var books = [HackerBook]()
        
            for dict in json{
                
                
                do{
                    
                    let book = try parsing(hackerBook: dict)
                    books.append(book)
                    
                } catch{
                    
                    print("Error al procesar JSON \(dict)")
                    
                    
                }
                
            }
            
            print(books.dynamicType)
            
        let model = HackerBooksGroup(hbooks: books)
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        //let vc = HackerBookControllerViewController(model: model)
        
        let vc = HackerBooksTableTableViewController(model: model)
        
        let nav = UINavigationController(rootViewController: vc)
        
        window?.rootViewController = nav
        
        window?.makeKeyAndVisible()
        
        
        return true
            
        } catch {
            
            fatalError("Error while loading JSON")
            
        }
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
