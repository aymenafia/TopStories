# TopStories(Swift)


![Swift](https://img.shields.io/badge/Language-Swift-orange)
![Xcode 13](https://img.shields.io/badge/IDE-Xcode%2012-blue)



Landscape orientation

<img src="https://user-images.githubusercontent.com/26444488/185188243-3ed0db4b-694b-4a32-b002-06b9b019017a.png" alt="" width="500" height="250"> <img src="https://user-images.githubusercontent.com/26444488/185188395-1e03c9ca-7557-43af-99f8-62dab44517dc.png" alt="" width="500" height="250">

#Architecture Overview


Breaking responsibilities into multiple protocols (Interface Segregation Principle) to achieve flexible, composable and modular components.

Combining Xcode projects into a workspace and embedding frameworks to compose modules into a running iOS app.

If the TOP Story API, TOP Story Cache, and UI don’t know about each other, you can easily develop, test, maintain, extend, and deploy them in isolation. You can also easily replace or reuse those modules in different applications with different compositions.

Those are big wins in productivity and flexibility in app development. It’s how you can go fast without compromising quality.

But for the application to work, the API and UI need to work together. So, the idea is to create a “Main module” (the scence delegate) responsible for instantiating and composing all independent modules in a centralized place, aka the “Composition Root.”

<img src="https://user-images.githubusercontent.com/26444488/185185323-beb64080-7478-4b81-b421-810bf667c06c.png" alt="" width="800" height="1300">


---

**MIT License**
