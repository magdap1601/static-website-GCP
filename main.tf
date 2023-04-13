resource "google_storage_bucket" "static-site" {
  name          = "static-website-terraform"
  location      = "EU"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "./website/index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://image-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}

resource "google_storage_bucket_access_control" "public_rule" {
  bucket = google_storage_bucket.static-site.name
  role   = "READER"
  entity = "allUsers"
}
resource "google_storage_bucket_object" "picture" {
  name   = "img1.jpg"
  source = "./website/img1.jpg"
  bucket = "static-website-terraform"
}
resource "google_storage_bucket_object" "style" {
  name   = "styles.css"
  source = "./website/styles.css"
  bucket = "static-website-terraform"
}
