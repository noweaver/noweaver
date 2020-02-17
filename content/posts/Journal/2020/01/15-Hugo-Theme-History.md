---
date: 2020-01-15  
title: Hugo 블로그 테마 - Book
tags: [Hugo, "설치"]
categories: [잡동사니]
---

휴고의 테마는 지킬이나 헥소와 비교하여 역사만큼 훌륭한 것을 찾기가 어렵다. 대부분의 테마가 지킬이나 헥소에서 가져와서 수정하는 것이 많다. 딱히 거기에는 불만은 없다. 그럼에도 나는 가장 흰색바탕의 깔끔하면서 심플한 것을 좋아한다. 그런데 꼭 그런 테마를 고르게 되면 다소 기능적으로 부족하거나 수정을 해도 뭔가 밉상이다. 아마도 저작자의 디자인과 어울리지 않기 때문일 것이다. 

이번에 만난 [북테마](https://themes.gohugo.io/hugo-book/)는 정말 디자인이 너무나 마음에 든다. 하지만 디자인으로 충분히 보상을 받았음에도 더 마음에 드는 기능은 바로 검색기능과 편집기능, 목차 기능이다. 검색기능을 달려면 페이지가 전환되는데, 이 테마는 그렇게 되지 않는다. (갑자기 생각이 드는 것은 컨텐츠 양이 많아지면 페이지 전환이 필요할 것 같다). 그리고 편집기능은 깃헙의 Edit 기능을 그대로 가져간다. 컨텐츠를 편집하려고 하면 Editor 버튼만 클릭하면 된다. (그런데, 퍼블리싱까지 되는지 확인 안 해봤네...)

하지만, 가장 마음에 드는 것은 Alex라는 이 테마를 만든 친구의 대응이다. 내가 초보임에도 아주 친절하게 계속해서 알려준다. 

이 테마가 성숙해지면 어떻게 될지 몰라 기록으로 남겨둔다. 


# 테마 수정

이 테마는 뭔가 책을 출판할 수 있는 것 같은 테마다. 그래서 블로그 포스트가 가장 먼저 나오지 않는다. 하지만, 나는 블로그를 원했기 때문에 Alex에서 요청하니, 다음과 같은 페이지를 만들어 주었다.

파일이름: layouts/home.html

```html
{{ define "main" }}
{{ with .Site.GetPage "section" "posts" }}
  {{ $paginator := .Paginate (where .Pages "Params.hidden"  "ne" true) }}
  {{ range sort .Paginator.Pages }}
  <article class="markdown book-post">
    <h2>
      <a href="{{ .RelPermalink }}">{{ .Title }}</a>
    </h2>
    {{ partial "docs/post-meta" . }}
    <p>
      {{- .Summary -}}
      {{ if .Truncated }}
        <a href="{{ .RelPermalink }}">...</a>
      {{ end }}
    </p>
  </article>
  {{ end }}

  {{ template "_internal/pagination.html" . }}
{{ end }}
{{ end }}

{{ define "toc" }}
  {{ partial "docs/taxonomy" . }}
{{ end }}
```

# 댓글 수정

Book 테마는 Disqus 서비스로 댓글 구현을 해 놓았는데, 나는 utterances 이용하기로 했다. [여기](https://fernando.kr/7)를 참고했다.

1. Github에 Public Repository를 [생성](https://github.com/new)한다. 
2. 이름은 `noweaver-comment`로 했다.
3. https://github.com/apps/utterances로 들어가서 github 앱을 설치한다.
4. 1번의 과정에서 만든 `noweaver-comment` Repository 에게 권한을 준다.
5. 아래의 코드를 내 블로그에 붙인다.

```html
<script src="https://utteranc.es/client.js"
        repo="noweaver-comment"
        issue-term="[##_article_rep_link"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>
```

하지만, 이렇게 붙이면 첫 화면에서도 댓글이 보인다. 따라서 이것은 테마를 수정해야 했다. 

theme/books/layouts/partials/docs/comments.html

```html
<!-- This partial can be replaced to support other commenting engines -->
{{ if .Content }}
    {{ template "_internal/disqus.html" . }}
{{ end }}
```