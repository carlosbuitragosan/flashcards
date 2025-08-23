<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Flashcards</title>
  @vite(['src/main.tsx'])

    {{-- PWA support --}}
  <link rel="manifest" href="/site.webmanifest" />
  <link rel="apple-touch-icon" href="/logo/web-app-manifest-192x192.png" sizes="192x192">
  <meta name="theme-color" content="#241f1f" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta name="apple-mobile-web-app-title" content="Flashcards" />
</head>
<body>
  <div id="root"></div>
</body>
</html>