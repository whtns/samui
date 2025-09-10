FROM guergeiro/pnpm:22-10

COPY . .
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile
RUN pnpm run build
EXPOSE 8000
CMD [ "pnpm", "start" ]
