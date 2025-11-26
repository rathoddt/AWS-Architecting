
# 📥 Writing Data to InfluxDB 3 Core using HTTP API

InfluxDB 3 Core supports writing time series data using the `/api/v3/write_lp` HTTP API. This endpoint accepts **Line Protocol**, a compact text format for writing points to InfluxDB.

---

## ✅ API Endpoint

```
POST /api/v3/write_lp
```

### 🔧 Query Parameters

| Parameter         | Description |
|------------------|-------------|
| `db`             | Target database name |
| `precision`      | Timestamp precision: `ns`, `us`, `ms`, `s` |
| `accept_partial` | Accept (true) or reject (false) partial writes |
| `no_sync`        | Acknowledge write before (true) or after (false) WAL persistence |

---

## 🧪 Sample cURL Request

```bash
curl -v "http://localhost:8181/api/v3/write_lp?db=sensors&precision=s" \
  --data-raw "home,room=Living\ Room temp=21.1,hum=35.9,co=0i 1735545600
home,room=Kitchen temp=21.0,hum=35.9,co=0i 1735545600
home,room=Living\ Room temp=21.4,hum=35.9,co=0i 1735549200"
```

---

## ✍️ Understanding Line Protocol

Each line in Line Protocol contains:
```
<measurement>,<tag_set> <field_set> <timestamp>
```

### Example:
```
home,room=Living\ Room temp=21.1,hum=35.9,co=0i 1735545600
```

---

## ⚠️ Partial Writes

### 1. **With `accept_partial=true` (default)**

- Valid lines are written.
- Invalid lines are rejected.
- Example:

```text
home,room=Sunroom temp=96 1735545600
home,room=Sunroom temp="hi" 1735549200
```

InfluxDB Response:
```json
{
  "error": "partial write of line protocol occurred",
  "data": [
    {
      "original_line": "home,room=Sunroom temp=hi 1735549200",
      "line_number": 2,
      "error_message": "invalid column type for column 'temp'..."
    }
  ]
}
```

### 2. **With `accept_partial=false`**

- Entire batch rejected on error.
- Example Response:

```json
{
  "error": "parsing failed for write_lp endpoint",
  "data": {
    "original_line": "home,room=Sunroom temp=hi 1735549200",
    "line_number": 2,
    "error_message": "invalid column type for column 'temp'..."
  }
}
```

---

## 🚀 Write Performance: `no_sync` Option

| Option           | Behavior |
|------------------|----------|
| `no_sync=false` *(default)* | Acknowledges after data is persisted to Object Store. Safer but slower. |
| `no_sync=true`             | Responds before persistence. Faster, but higher risk of data loss. |

### 🔁 Example (Fast Write):

```bash
curl "http://localhost:8181/api/v3/write_lp?db=sensors&no_sync=true" \
  --data-raw "home,room=Sunroom temp=96"
```

---
