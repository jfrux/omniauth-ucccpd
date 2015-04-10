# OmniAuth UC CCPD

This is the official OmniAuth strategy for authenticating to UC (University of Cincinnati) Center for Continuous Professional Development systems. To
use it, you'll work with Joshua F. Rountree of UC CCPD to receive a developer API application key and secret.

Contact Joshua Rountree @ joshua.rountree@uc.edu.

## Basic Usage

    use OmniAuth::Builder do
      provider :ucccpd, ENV['UCCCPD_KEY'], ENV['UCCCPD_SECRET']
    end

## Scopes

UC-CCPD API lets you set scopes to provide granular access to different types of data:

	use OmniAuth::Builder do
      provider :ucccpd, ENV['UCCCPD_KEY'], ENV['UCCCPD_SECRET'], scope: "user,activities,transcript"
    end


## License

Copyright (c) 2015 Joshua F. Rountree and University of Cincinnati.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
