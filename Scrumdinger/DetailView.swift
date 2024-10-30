//
//  DetailView.swift
//  Scrumdinger
//
//  Created by kike on 29/10/24.
//
import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                        .accessibilityLabel("Start Meeting")
                }
                HStack{
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                //.foregroundColor(.accentColor)
                //.font(.headline)
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)")
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                //.foregroundColor(.accentColor)
                //.font(.headline)
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Attendess")) {
                ForEach(scrum.attendees) { attendee in
                    Label("\(attendee.name)", systemImage: "person")
                    
                }
            }
        }
        .navigationTitle(scrum.title)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleDate[0]
    static var previews: some View {
        NavigationStack {
            DetailView(scrum: scrum)
        }
    }
}