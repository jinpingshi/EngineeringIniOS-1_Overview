//
//  ContentView.swift
//  Overview
//
//  Created by Jinping Shi on 2025/10/23.
//

import SwiftUI

// Language type enumeration
enum LanguageType: String, CaseIterable {
    case c = "C"
    case cpp = "C++"
    case objectiveC = "Objective-C"
    case swift = "Swift"
    
    var icon: String {
        switch self {
        case .c: return "c.circle.fill"
        case .cpp: return "plus.circle.fill"
        case .objectiveC: return "o.circle.fill"
        case .swift: return "swift"
        }
    }
    
    var color: Color {
        switch self {
        case .c: return .blue
        case .cpp: return .purple
        case .objectiveC: return .orange
        case .swift: return .red
        }
    }
}

struct ContentView: View {
    private let languageManager = LanguageManager()
    @State private var selectedLanguage: LanguageType? = nil
    @State private var helloMessages: [LanguageType: [String]] = [:]
    
    var body: some View {
        NavigationSplitView {
            List {
                Section("Programming Languages Hello World Demo") {
                    ForEach(LanguageType.allCases, id: \.self) { language in
                        NavigationLink(value: language) {
                            HStack {
                                Image(systemName: language.icon)
                                    .foregroundColor(language.color)
                                    .font(.title2)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(language.rawValue)
                                        .font(.headline)
                                    Text("Tap to view \(language.rawValue) implementation")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
//                                Spacer()
//                                
//                                Image(systemName: "chevron.right")
//                                    .foregroundColor(.secondary)
//                                    .font(.caption)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Multi-Language Demo")
            .navigationDestination(for: LanguageType.self) { language in
                LanguageDetailView(language: language, languageManager: languageManager)
            }
        } detail: {
            if let selectedLanguage = selectedLanguage {
                LanguageDetailView(language: selectedLanguage, languageManager: languageManager)
            } else {
                VStack(spacing: 20) {
                    Image(systemName: "text.badge.star")
                        .font(.system(size: 60))
                        .foregroundColor(.secondary)
                    Text("Select a Programming Language")
                        .font(.title2)
                        .foregroundColor(.secondary)
                    Text("View Hello World implementations in different languages")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .onAppear {
            loadHelloMessages()
        }
    }
    
    private func loadHelloMessages() {
        // Preload messages for all languages
        helloMessages[.c] = [languageManager.getHelloFromC()]
        helloMessages[.cpp] = [languageManager.getHelloFromCpp()]
        helloMessages[.objectiveC] = [
            languageManager.getHelloFromObjC(),
            languageManager.getHelloFromObjCClass()
        ]
        helloMessages[.swift] = [
            languageManager.getHelloFromSwift(),
            languageManager.getHelloFromSwiftStatic(),
            languageManager.getHelloFromSwiftStruct()
        ]
    }
}

// Language detail view
struct LanguageDetailView: View {
    let language: LanguageType
    let languageManager: LanguageManager
    @State private var messages: [String] = []
    @State private var showCode = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                HStack {
                    Image(systemName: language.icon)
                        .font(.system(size: 50))
                        .foregroundColor(language.color)
                    
                    VStack(alignment: .leading) {
                        Text(language.rawValue)
                            .font(.largeTitle)
                            .bold()
                        Text("Hello World Implementation")
                            .font(.title3)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(language.color.opacity(0.1))
                )
                
                // Output results
                VStack(alignment: .leading, spacing: 12) {
                    Label("Output Results", systemImage: "terminal")
                        .font(.headline)
                    
                    ForEach(messages, id: \.self) { message in
                        HStack {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.green)
                                .font(.caption)
                            
                            Text(message)
                                .font(.system(.body, design: .monospaced))
                            
                            Spacer()
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.systemGray6))
                        )
                    }
                }
                
                // Code example button
                Button(action: { showCode.toggle() }) {
                    Label(showCode ? "Hide Code" : "Show Code Example",
                          systemImage: showCode ? "eye.slash" : "eye")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .tint(language.color)
                
                // Code example
                if showCode {
                    CodeExampleView(language: language)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            loadMessages()
        }
    }
    
    private func loadMessages() {
        switch language {
        case .c:
            messages = [languageManager.getHelloFromC()]
        case .cpp:
            messages = [languageManager.getHelloFromCpp()]
        case .objectiveC:
            messages = [
                "Instance Method: \(languageManager.getHelloFromObjC())",
                "Class Method: \(languageManager.getHelloFromObjCClass())"
            ]
        case .swift:
            messages = [
                "Class: \(languageManager.getHelloFromSwift())",
                "Static Method: \(languageManager.getHelloFromSwiftStatic())",
                "Struct: \(languageManager.getHelloFromSwiftStruct())"
            ]
        }
    }
}

// Code example view
struct CodeExampleView: View {
    let language: LanguageType
    
    var codeExample: String {
        switch language {
        case .c:
            return """
            // HelloC.h
            const char* getHelloWorldC(void);
            
            // HelloC.c
            const char* getHelloWorldC(void) {
                return "Hello World from C";
            }
            """
        case .cpp:
            return """
            // HelloCpp.hpp
            class HelloCpp {
            private:
                std::string message;
            public:
                std::string getHelloWorld() const;
            };
            
            // HelloCpp.cpp
            std::string HelloCpp::getHelloWorld() const {
                return message;
            }
            """
        case .objectiveC:
            return """
            // HelloOC.h
            @interface HelloOC : NSObject
            - (NSString *)generateHelloWorld;
            @end
            
            // HelloOC.m
            @implementation HelloOC
            - (NSString *)generateHelloWorld {
                return @"Hello World from Objective-C";
            }
            @end
            """
        case .swift:
            return """
            // HelloSwift.swift
            class HelloSwift {
                private let message: String
                
                init() {
                    self.message = "Hello World from Swift"
                }
                
                func getHelloWorld() -> String {
                    return message
                }
            }
            """
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Code Example", systemImage: "doc.text")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: true) {
                Text(codeExample)
                    .font(.system(.caption, design: .monospaced))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(.systemGray6))
                    )
            }
        }
    }
}

#Preview {
    ContentView()
}
