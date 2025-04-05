# 🛠 devShells.nix – Your Dev Environment with Zero Setup Drama

> Because life's too short to spend hours setting up dev environments. Just `nix develop` and get coding. ⚡

## 🚀 What is it?

A collection of pre-configured Nix dev environments for all your favorite programming languages and frameworks. Perfect for those who want to focus on **actual code**—not fighting with dependencies.

| 🖥 **Dev Shell** | 🔧 **Description**                                                                        |
| ---------------- | ----------------------------------------------------------------------------------------- |
| 🧑‍💻 **asm**       | Assembly: "If you want to make an apple pie, one must first create the universe."         |
| 💻 **cpp**       | C/C++: Where segmentation faults are a way of life and your coffee is always strong.      |
| 🌐 **fetch**     | Nixpkgs fetchers: Because you can't have enough `curl` and `wget` in your life.           |
| 🦦 **go**        | Go: Quick and dirty, like a hackathon project you’ll regret later.                        |
| 📚 **haskell**   | Haskell: The whitepaper language—great for academia, not for real apps.                   |
| ☕ **java**      | Java: 10 lines of boilerplate to say “Hello, World.”                                      |
| 🖋 **js**        | JavaScript: Spaghetti code for frameworks that break every 6 months.                      |
| 🍏 **mac**       | macOS libraries: Apple’s solution for making every simple task unnecessarily complicated. |
| 🐍 **python**    | Python: Fast to write, slow to run, and unreadable for future-you.                        |
| 🦀 **rust**      | Rust: Safety first, but good luck waiting 30 minutes for that "Hello, World" to compile.  |
| 🧩 **zig**       | Zig: For those who want to make C look too safe and easy.                                 |

## 🧑‍💻 How to Use

With flakes:

```bash
nix develop .#<language>
```

Where `<language>` is one of the dev shells listed above (like `asm`, `cpp`, `go`, etc.).

For example, to jump into a Go development environment, just:

```bash
nix develop .#go
```

You can even install multiple dev shells for different languages:

```bash
nix develop .#go .#rust
```

Boom, you're ready to build anything. 🏗

## 🛠 Why?

Because if your dev environment takes longer to set up than your actual project, you're doing it wrong. With `devShells.nix`, the environment is perfect every time, the tools are ready to roll, and **your focus stays on the code** (not the setup).

---

💥 Built with Nix to make every dev environment reproducible, isolated, and _so_ much faster than arguing about tabs vs spaces. 🙃

Let’s be honest, we’re just here to code, not to configure. 🍿
