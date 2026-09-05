アップロード方法


fvm flutter build web --base-href /sasae_portal/
Remove-Item -Recurse -Force docs
Move-Item build\web docs
git add docs
git commit -m "fix camera section wording"
git push origin master