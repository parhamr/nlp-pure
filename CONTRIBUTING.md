# Contributing

Pull requests are welcomed! Here’s a quick guide:

1. Fork the repo.

2. Run the tests. We only take pull requests with passing tests, and it's great
to know that you have a clean slate: `bundle && rake`

3. Add a test for your change. Only refactoring and documentation changes
require no new tests. If you are adding functionality or fixing a bug, we need
a test!

4. Make the test pass.

5. Push to your fork and submit a pull request.


## Project Goals

* Accuracy over speed
* One installation step (through `gem` or `bundle`)
* Minimal runtime dependencies (beyond the standard libraries)
* Effective collaboration (and minimized interpersonal conflict)
* Sustainability and maintainability (this isn’t a full-time project)


## Style Guide

See also: `rake rubocop`

* Two spaces, no tabs.
* No trailing whitespace. Blank lines should not have any space.
* Prefer `&& ||` over `and or`.
* Use `MyClass.my_method(my_arg)` not `my_method( my_arg )` or `my_method my_arg`.
* Prefer `a = b` to `a=b`.
* Follow the conventions you see used in the source already.
