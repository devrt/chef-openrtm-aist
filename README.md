OpenRTM-aist Cookbook
=====================

This cookbook will install OpenRTM-aist a middleware framework for
robotics.

[![Build Status](http://ci.devrt.tk/job/chef-openrtm-aist/badge/icon)](http://ci.devrt.tk/job/chef-openrtm-aist/)

Requirements
------------

- `build-essential` - OpenRTM-aist requires c++ compiler.
- `python` - OpenRTM-aist requires python.
- `omniorb` - OpenRTM-aist requires omniORB.

Attributes
----------

No attributes yet.

Usage
-----

Just include `openrtm-aist` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[openrtm-aist]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

Apache 2.0

Authors: Yosuke Matsusaka
