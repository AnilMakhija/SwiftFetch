# 📡 SwiftFetch

> A production-grade networking layer template for iOS — clean, testable, and async/await-ready.

[![Swift](https://img.shields.io/badge/Swift-5.9+-F05138?style=flat-square&logo=swift&logoColor=white)](https://swift.org)
[![iOS](https://img.shields.io/badge/iOS-16%2B-000000?style=flat-square&logo=apple&logoColor=white)](https://developer.apple.com)
[![Architecture](https://img.shields.io/badge/Architecture-MVVM-blue?style=flat-square)](https://developer.apple.com/documentation/swiftui)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)

---

## Why SwiftFetch?

Most networking tutorials stop at `URLSession.shared.dataTask`. This project shows how a **real production iOS team** would structure API calls — with protocol abstraction, async/await, Codable models, and testable ViewModels.

Inspired by patterns used in production apps serving **50,000+ users** in energy and healthcare domains.

---

## 📐 Architecture

```
SwiftFetch/
├── Network/
│   ├── APIClient.swift          # Protocol-based HTTP client
│   ├── Endpoint.swift           # Typed endpoint definitions
│   └── NetworkError.swift       # Structured error handling
├── Models/
│   └── Post.swift               # Codable response models
├── ViewModels/
│   └── PostViewModel.swift      # @MainActor ViewModel with async/await
└── Views/
    └── ContentView.swift        # SwiftUI list + loading/error states
```

---

## ✅ What This Demonstrates

- **Protocol-driven networking** — swap real API for mocks with zero code changes
- **Swift Modern Concurrency** — `async/await` with structured error handling
- **MVVM** — ViewModel owns all data-fetching logic, View stays dumb
- **Codable models** — type-safe JSON decoding with `JSONDecoder`
- **Loading & error states** — production-ready UI state management

---

## 🚀 Getting Started

```bash
git clone https://github.com/AnilMakhija/SwiftFetch.git
cd SwiftFetch
open SwiftFetch.xcodeproj
```

Run on **iOS Simulator** (iOS 16+) or a physical device. No API key required — uses public JSONPlaceholder API.

---

## 🔑 Core Pattern

```swift
// Protocol-based API client — swap real for mock in tests
protocol APIClientProtocol {
    func fetch<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}

// ViewModel stays async/await clean
@MainActor
class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let client: APIClientProtocol

    init(client: APIClientProtocol = APIClient()) {
        self.client = client
    }

    func loadPosts() async {
        isLoading = true
        defer { isLoading = false }
        do {
            posts = try await client.fetch(.posts)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
```

---

## 🧪 Testing

The protocol abstraction makes unit testing straightforward — inject a `MockAPIClient` in tests:

```swift
class MockAPIClient: APIClientProtocol {
    var mockPosts: [Post] = []
    func fetch<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        return mockPosts as! T
    }
}
```

---

## 🔧 Technologies

| Technology | Purpose |
|---|---|
| **Swift 5.9** | Modern language features |
| **SwiftUI** | Declarative UI |
| **async/await** | Structured concurrency |
| **URLSession** | Native HTTP networking |
| **Codable** | Type-safe JSON decoding |
| **MVVM** | Separation of concerns |

---

## 📚 Related Projects

- [GrammarFixerSwiftUI](https://github.com/AnilMakhija/GrammarFixerSwiftUI) — SwiftUI + NLP real-time text processing

---

## 👤 Author

**Anil Makhija** — Senior iOS Lead Engineer · 11+ years · Swift · SwiftUI · IoT

[![Portfolio](https://img.shields.io/badge/Portfolio-anilmakhija.github.io-2563EB?style=flat-square)](https://anilmakhija.github.io/)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat-square&logo=linkedin)](https://linkedin.com/in/anilmakhija)

⭐ Star this repo if it helped you — it helps others find it!
