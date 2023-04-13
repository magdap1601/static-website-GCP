resource "google_storage_bucket" "static-site" {
  name          = "static-website-terraform"
  location      = "EU"
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

/*resource "google_storage_bucket_access_control" "public_rule" {
  bucket = google_storage_bucket.static-site.name
  role   = "READER"
  entity = "allUsers"
}*/

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
resource "google_storage_bucket_object" "style1" {
  name         = "style.css"
  source       = "./website/style.css"
  bucket       = "static-website-terraform"
  content_type = "text/css"
}
resource "google_storage_bucket_object" "main-page-html" {
  name   = "index.html"
  source = "./website/index.html"
  bucket = "static-website-terraform"
}
