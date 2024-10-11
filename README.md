# Headless Directus Starter

[Directus](https://github.com/directus/directus) is a versatile and powerful backend solution that allows you to manage your blog content seamlessly. As an open-source data platform, Directus bridges the gap between no-code content management and developer flexibility. Whether you need to organize blog posts, manage authors, or categorize content, Directus provides an intuitive interface for non-developers while offering complete customization through an API for developers.

By using Directus as your blog's backend, you gain the ability to structure and manage content without being tied to predefined templates. Its database-first approach ensures that your content is stored and handled with flexibility, enabling integrations with any frontend framework. Additionally, with Directus' role-based permissions, you can control who has access to different parts of your blog, making collaboration easier.

In short, Directus provides a dynamic and scalable solution for managing your blog, giving you the tools you need to focus on content creation while ensuring powerful backend functionality.

## Important Notice

This project uses Directus (version 11.1.0) which is licensed under the Business Source License 1.1. Please be aware of the following:

- This project is not officially associated with or endorsed by Directus.
- Usage of Directus is subject to their license terms, including financial limitations. As of the current version, Directus can be used in production as long as your Total Finances do not exceed US $5,000,000 for the most recent 12-month period.
- For full license details and up-to-date information, please refer to the [Directus License](https://github.com/directus/directus/blob/main/license).

## License

The custom code in this project (excluding Directus and its components) is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Disclaimer

This project is provided "as is", without warranty of any kind. The authors or copyright holders shall not be liable for any claim, damages or other liability arising from the use of the software.

## Quickstart

```bash

# copy env
cp .env.example .env

# start
docker compose up -d
```


## Default Admin & Password

- User: admin@example.com
- Password: d1r3ctu5

## Installed Extensions

- [directus-extension-tags-m2m-interface](https://github.com/dimitrov-adrian/directus-extension-tags-m2m-interface.git)
- [directus-extension-wpslug-interfac](https://github.com/dimitrov-adrian/directus-extension-wpslug-interface)
- [directus-extension-generate-types](https://github.com/maltejur/directus-extension-generate-types/)
- [directus-extension-display-link](https://github.com/jacoborus/directus-extension-display-link)

## Resource

- [Directus Developer Blog](https://docs.directus.io/blog/)
