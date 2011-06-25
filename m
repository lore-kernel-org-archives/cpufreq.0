From: Toralf =?utf-8?q?F=C3=B6rster?= <toralf.foerster@gmx.de>
Subject: is /sys/devices/system/cpu/cpufreq/ondemand/ignore_nice_load gone ?
Date: Sat, 25 Jun 2011 14:24:51 +0200
Message-ID: <201106251424.51860.toralf.foerster@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

At my ThinkPad T400 I tried today kernel 3.0-rc4 but now I cannot use t=
his=20
command any longer :
echo 1> /sys/devices/system/cpu/cpufreq/ondemand/ignore_nice_load

=46urthermore I miss the files under /sys/devices/system/cpu/cpu{0,1}/c=
pufreq

Do I miss a (new ?) config option - I used the old kernel config and co=
mpared=20
it carefully, but maybe ...


--=20
MfG/Sincerely
Toralf F=C3=B6rster
pgp finger print: 7B1A 07F4 EC82 0F90 D4C2 8936 872A E508 7DB6 9DA3
