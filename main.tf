resource "google_storage_bucket" "bucket_with_backend" {
  name          = var.bucket_backend_name
  location      = var.bucket_location
  force_destroy = true

  public_access_prevention = "enforced"
}

resource "google_storage_bucket" "static-site" {
  name          = var.bucket_name
  location      = var.bucket_location
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://image-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}

resource "google_storage_bucket_iam_binding" "static-site_iam_binding" {
  bucket = google_storage_bucket.static-site.name
  role   = "roles/storage.objectViewer"
  members = [
    "allUsers"
  ]
}
resource "google_storage_bucket_object" "picture" {
  name   = "img1.jpg"
  source = "./website/img1.jpg"
  bucket = "static-website-terraform"
}
resource "google_storage_bucket_object" "main-page-html" {
  name   = "index.html"
  source = "./website/index.html"
  bucket = "static-website-terraform"
}
