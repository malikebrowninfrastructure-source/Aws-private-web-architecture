#!/usr/bin/env bash
set -euo pipefail

# imds-check.sh
# Goal: Detect IMDS availability + whether IMDSv2 token is required, then fetch a few fields.

IMDS="http://169.254.169.254"

echo "[*] Checking basic reachability..."
curl -sS --max-time 2 "${IMDS}/latest/meta-data/" >/dev/null 2>&1 || true

echo "[*] Trying IMDSv1 request (expected to fail if IMDSv2 required)..."
HTTP_CODE=$(curl -sS -o /dev/null -w "%{http_code}" --max-time 2 "${IMDS}/latest/meta-data/" || true)
echo "IMDSv1 HTTP status: ${HTTP_CODE}"

echo "[*] Requesting IMDSv2 token..."
TOKEN=$(curl -sS --max-time 2 -X PUT "${IMDS}/latest/api/token" \
-H "X-aws-ec2-metadata-token-ttl-seconds: 21600" || true)

if [[ -z "${TOKEN}" ]]; then
echo "ERROR: Could not obtain IMDSv2 token. IMDS might be disabled or blocked."
exit 2
fi

echo "[*] Using token to query metadata..."
INSTANCE_ID=$(curl -sS --max-time 2 -H "X-aws-ec2-metadata-token: ${TOKEN}" \
"${IMDS}/latest/meta-data/instance-id")

AZ=$(curl -sS --max-time 2 -H "X-aws-ec2-metadata-token: ${TOKEN}" \
"${IMDS}/latest/meta-data/placement/availability-zone")

LOCAL_IPV4=$(curl -sS --max-time 2 -H "X-aws-ec2-metadata-token: ${TOKEN}" \
"${IMDS}/latest/meta-data/local-ipv4")

echo "instance-id: ${INSTANCE_ID}"
echo "availability-zone: ${AZ}"
echo "local-ipv4: ${LOCAL_IPV4}"

echo "[*] Result interpretation:"
if [[ "${HTTP_CODE}" == "401" ]]; then
echo "IMDSv2 is enforced (IMDSv1 calls return 401)."
elif [[ "${HTTP_CODE}" == "200" ]]; then
echo "IMDSv1 appears allowed (but IMDSv2 still works)."
else
echo "IMDSv1 returned ${HTTP_CODE} (could be disabled/blocked)."
fi
