library(shiny)
library(httr)
library(rjson)
library(dplyr, quietly = TRUE, warn.conflicts = FALSE)
library(ggplot2)
library(varhandle)
library(DT)
library(plotly)



shinyServer(function(input, output) {
   
    url_ini = 'http://aplicacoes.mds.gov.br/sagi/servicos/misocial?q=*&fq=tipo_s:mes_mu&wt=json&rows=0&json.facet={anomes:{type:terms,field:anomes_s,sort:{%22index%22:%22asc%22},limit:10000,facet:{%22soma%22:%22sum(#CAMPO#)%22}}}'
        
    loadData <-function(dataset, campo, ano, uf){
        ano_inicio=paste0(substr(gsub('-','',ano[1]),1,4),'01')
        ano_fim=paste0(substr(gsub('-','',ano[2]),1,4),'12')
        url = paste0(gsub('#CAMPO#',campo, url_ini),'&fq=anomes_s:[',ano_inicio,'%20TO%20',ano_fim,']&fq=codigo_ibge:',uf,'*')
        request=GET(url)
        res=fromJSON(content(request))
        df=do.call(rbind.data.frame,res$facets$anomes$buckets)
        df=df%>%select(1,3)
        colnames(df)=gsub('^val$','anomes',colnames(df))
        df
    }
      output$plotly <- renderPlotly({
              input_campo = input$campo
              s=strsplit(input_campo, '#')
              dataset=s[[1]][1]
              campo=s[[1]][2]
              ano=input$ano
              uf=input$uf
              
              #Carregando dados
              df=loadData(dataset, campo,  ano, uf)
              
              #Removendo fator do campo anomes
              df$anomes = unfactor(df$anomes)
              
              df$anomes = paste0(df$anomes,'01')
              df$anomes = as.Date(df$anomes, "%Y%m%d")
              format_y <- function(l) {
                  l <- format(l, scientific = FALSE, big.mark = '.')
                  l
              }
              format_x <- function(l) {
                 l <- paste0(substring(l,1,4),'-',substring(l,5,6))
                  l
              }
              
              observe(print(paste(min(df$soma),max(df$soma))))
              
              #Remover zeros no final do dataframe
              df=df[min(which(df$soma!=0)):max(which(df$soma!=0)),]
              
              plot_ly(df, x = ~anomes, y = ~soma, type = "bar") %>%
                  layout(
                      title = '',
                      xaxis = list(
                          title = 'Ano/Mês'
                      ),
                      yaxis = list(
                          title = '',
                          range = c(min(df$soma)*0.95,max(df$soma)*1.05)
                      )
                  )
        
    })
    
output$tbl = renderDataTable({
    input_campo = input$campo
    s=strsplit(input_campo, '#')
    dataset=s[[1]][1]
    campo=s[[1]][2]
    
    df=loadData(dataset, campo,  input$ano, input$uf)
    df$soma=format(df$soma, digits=9, decimal.mark=",",  big.mark=".", small.interval=2)
    colnames(df)=c('Ano Mês (AAAAMM)',names(campos[campos==input_campo]))
    df
},  extensions = 'Buttons', options = list(
    pageLength = 12,
    lengthMenu = c(12, 24, 36, 48),
    dom = 'lBrtip',
    buttons = c('csv','copy')),
rownames= FALSE , 
style = 'bootstrap')
 

})
