# Spring Boot Hello World on ARM64

A simple Spring Boot Hello World application designed to run on both x64 and ARM64 architectures using multi-architecture containers.

## Features

- Simple REST API with Hello World endpoints
- Built with Spring Boot 3.2.0 and Java 17
- Multi-platform Docker support (x64 and ARM64)
- Distroless container for minimal attack surface
- GitHub Actions CI/CD pipeline
- Comprehensive test coverage

## API Endpoints

- `GET /` - Returns "Hello World from Spring Boot on ARM64!"
- `GET /hello?name=YourName` - Returns personalized greeting
- `GET /health` - Health check endpoint

## Running Locally

### Prerequisites
- Java 17
- Maven 3.6+

### Run with Maven
```bash
mvn spring-boot:run
```

The application will start on `http://localhost:8080`

### Run Tests
```bash
mvn test
```

## Docker

### Build Docker Image
```bash
docker build -t springboot-helloworld .
```

### Run Docker Container
```bash
docker run -p 8080:8080 springboot-helloworld
```

### Multi-platform Build
```bash
docker buildx build --platform linux/amd64,linux/arm64 -t springboot-helloworld .
```

## GitHub Container Registry

The CI/CD pipeline automatically builds and pushes multi-platform images to GitHub Container Registry (GHCR) on every push to the main branch.

### Pull from GHCR
```bash
docker pull ghcr.io/YOUR_USERNAME/springboot-on-arm64:latest
```

### Run from GHCR
```bash
docker run -p 8080:8080 ghcr.io/YOUR_USERNAME/springboot-on-arm64:latest
```

## CI/CD Pipeline

The GitHub Actions workflow includes:
- **Test Job**: Runs Maven tests with JUnit reporting
- **Build Job**: Creates multi-platform Docker images and pushes to GHCR

### Supported Platforms
- `linux/amd64` (x86_64)
- `linux/arm64` (ARM64/aarch64)

## Security Features

- Uses Eclipse Temurin Java 17 JRE base image
- Multi-architecture support (x64 and ARM64)
- Non-root user execution for security
- Multi-stage build to reduce image size

## Project Structure

```
├── .github/
│   └── workflows/
│       └── ci.yml              # GitHub Actions CI/CD pipeline
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/example/springboothelloworld/
│   │   │       ├── SpringbootHelloworldApplication.java
│   │   │       └── HelloController.java
│   │   └── resources/
│   │       └── application.properties
│   └── test/
│       └── java/
│           └── com/example/springboothelloworld/
│               ├── SpringbootHelloworldApplicationTests.java
│               └── HelloControllerTest.java
├── Dockerfile                  # Multi-stage Dockerfile with distroless
├── pom.xml                    # Maven configuration
└── README.md
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests: `mvn test`
5. Submit a pull request

The CI pipeline will automatically test your changes and build multi-platform images. 