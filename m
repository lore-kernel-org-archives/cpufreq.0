From: "Alexander Perschbacher" <alexander.perschbacher@rub.de>
Subject: Bug entdeckt
Date: 3 Feb 2012 10:59:11 +0100
Message-ID: <1753471.EGZtfceMdM@elabi>
Reply-To: alexander.perschbacher@rub.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

Hallo! Ich habe folgenden Fehler entdeckt:

Es scheint einen Anzeige-Bug zu geben: Obwohl=20
"cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq"
800000 anzeigt (also innerhalb der Grenzen, die ich in der=20
cpufreqd.conf setzte), zeigt cpufreq-info best=E4ndig 2,40GHz an.=20
Auch "cat /proc/cpuinfo" best=E4tigt mir, dass der Prozessor mit=20
800MHz l=E4uft.

Cpufreq-info scheint hier falsche Daten auszugeben.

Mein System: Acer TimelineX 3830TG, Core i5, Treiber ist=20
acpi_cpufreq  und mein Linux Gentoo.


Liebe Gr=FC=DFe,
