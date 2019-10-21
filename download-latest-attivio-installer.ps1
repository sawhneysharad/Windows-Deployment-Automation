$attivioRelease = '5.6.2'

$baseUrl = "http://mvn.corp.attivio.com:8081/artifactory"
$apiUrl = "${baseUrl}/api"
$downloadUrl = "${baseUrl}/attivio-installer/${attivioRelease}"

$webclient = new-object system.net.webclient

$latestVersion = $webclient.DownloadString("${apiUrl}/search/latestVersion?g=${attivioRelease}&a=AIE&repos=attivio-installer")

$installerFile = "AIE-${latestVersion}-win64.exe"

$webclient.DownloadFile("${downloadUrl}/${installerFile}", "AIE-installer.exe")