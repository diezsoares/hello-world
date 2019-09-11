
#Importar CSV
$csvdns = Import-Csv C:\Users\diez.silva\Desktop\dnsb2b.csv

#No .csv uma coluna com o nome "hosta" e colocar abaixo os hosts A para criação.
#Caso tenha varios IP's diferentes, criar uma segunda coluna com o nome "ip" e alterar a variavel $ip do foreach para $ip = $dns.ip
#Obs script para ser executado dentro do servidor DNS necessário, pois se exeuctar remotamente deverá incluir o comando -computername

foreach ($dns in $csvdns)
{

    $hostA = $dns.hosta
    $ip = "10.128.132.87"

        Add-DnsServerResourceRecordA `
            -Name $hostA `
            -ZoneName dev-fullcommerce-b2b.net `
            -IPv4Address $ip `
            -TimeToLive 00:05:00
}
            
