# Maintainer: Ivan Agarkov <ivan.agarkov@gmail.com>
pkgname=amd-fx-thermal-cpu-control
pkgver=0.1
pkgrel=3
pkgdesc="AMD FX processors themperature control"
arch=('any')
url="https://github.com/annmuor/amd-fx-thermal-cpu-control"
license=('APL')
depends=('lm_sensors' 'cpupower')
source=("amd-fx-thermal-cpu-control.service" "amd-fx-thermal-cpu-control.sh")
md5sums=('204f6284b4e96f079f91074725c2a61d' 'da5e2ad460679e384791d67d336784fe')
package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  install -m 755 amd-fx-thermal-cpu-control.sh "$pkgdir/usr/bin/"
  install -m 644 amd-fx-thermal-cpu-control.service "$pkgdir/usr/lib/systemd/system/"
}
