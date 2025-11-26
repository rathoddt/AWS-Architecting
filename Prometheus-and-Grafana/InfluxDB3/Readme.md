# Getting Started with InfluxDB 3 Core

Start **InfluxDB 3 Core**, configure a file system-based object store, and set up authorization.

---

## Starting InfluxDB 3 Core

Use the `influxdb3 serve` command to start the server.
Use the `influxdb3 serve --help`, For more information about server options.

### Required Parameters

- `--node-id`: A unique string identifier for the server instance. Forms the final part of the storage path:
  ```
  <CONFIGURED_PATH>/<NODE_ID>
  ```

- `--object-store`: Specifies the type of object store to use. Supported values include:

  | Object Store        | Description                                                                 |
  |---------------------|-----------------------------------------------------------------------------|
  | `file`              | Local file system                                                           |
  | `memory`            | In-memory (no persistence)                                                  |
  | `memory-throttled`  | In-memory with simulated latency and throughput                             |
  | `s3`                | AWS S3 or S3-compatible (e.g., Ceph, Minio)                                 |
  | `google`            | Google Cloud Storage                                                        |
  | `azure`             | Azure Blob Storage                                                          |

---

## Diskless Architecture

InfluxDB 3 supports a **diskless architecture**, capable of operating entirely with remote object storage. Alternatively, it can use only local disk storage.

For local development or testing, use the `file` object store.

### Example (File System Object Store)

```bash
influxdb3 serve \
  --node-id my_host_name \
  --object-store file \
  --data-dir ~/.myInfluxDB
```
---

## Set Up Authorization

InfluxDB 3 uses **token-based authorization**. Authorization is enabled by default.

- **Admin tokens** grant full access to CLI and API operations.
- Tokens are required for most interactions via CLI or HTTP API.

### Create an Operator Token

After the server starts, create an admin token (operator token) using:

```bash
influxdb3 create token --admin
```

🔐 **Note**: The token is displayed only once. Store it securely.

---

## Set Your Token for Authorization

### Option 1: Environment Variable (Recommended)

```bash
export INFLUXDB3_AUTH_TOKEN=YOUR_AUTH_TOKEN
```



### Option 2: Command-Line Flag

```bash
influxdb3 <command> --token YOUR_AUTH_TOKEN
```
---


### Handy commands
```
influxdb3 --version
influxdb3 show databases
influxdb3 serve   --node-id=node0   \
--http-bind=0.0.0.0:8181   \
--object-store=file   \
--data-dir /root/.influxdb/data   \
--plugin-dir /root/.influxdb/plugins  &

influxdb3 write   --database node0   \
--token $INFLUXDB3_AUTH_TOKEN   \
--host http://localhost:8181   \
"temperature,room=living value=27"


influxdb3 query   --database node0   \
--token $INFLUXDB3_AUTH_TOKEN   -\
-host http://localhost:8181   \
"SELECT * FROM temperature"
```
