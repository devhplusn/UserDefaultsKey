#if canImport(Foundation)
import Foundation

extension UserDefaults {
    
    @propertyWrapper
    public class Key<Value: Codable>: Codable {
        
        private let decoder = JSONDecoder()
        private let encoder = JSONEncoder()
        private let defaultValue: Value
        public let key: String
        public var wrappedValue: Value {
            get { getter() }
            set { setter(newValue) }
        }
        
        enum CodingKeys: CodingKey {
            case defaultValue
            case key
        }
        
        public init(wrappedValue: Value, _ key: String) {
            self.defaultValue = wrappedValue
            self.key = key
        }
        
        public convenience init<Wrapped>(wrappedValue: Value = nil, _ key: String) where Value == Wrapped? {
            self.init(wrappedValue: wrappedValue, key)
        }
        
        public required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.defaultValue = try container.decode(Value.self, forKey: .defaultValue)
            self.key = try container.decode(String.self, forKey: .key)
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(defaultValue, forKey: .defaultValue)
            try container.encode(key, forKey: .key)
        }
        
        private func getter() -> Value {
            guard let data = UserDefaults.standard.data(forKey: key), let decoded = try? decoder.decode(Value.self, from: data) else {
                return defaultValue
            }
            return decoded
        }
        
        private func setter(_ value: Value) {
            guard let encoded = try? encoder.encode(value) else { return }
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
}

#endif
