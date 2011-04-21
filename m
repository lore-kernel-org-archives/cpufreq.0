From: Thomas Renninger <trenn@suse.de>
Subject: cpupower packaging
Date: Thu, 21 Apr 2011 18:00:55 +0200
Message-ID: <201104211800.55548.trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

Whoevers interested or like to suggest changes...

I set up cpupower packages in my home repository,
you find builds against openSUSE factory/11.4/11.3
here:
http://download.opensuse.org/repositories/home:/trenn/

Suggestions, improvements, comments welcome.

Thanks,

    Thomas

cpupower-2.6.39-1.x86_64.rpm:
/usr/bin/cpupower
/usr/share/locale/cs/LC_MESSAGES/cpupower.mo
/usr/share/locale/de/LC_MESSAGES/cpupower.mo
/usr/share/locale/fr/LC_MESSAGES/cpupower.mo
/usr/share/locale/it/LC_MESSAGES/cpupower.mo
/usr/share/locale/pt/LC_MESSAGES/cpupower.mo
/usr/share/man/man1/cpupower-frequency-info.1.gz
/usr/share/man/man1/cpupower-frequency-set.1.gz
/usr/share/man/man1/cpupower-info.1.gz
/usr/share/man/man1/cpupower-monitor.1.gz
/usr/share/man/man1/cpupower-set.1.gz
/usr/share/man/man1/cpupower.1.gz

cpupower-bench-2.6.39-1.x86_64.rpm:
/etc/cpufreq-bench.conf
/usr/bin/cpufreq-bench_plot.sh
/usr/sbin/cpufreq-bench
/usr/share/doc/packages/cpupower
/usr/share/doc/packages/cpupower/README-BENCH
/usr/share/doc/packages/cpupower/examples
/usr/share/doc/packages/cpupower/examples/cpufreq-bench_script.sh

cpupower-devel-2.6.39-1.x86_64.rpm:
/usr/include/cpufreq.h
/usr/lib64/libcpupower.so

libcpupower0-2.6.39-1.x86_64.rpm:
/usr/lib64/libcpupower.so.0
/usr/lib64/libcpupower.so.0.0.0
