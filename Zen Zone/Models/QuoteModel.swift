//
//  QuoteModel.swift
//  Zen Zone
//
//  Created by Tai Wong on 9/22/23.
//

import Foundation

struct Quote: Codable {
    let q, a, h: String?
}

typealias Quotes = [Quote]

class QuoteModel: ObservableObject {
    @Published private(set) var quotes: Quotes?
    
    private let dataStorageKey = "cachedQuotes"
    
    init() {
        // Load cached quotes from storage, if available
        if let cachedQuotes = loadCachedQuotes() {
            self.quotes = cachedQuotes
        }
        
        // Schedule a timer to refetch data after 24 hours
        Task {
            await self.fetchData()
        }
        
    }
    
    func fetchDataIfNeeded() {
        // Check if we have quotes and whether the data is older than 24 hours
        if let quotes = self.quotes,
           let timestamp = UserDefaults.standard.object(forKey: "lastFetchTimestamp") as? Date,
           Date().timeIntervalSince(timestamp) < 24 * 60 * 60 {
            return // Quotes are up-to-date
        }
        
        Task {
            await fetchData()
        }
    }
    
    private func fetchData() async {
        do {
            guard let url = URL(string: "https://zenquotes.io/api/today") else { fatalError("Missing URL") }
            
            let urlRequest = URLRequest(url: url)
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Quotes.self, from: data)
            
            DispatchQueue.main.async {
                self.quotes = decodedData
                // Cache the fetched quotes locally
                self.saveQuotesToCache(decodedData)
                // Update the last fetch timestamp
                UserDefaults.standard.set(Date(), forKey: "lastFetchTimestamp")
            }
            
        } catch {
            print("Error fetching data: \(error)")
        }
    }
    
    private func saveQuotesToCache(_ quotes: Quotes) {
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(quotes)
            UserDefaults.standard.set(encodedData, forKey: dataStorageKey)
        } catch {
            print("Error saving quotes to cache: \(error)")
        }
    }
    
    private func loadCachedQuotes() -> Quotes? {
        if let encodedData = UserDefaults.standard.data(forKey: dataStorageKey) {
            do {
                let decoder = JSONDecoder()
                let cachedQuotes = try decoder.decode(Quotes.self, from: encodedData)
                return cachedQuotes
            } catch {
                print("Error loading cached quotes: \(error)")
            }
        }
        return nil
    }
}
