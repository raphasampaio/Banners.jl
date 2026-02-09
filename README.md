# Banners.jl

[![Documentation](https://img.shields.io/badge/docs-dev-blue.svg)](https://raphasampaio.github.io/Banners.jl/dev)
[![CI](https://github.com/raphasampaio/Banners.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/raphasampaio/Banners.jl/actions/workflows/CI.yml)
[![codecov](https://codecov.io/gh/raphasampaio/Banners.jl/graph/badge.svg?token=2rKx1HN9E4)](https://codecov.io/gh/raphasampaio/Banners.jl)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

## Introduction

Banners.jl is a ...

https://patorjk.com/software/taag

## Getting Started

### Installation

```julia
pkg> add Banners
```

### Example

```julia
using Banners

string = create_gradient_banner(
  Banners.Fonts.FIGlet("DOS Rebel"),
  "Julia",
  foreground_colors = BannerColors(
    top_left="#4063d8",
    top_right="#389826",
    bottom_left="#cb3c33",
    bottom_right="#9558b2",
  ),
)
```

```bash
        █████            ████   ███
       ░░███            ░░███  ░░░
        ░███  █████ ████ ░███  ████   ██████
        ░███ ░░███ ░███  ░███ ░░███  ░░░░░███
        ░███  ░███ ░███  ░███  ░███   ███████
  ███   ░███  ░███ ░███  ░███  ░███  ███░░███
 ░░████████   ░░████████ █████ █████░░████████
  ░░░░░░░░     ░░░░░░░░ ░░░░░ ░░░░░  ░░░░░░░░
```

## Contributing

Contributions, bug reports, and feature requests are welcome! Feel free to open an issue or submit a pull request.