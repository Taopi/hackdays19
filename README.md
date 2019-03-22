# hackdays19
Dieser Crawler liest für srf.ch html elemente aus wie titel, twitter.image, etc.


Vier manuelle Schritte sind notwendig um den Crawler zu betätigen: 
*1: Url Liste von "Webtrekk" runterladen: https://analytics.webtrekk.com/analytics/#!/analytics/permalink/account/292330999892453/reports/963

*2: cleanen der erhalltenen Liste (anfangszeilen und zwei Zeilen am Schluss)

(*3. Upload der Liste auf github)

4. in "execute.R" ändern der "data.url" für den read.delim()
