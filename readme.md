# linkding on Fly

> 🔖 Run the self-hosted bookmark service [linkding](https://github.com/sissbruecker/linkding) on [Fly](https://fly.io/). Automatically backup the bookmark database to [Amazon S3](https://aws.amazon.com/s3/) with [Litestream](https://litestream.io/).

## Pricing

This setup runs on a [shared-cpu-1x](https://fly.io/docs/about/pricing/#fly-machines) VM, using 512MB RAM (~$3.19/mo) and a 1GB volume. You’ll end up paying nothing in compute costs if your total costs for the month are under $5.

## Prerequisites

- A [Fly](https://fly.io/) account
- An [Amazon AWS](https://aws.amazon.com/account/) account
- `fly` CLI installed

> [!NOTE]
> If you want to use another platform for database replication, check Litestream’s [replica guides](https://litestream.io/guides/#replica-guides) docs and adjust the config as needed

For now, if you’re looking for in-depth instructions, you can head over to [@fspoettel](https://github.com/fspoettel/linkding-on-fly)’s repository. It shows you how to set it up with detailed instructions, as well as some troubleshooting steps.

## License

[MIT](./license.md)
