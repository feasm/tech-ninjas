#  Swift Guidelines


## 1. Namespace

### 1.1 Class names
All the classes should use PascalCase, not camelCase

```swift
// Not Preferred
class viewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
```

```swift
// Preferred
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
```

### 1.2 Method names
All the methods should use camelCase

```swift
// Not Preferred
protocol Service {
    func GetProducts()
}
```

```swift
// Preferred
protocol Service {
    func getProducts()
}
```

Never repeat a name on the first parameter when it's in the final of a method name

```swift
// Not Preferred
protocol ViewModel {
    func getProducts(products: [Products])
}
```

```swift
// Preferred
protocol ViewModel {
    func get(products: [Products])
}
```

Add parameter labels to make methods more readable

```swift
// Not Preferred
protocol ViewModel {
    func getTypeFromProduct(product: Product)
}
```

```swift
// Preferred
protocol ViewModel {
    func getType(from product: Product)
}
```

### 1.3 Variable names
All the variables should use camelCase

```swift
// Not Preferred
struct Product {
    let Name: String
}
```

```swift
// Preferred
struct Product {
    let name: String
}
```

Always put the type as sufix of a variable, except for the swift types(Int, String, Double...)

```swift
// Not Preferred
class ViewController {
    let nameString: String
    let username: TextField
}
```

```swift
// Preferred
class ViewController {
    let name: String
    let usernameTextField: TextField
}
```

### 1.4 Acronyms
Always define acronyms with all letters uppercased

```swift
// Not Preferred
class ViewController: TlViewController {
    let nameString: String
}
```

```swift
// Preferred
class ViewController: TLViewController {
    let nameString: String
}
```

## 2. Spacing

### 2.1 Line spaces
Never put an empty line between braces {}, except for classes

```swift
// Not Preferred
struct Products {

    let name: String
    
}

protocol ViewModel {

    func getProducts()
    
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
```

```swift
// Preferred
struct Products {
    let name: String
}

protocol ViewModel {
    func getProducts()
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
```

Always put a line between methods, except in protocol definitions
```swift
// Not Preferred
protocol ViewModel {
    func getProducts()
    
    func getUsers()
}

class ViewModelImpl: ViewModel {

    func getProducts() {
    // ...
    }
    func getUsers() {
    // ...
    }
    
}
```

```swift
// Preferred
protocol ViewModel {
    func getProducts()
    func getUsers()
}

class ViewModelImpl: ViewModel {

    init() {}

    func getProducts() {
    // ...
    }
    
    func getUsers() {
    // ...
    }
    
}```

### 2.2 Line break
Always break lines after defining new scope, except for single lines in methods, ifs, guards and switch cases

```swift
// Not Preferred
protocol ViewModel { func getProducts(name: String?) }

class ViewModelImpl: ViewModel { init() {}

    func getProducts(name: String?) {
        guard let name = name else { 
            return         
        }
        
        if name == nil { 
            return
        }
        
        switch name {
            case "Red Shirt": 
                print("Red!") 
        }
    }

}```

```swift
// Preferred
protocol ViewModel {
    func getProducts(name: String?)
}

class ViewModelImpl: ViewModel {

    func getProducts(name: String?) {
        guard let name = name else { return }
        
        if name == nil { return }
        
        switch name {
            case "Red Shirt": print("Red!") 
        }
    }

}```

### 2.2 Line spaces
Always put a space before open brackets

```swift
// Not Preferred
protocol ViewModel{
    func getProducts(name: String?)
}
```

```swift
// Preferred
protocol ViewModel {
    func getProducts(name: String?)
}
```
