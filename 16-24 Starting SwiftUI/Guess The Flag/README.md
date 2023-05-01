## Guess The Flag

Key take-aways: linear, radial and angular _gradients_, _colors_, _roles_ and _alerts_.

**Linear Gradient**   
```
LinearGradient(gradient: Gradient(stops: [
Gradient.Stop(color: .yellow, location: 0.75),
Gradient.Stop(color: .orange, location: 1)
]), startPoint: .top, endPoint: .bottom)
```

**Radial Gradient**  
```
RadialGradient(gradient: Gradient(colors: [.white, .orange]), center: .bottom, startRadius: 50, endRadius: 500)
```
**Angular Gradient** 
```
AngularGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .white]), center: .center)
```

**Alert**  
```
@State private var showingAlert = false

Button("Delete", role: .destructive) {
    print("deleted")
    showingAlert = true
.buttonStyle(.borderedProminent)
.alert("Important Message", isPresented: $showingAlert) {
    Button("Cancel", role: .cancel) { }
    Button("Delete", role: .destructive) { }
} message: {
    Text("Please read this.")
}
´´´

<!--
<p align="center">
<img src="" width="350">
</p>
-->
