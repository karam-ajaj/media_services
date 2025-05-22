# 📺 Media Services Deployment Automation

**Auto-deploy media services using Docker Compose, Kubernetes, or Docker Swarm.**

This project streamlines the deployment of various media-related services—such as Plex, Jellyfin, Sonarr, Radarr, and more—by leveraging container orchestration tools. It provides a unified approach to manage these services across different environments, ensuring consistency and ease of maintenance.

---

## 🚀 Features

- **Multi-Orchestrator Support**: Deploy services using Docker Compose, Kubernetes, or Docker Swarm.
- **Automated Setup**: Utilize provided shell scripts for seamless installation and teardown.
- **Service Management**: Easily add, remove, or update media services as needed.
- **Scalability**: Designed to scale with your media consumption needs.

---

## 📁 Repository Structure

```
media_services/
├── yml/
│   └── swarm/            # Docker Swarm stack files
├── setup.sh              # Initializes the deployment environment
├── deploy.sh             # Deploys the media services
├── delete.sh             # Removes deployed services
└── README.md             # Project documentation
```

---

## 🛠️ Prerequisites

- **Docker**: Ensure Docker is installed and running.
- **Docker Compose** (for Compose deployments)
- **Kubernetes** (for Kubernetes deployments)
- **Docker Swarm** (for Swarm deployments)
- **Shell Environment**: Unix-like shell (e.g., Bash)

---

## ⚙️ Usage

### 1. Clone the Repository

```bash
git clone https://github.com/karam-ajaj/media_services.git
cd media_services
```

### 2. Set Up the Environment

```bash
./setup.sh
```

This script will prepare your system by installing necessary dependencies and configuring the environment.

### 3. Deploy Services

For Docker Compose:

```bash
./deploy.sh compose
```

For Kubernetes:

```bash
./deploy.sh kubernetes
```

For Docker Swarm:

```bash
./deploy.sh swarm
```

### 4. Teardown Services

To remove the deployed services:

```bash
./delete.sh
```

---

## 📦 Included Services

- **Plex**: Media server for streaming movies and TV shows.
- **Jellyfin**: Open-source media system.
- **Sonarr**: TV series management.
- **Radarr**: Movie collection manager.
- **Others**: Easily extendable to include additional services.

*Note: The actual services deployed depend on the configuration files within the `yml/` directory.*

---

## 🧩 Customization

Feel free to modify the YAML files within the `yml/` directory to tailor the deployments to your specific needs. You can add new services, adjust resource allocations, or change environment variables as required.

---

## 🤝 Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your enhancements.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 📬 Contact

For questions or support, please open an issue on the [GitHub repository](https://github.com/karam-ajaj/media_services/issues).
