deploy_all() {
  local site_path=.site
  mkdir -p $site_path
  rm $site_path/* -rf

  bundle exec jekyll build -d $site_path
}

deploy_all
