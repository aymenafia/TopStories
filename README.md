# TopStories(Swift)


![Swift](https://img.shields.io/badge/Language-Swift-orange)
![Xcode 13](https://img.shields.io/badge/IDE-Xcode%2012-blue)


Portrait orientation


<img src="https://user-images.githubusercontent.com/26444488/185142420-ba7496d0-860f-4d8f-823b-f855ac93e85f.png" alt="" width="200" height="500"> <img src="https://user-images.githubusercontent.com/26444488/185142979-e18daed3-bfab-4c35-b9ba-89c6358e037c.png" alt="" width="200" height="500">

Landscape orientation

<img src="https://user-images.githubusercontent.com/26444488/185143314-af7ff3a4-78b6-4ec0-bfb4-1f4ca6d09e32.png" alt="" width="500" height="200"> <img src="https://user-images.githubusercontent.com/26444488/185143501-a6c04f7e-8002-42fc-aec0-7660b31ae898.png" alt="" width="500" height="200">


Breaking responsibilities into multiple protocols (Interface Segregation Principle) to achieve flexible, composable and modular components.

Combining Xcode projects into a workspace and embedding frameworks to compose modules into a running iOS app.

If the TOP Story API, TOP Story Cache, and UI don’t know about each other, you can easily develop, test, maintain, extend, and deploy them in isolation. You can also easily replace or reuse those modules in different applications with different compositions.

Those are big wins in productivity and flexibility in app development. It’s how you can go fast without compromising quality.

But for the application to work, the API and UI need to work together. So, the idea is to create a “Main module” (the scence delegate) responsible for instantiating and composing all independent modules in a centralized place, aka the “Composition Root.”

<img src="https://user-images.githubusercontent.com/26444488/185185323-beb64080-7478-4b81-b421-810bf667c06c.png" alt="" width="800" height="1300">


---

**MIT License**
