//
//  NotificationsView.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-21.
//

import SwiftUI

struct Reminder: Identifiable {
    let id = UUID()
    let date: String
    let title: String
    let subtitle: String
}

struct NotificationsView: View {
    @State private var selectedTab = "Upcoming"
    private let tabs = ["Pending", "Upcoming"]

    let upcomingReminders: [Reminder] = [
        Reminder(date: "23/04/2025", title: "Dog Parvo Booster", subtitle: "Vaccination is due for 2 days")
    ]

    let generalReminders: [String] = [
        "Monthly Checkup - 5pm"
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Picker("Reminders", selection: $selectedTab) {
                ForEach(tabs, id: \.self) { tab in
                    Text(tab).tag(tab)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(upcomingReminders) { reminder in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(reminder.date)
                                .font(.headline)
                            Text(reminder.title)
                                .font(.subheadline)
                            Text(reminder.subtitle)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(16)
                        .padding(.horizontal)
                    }

                    Text("Reminders")
                        .font(.title3)
                        .bold()
                        .padding(.horizontal)

                    ForEach(generalReminders, id: \.self) { item in
                        HStack {
                            Image(systemName: "bell.fill")
                                .foregroundColor(.yellow)
                            Text(item)
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(16)
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationTitle("Reminders and Notifications")
    }
}

#Preview {
    NotificationsView()
}
