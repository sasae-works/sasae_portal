アップロード方法


flutter build web --base-href /sasae_portal/
Remove-Item -Recurse -Force docs
Move-Item build\web docs
git add docs
git commit -m "add privacy route"
git push origin master