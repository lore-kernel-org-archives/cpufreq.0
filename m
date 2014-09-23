From: Ragu <raguramanmm@gmail.com>
Subject: cpufreq dir under /sys/devices/system/cpu/cpu* is not present for online=0 cpus
Date: Tue, 23 Sep 2014 14:49:55 +0000 (UTC)
Message-ID: <loom.20140923T164259-12@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

I am learning android and finding that the cpufreq dir under
/sys/devices/system/cpu/cpu* is not present when online=0 for a cpu. Why are
we hiding those directory and its content when a cpu goes offline/power
collapse ?

Because of the above, the cpu usage is not very accurate from some tools
which reads data from sysfs.

Thanks,
Ragu

