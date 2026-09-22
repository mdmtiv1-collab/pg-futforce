@echo off
title Área de Miembros VIP FUTFORCE - Servidor Local
echo =======================================================
echo     Área de Miembros VIP FUTFORCE - Servidor Local
echo =======================================================
echo.
echo URL de acceso: http://localhost:8093/area-de-membros.html
Mantenga esta ventana abierta mientras usa el área de miembros.
Abriendo en su navegador...
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command "& { cd '%~dp0'; $http = [System.Net.HttpListener]::new(); $http.Prefixes.Add('http://localhost:8093/'); $http.Start(); Start-Process 'http://localhost:8093/area-de-membros.html'; while ($http.IsListening) { $context = $http.GetContext(); $request = $context.Request; $response = $context.Response; $path = $request.Url.LocalPath; if ($path -eq '/') { $path = '/area-de-membros.html' }; $localPath = Join-Path $pwd.Path $path; if (Test-Path $localPath -PathType Leaf) { $bytes = [System.IO.File]::ReadAllBytes($localPath); $response.ContentLength64 = $bytes.Length; if ($path.EndsWith('.html')) { $response.ContentType = 'text/html; charset=utf-8' } elseif ($path.EndsWith('.css')) { $response.ContentType = 'text/css' } elseif ($path.EndsWith('.js')) { $response.ContentType = 'application/javascript' } elseif ($path.EndsWith('.png')) { $response.ContentType = 'image/png' } elseif ($path.EndsWith('.jpg') -or $path.EndsWith('.jpeg')) { $response.ContentType = 'image/jpeg' } elseif ($path.EndsWith('.webp')) { $response.ContentType = 'image/webp' }; $response.OutputStream.Write($bytes, 0, $bytes.Length) } else { $response.StatusCode = 404 }; $response.OutputStream.Close() } }"
