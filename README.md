# Views
### Rendering Templates
* The root directory of views can be altered by changing the value of `root` in `lib/<app_name>_web.ex`.
* Phoenix applications by default has three view modules:
  * ErrorView
  * LayoutView
  * PageView
### Templates
* functions defined in views are available in the template that is rendered by that view.
* we can override the default view that is used in rendering by using render/3 instead of render/2.