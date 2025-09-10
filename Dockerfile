FROM guergeiro/pnpm:22-10

COPY . .
RUN --mount=type=cache,id=pnpm_store,target=/pnpm/store pnpm fetch --frozen-lockfile
RUN --mount=type=cache,id=pnpm_store,target=/pnpm/store pnpm install --frozen-lockfile --reporter=ndjson

RUN pnpm run build
EXPOSE 8000
CMD [ "pnpm", "run", "preview", "--port", "8080", "--host", "0.0.0.0"]
