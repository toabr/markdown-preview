<div align="center">
<h1>📑 Markdown Preview 📽</h1>

**A solution to quickly and effortlessly previewing Markdown files directly in your browser.**

Powered by the [Astro](https://astro.build/) development server within a `Docker` container, this tool enables seamless live previews of `Markdown` files right on your local system. With the aesthetic touch of [github-markdown-css](https://github.com/sindresorhus/github-markdown-css), your previews are not only functional but visually appealing.

Navigate effortlessly through a collection of Markdown files, thanks to Astro's [ content-collection ](https://docs.astro.build/en/guides/content-collections/) feature. Experience the convenience of a simple homepage, displaying a comprehensive list of all available files, allowing for easy access and swift transitions.
</div>

<br/>

## Usage

> Only content collections are allowed inside the src/content directory. This directory cannot be used for anything else.
> A collection entry is any piece of content stored inside of your content collection directory. Entries can use content authoring formats including Markdown (.md) and MDX (.mdx using the MDX integration) or as one of two supported data formats: YAML (.yaml) and JSON (.json). We recommend using a consistent naming scheme (lower-case, dashes instead of spaces) for your files to make it easier to find and organize your content, but this is not required. You can also exclude entries from being built by prefixing the filename with an underscore (_).

<br/>

### Using docker compose:

edit the path to your collection under volumes in `docker-compose.yml` 

```yml
version: "3.6"
services:
  astro:
    build: .
    image: toabr/markdown-preview
    ports:
      - "127.0.0.1:3000:4321"
    restart: unless-stopped
    volumes:
      - /your/collection:/app/src/content/markdown # Change me!
```

and run:

```sh
docker compose up -d
```

now open `http://localhost:3000` in the browser

<br/>

### Using docker run:

first build the image:
```sh
docker build -t toabr/mdp .
```

then `cd` into your markdown folder and run a container:
```sh
docker run --rm -it \
  -p 3000:4321 \
  -v $(pwd):/app/src/content/markdown \
  toabr/mdp
```

or detached:
```sh
docker run -d --name Markdown-Preview \
  -p 3000:4321 \
  -v $(pwd):/app/src/content/markdown \
  toabr/mdp
```

and open `http://localhost:3000` in the browser

<br/>

##### TODO:
- single file solution
- make subfolders work
- integrate `frontmatter`
- move /app/src/content/markdown to /markdown
- add a theme switch button
