import type { UserConfig } from 'vite';
import * as path from 'path';

const config: UserConfig = {
  root: 'src/',
  publicDir: path.resolve(__dirname, 'public'),
  base: '/systems/monad-echo/',
  server: {
    port: 30001,
    open: true,
    proxy: {
      '^(?!/systems/monad-echo)': 'http://localhost:30000/',
      '/socket.io': {
        target: 'ws://localhost:30000',
        ws: true,
      },
    }
  },
  build: {
    outDir: path.resolve(__dirname, 'dist'),
    emptyOutDir: true,
    sourcemap: true,
    lib: {
      name: 'monad-echo',
      entry: path.resolve(__dirname, 'src', 'monad-echo.ts'),
      formats: ['es'],
      fileName: 'monad-echo'
    }
  },
}

export default config;
