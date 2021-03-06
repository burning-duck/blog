[#assign site = sitefn.site()!]
[#assign theme = sitefn.theme(site)!]

[#---- TITLE OF THE PAGE TEASER LIST ----]
  [#if content.title?has_content]
    <h2>${content.title}</h2>
  [/#if]

[#---- PAGE TEASER LIST ----]
  [#if content.page?has_content]

    [#---- GET THE PAGE LINK AND RUN TRUH THE CHILDS ----]
      [#assign parentPage = cmsfn.contentByPath(content.page)! ]

      [#if content.limit?has_content]

        [#---- LIMIT THE LIST ----]
          [#assign count = 0]
          [#list cmsfn.children(parentPage, "mgnl:page") as pageContent ]
            [#if count < content.limit]
              [#assign currentPageTemplate = cmsfn.metaData(pageContent, "mgnl:template")]
              [#if currentPageTemplate?? && currentPageTemplate == "burning-duck:pages/authoring"]

                [#include "/burning-duck/common/snippets/pageListTeaserSnippet.ftl"]
                . . . <a href="${cmsfn.link(pageContent)}">read more</a>

                [#assign count += 1]
              [/#if]
            [/#if]
          [/#list]

      [#else]

        [#list cmsfn.children(parentPage, "mgnl:page") as pageContent ]
          [#assign currentPageTemplate = cmsfn.metaData(pageContent, "mgnl:template")]
          [#if currentPageTemplate?? && currentPageTemplate == "burning-duck:pages/authoring"]

            [#include "/burning-duck/common/snippets/pageListTeaserSnippet.ftl"]
            . . . <a href="${cmsfn.link(pageContent)}">read more</a>

          [/#if]
        [/#list]

      [/#if]

  [/#if]
