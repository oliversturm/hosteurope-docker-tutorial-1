FROM node:lts as build
WORKDIR /source

# install packages as a separate layer
COPY NodeApp/package.json ./NodeApp/
COPY NodeApp/package-lock.json ./NodeApp/
# don't copy svelte.config.js - Svelte Kit runs a 'sync'
# step as an npm 'prepare' script and this renders errors
# if all the routes are not there yet
# OTOH the sync step shows a warning if svelte.config.js
# can't be found, will need to ignore this.
# COPY NodeApp/svelte.config.js ./NodeApp/
WORKDIR /source/NodeApp
RUN npm clean-install

WORKDIR /source
COPY NodeApp/. ./NodeApp/
WORKDIR /source/NodeApp
RUN npm run build

# use a second step just so the sources don't remain
# in the image - if that doesn't matter to you, the 
# image build will be much simpler
FROM node:lts
WORKDIR /app
COPY --from=build /source/NodeApp/build/. ./build/
COPY --from=build /source/NodeApp/package.json ./package.json
COPY --from=build /source/NodeApp/node_modules/. ./node_modules/
ENTRYPOINT ["node", "build"]
