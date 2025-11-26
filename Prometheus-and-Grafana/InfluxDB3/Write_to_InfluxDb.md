
# 📝 Getting Started: Write Data into InfluxDB 3 Core

This guide explains how to ingest time-series data into **InfluxDB 3 Core** using line protocol via CLI or HTTP API.

---

## What Is Line Protocol?

Line protocol is the native, text-based format used to write data points into InfluxDB.  
Each line encodes:

- **Measurement**: identifying the series  
- **Tags**: key=value pairs (metadata, indexed)  
- **Fields**: key=value pairs (actual data, any type)  
- **Timestamp**: Unix timestamp (supports nanoseconds). Precision must be specified if not nanoseconds.

### Example Structure

```
measurement,tagKey=tagValue fieldKey=fieldValue timestamp
```

---

## Example Data: Home Environment Sensors

A simple use case of sensors in the *Living Room* and *Kitchen* measuring temperature (°C), humidity (%), and CO (ppm):

| Room        | temp | hum  | co  |
|-------------|------|------|-----|
| Living Room | float| float| int |
| Kitchen     | float| float| int |

Sample data (hourly readings):

```text
home,room=Living\ Room temp=21.1,hum=35.9,co=0i 1641024000
home,room=Kitchen     temp=21.0,hum=35.9,co=0i 1641024000
```

---

## Writing via CLI

Use the `influxdb3 write` command to send line protocol.

### Options:

- `--bucket <BUCKET_NAME>`
- `--token <YOUR_TOKEN>`
- `--precision s|ms|us|ns` (seconds, milliseconds, etc.)
- Data via `--file`, `stdin`, or direct string

### Example (inline):

```bash
influxdb3 write   --bucket home_data   --token $INFLUX_TOKEN   --precision s   'home,room=Living\ Room temp=21.1,hum=35.9,co=0i 1641024000
   home,room=Kitchen     temp=21.0,hum=35.9,co=0i 1641024000'
```  

### Example (from file):

```bash
echo 'home,...' > home.lp
influxdb3 write --bucket home_data --token $INFLUX_TOKEN --file home.lp
```  

---

## Writing via HTTP API

You can send an HTTP POST to the `/api/v3/write_lp` endpoint with:

- **Headers**:  
  `Authorization: Bearer <TOKEN>`  
  `Content-Type: text/plain; charset=utf-8`
- **Query parameters**: `bucket`, `precision`, optional `org`
- **Body**: raw line protocol

### Example using cURL:

```bash
curl -X POST 'http://localhost:8181/api/v3/write_lp?bucket=home_data&precision=s'   --header 'Authorization: Bearer '"$INFLUX_TOKEN"   --header 'Content-Type: text/plain; charset=utf-8'   --data-binary @home.lp
```  

---

## Summary

- **Build data** in line protocol format (measurement, tags, fields, timestamp)  
- **Write via CLI** (`influxdb3 write`) or **HTTP API** (`/api/v3/write_lp`)  
- **Specify timestamp precision** if using non-nanosecond timestamps  
- **Always authenticate** using a valid InfluxDB 3 Core token

---