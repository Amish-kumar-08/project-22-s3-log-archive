# **Project 22: S3 Log Archive with Lifecycle**

**Description:**

Created an automated log archiving solution using Amazon S3 and Terraform. Configured an S3 bucket to store application, system, and error logs, and implemented an S3 Lifecycle Rule to automatically expire log objects after 30 days. Enabled server-side encryption and blocked public access to secure the stored logs.

**AWS Resources Created:**
- Amazon S3 Bucket
- S3 Lifecycle Configuration
- S3 Public Access Block
- S3 Server-Side Encryption (SSE-S3)

**Lifecycle Configuration:**
- Rule Name: `expire-old-logs`
- Status: Enabled
- Prefix Filter: `logs/`
- Expiration Period: 30 Days
- Action: Automatic Object Expiration

**Implementation Steps:**
1. Created an S3 bucket using Terraform.
2. Configured S3 public access blocking.
3. Enabled default server-side encryption using AES-256.
4. Created sample application, system, and error log files.
5. Uploaded log files to the S3 bucket using AWS CLI.
6. Configured an S3 Lifecycle Rule to expire objects under the `logs/` prefix after 30 days.
7. Verified the lifecycle configuration using AWS CLI and AWS Management Console.

**Verification Commands:**

```bash
aws s3 ls s3://project-22-s3-log-archive-590507089733/logs/

aws s3api get-bucket-lifecycle-configuration \
  --bucket project-22-s3-log-archive-590507089733
```

**Technologies:**
AWS, Amazon S3, Terraform, AWS CLI, S3 Lifecycle Management, IAM, Linux.

**GitHub Repository:** [Paste GitHub URL]

**Deliverables:**
- S3 Lifecycle Rule configuration screenshot.
- S3 bucket with uploaded log files.
- Terraform infrastructure configuration.

**Outcome:**

Successfully implemented an S3 log archiving workflow with automated lifecycle expiration, demonstrating Infrastructure as Code, cloud storage management, and AWS resource lifecycle automation.
