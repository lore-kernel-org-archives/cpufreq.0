From: Ivan Kanis <ivank@juliva.com>
Subject: Pentium IIIM not recognised
Date: Tue, 16 Sep 2003 00:58:45 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <16230.17445.337511.852664@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hello,

I applied the patch on my 2.4.21 kernel from Dave Jones's home
page. The name of the patch was cpufreq-2.4.21-2.gz.

I have set the following options when compiling the kernel:
[*] CPU Frequency scaling
[*]  CPU frequency table helpers
[*]  "userspace" for userspace frequency scaling
<*>  Intel Speedstep (ICH)

dmesg | grep -i cpu

Initializing CPU#0
CPU: L1 I cache: 16K, L1 D cache: 16K
CPU: L2 cache: 512K
CPU:     After generic, caps: 0383f9ff 00000000 00000000 00000000
CPU:             Common caps: 0383f9ff 00000000 00000000 00000000
CPU: Intel(R) Pentium(R) III Mobile CPU      1000MHz stepping 01
cpufreq: Intel(R) SpeedStep(TM) for this chipset not (yet) available.

I find that kind of strange. Shouldn't my processor be supported?
Should I use a differrent patch.

Thanks in advance for any explanations,

Ivan Kanis
