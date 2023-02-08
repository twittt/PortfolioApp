//
//  ContentView.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/5/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: Fonts.Poppins_Bold, size: 36)!]
        UITabBar.appearance().backgroundColor = UIColor.white
    }

    var body: some View {
        NavigationView {
            ZStack {
                Background()
                
                ScrollView {
                    VStack {
                        
                        //MARK: Header Information
                        Group {
                            Image("profile_pic")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250)
                                .padding(.top, 20)
                            Text("Hi, I'm Tela")
                                .font(Fonts.font(Fonts.Poppins_Bold, 36))
                                .foregroundColor(.white)
                            Text("iOS Developer & Data Enthusiast")
                                .font(Fonts.font(Fonts.Poppins_Regular, 22))
                                .foregroundColor(.white)
                                .padding(.bottom)
                        }
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel("Hi, I'm Tela! I'm an iOS Developer and Data Enthusiast")

                        HStack{
                            NavigationLink(destination: DetailWebView(model: WebViewModel(link: SocialMediaChannel.getUrlString(.linkedIn)))) {
                                Image("linkedIn")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(5)
                                    .modifier(SocialButtonModifier())
                                
                            }
                            NavigationLink(destination: DetailWebView(model: WebViewModel(link: SocialMediaChannel.getUrlString(.gitHub)))) {
                                Image("gitHub")
                                    .resizable()
                                    .scaledToFit()
                                    .modifier(SocialButtonModifier())
                            }
                            NavigationLink(destination: DetailWebView(model: WebViewModel(link: SocialMediaChannel.getUrlString(.polywork)))) {
                                Image("polywork")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(5)
                                    .modifier(SocialButtonModifier())
                            }
                        }
                        
                        //MARK: Work Sample
                        Group {
                            HStack {
                                Text("My Work")
                                    .modifier(SectionTitleModifier())
                                    .padding(.top, 40)
                                Spacer()
                            }
                            RepresentOnTheAppStoreView()
                        }.accessibilityIdentifier("myWorkSection")
                        
                        //MARK: Experience
                        Group  {
                            HStack {
                                Text("My Experience")
                                    .modifier(SectionTitleModifier())
                                    .padding(.top, 40)
                                Spacer()
                            }
                            ResumeView()
                        }.accessibilityIdentifier("resumeSection")

                        //MARK: Social Profiles
                        Group {
                            HStack {
                                Text("My Profiles")
                                    .modifier(SectionTitleModifier())
                                    .padding(.top, 40)
                                Spacer()
                            }
                            SocialLinksView()
                        }
                        .accessibilityIdentifier("socialMediaProfiles")
                        
                        //MARK: Extracurriculars
                        Group {
                            HStack {
                                Text("My Free Time")
                                    .modifier(SectionTitleModifier())
                                    .padding(.top, 30)
                                Spacer()
                            }
                            ExtracurricularView()
                        }.accessibilityIdentifier("extracurricularActivities")

                        //MARK: Publications
                        Group {
                            HStack {
                                Text("My Published Works")
                                    .modifier(SectionTitleModifier())
                                    .padding(.top, 40)
                                Spacer()
                            }
                            PublicationsView()
                        }
                        .accessibilityIdentifier("publicationsSection")

                        //MARK: Travel
                        Group {
                            HStack {
                                Text("My Travels")
                                    .modifier(SectionTitleModifier())
                                    .padding(.top, 40)
                                Spacer()
                            }
                            TravelView()
                        }
                        .accessibilityIdentifier("travelSection")
                        .accessibilityAddTraits(.isLink)
                    }
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
