From: <walker01@alice.it>
Subject: Cpufreq ondemand works just to one frequency
Date: Mon, 7 Jan 2008 17:37:28 +0100
Message-ID: <FBCMMO03Cx1Dy3riCTV0000156c@FBCMMO03.fbc.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Cc: cpufreq@lists.linux.org.uk

Hello!!!
This is my first mail in a mailing list...i'm sorry for my bad english but it's not my mother language...
I have a problem with cpufreq...i use the ondemand governor but the problem is what it works just to frequency 498 MHz but my processor support 498 MHz, 598 MHz, 698 MHz, 1.1 GHz like you can see in the cpufreq-info out:

cpufreq-info
analyzing CPU 0:
driver: powernow-k7
CPUs which need to switch frequency at the same time: 0
hardware limits: 498 MHz - 1.1 GHz
available frequency steps: 498 MHz, 598 MHz, 698 MHz, 1.1 GHz
available cpufreq governors: performance, conservative, ondemand, userspace
current policy: frequency should be within 498 MHz and 498 MHz.

The out of cpuinfo_max_freq is:
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq
1096392
And cpuinfo_min_freq is:
/sys/devices/system/cpu//cpufreq/cpuinfo_min_freq
498360
But looking the content of all files in /sys/devices/system/cpu/cpu0/cpufreq i saw that the content of the file scaling_max_freq and scaling_min_freq is the same:

cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
498360

cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
498360

I think this is the problem...because i think the content of scaling_max_freq should be 1096392...
I tried to change it by root with:

echo 1096392 >/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq

But the content dosen't change:
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
498360

I tried to change with the text editor kate...i open the file and repleaced 498360 with 1096392 and i save the file but if i reopen the file it looks empty...
At reboot it's again 498360...

I also search for the file cpufrequtils in /etc/init.d and in /etc/default but there isn't...
I would what the ondemand governor use all the frequencis aviable...
I use slackware 11 and the kernel 2.6.17.13...
Thank you!!!
