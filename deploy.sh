deploy_all() {
  local site_path=.site
  mkdir -p $site_path
  rm $site_path/* -rf

  bundle exec jekyll build -d $site_path
  touch $site_path/.nojekyll
}

deploy_all
