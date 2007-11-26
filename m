From: Michael Reinelt <michael@reinelt.co.at>
Subject: Core2Duo locked at 800MHz
Date: Mon, 26 Nov 2007 06:49:06 +0000
Message-ID: <474A6C62.3070103@reinelt.co.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk

Hi there,

I got a strange problem here...

I have a Fujitsu Lifebook E8410 with a 2.4GHz Core2Duo CPU. When I load 
and run various cpufreu utilities, after some time the CPU gets locked 
at 800MHz (the lowest possible frequency)

I tried to debug a bit, but I'm unable to interpret things, so I'm 
asking for some advice.

What I found out is that the problem seems to be related to ACPI or the 
acpi-cpufreq module. When I boot the notebook into single-user mode 
(using vanilla 2.6.23 or 2.6.24-rc3), with no modules loaded, the cpu 
runs at 2.4GHz. As soon as I laod the acpi-cpufreq module, the upper 
limit falls in some steps (2 GHz, 1200MHz) to 800 MHz. Note that there 
is neither acpid nor any powersave daemon running!

I tried to play with cpufreq.debug, but I don't know what all the 
messages are about :-(

I already installed the latest BIOS 1.08 from Fujitsu, but nothing changes.

At the moment my workaround is *not* to load acpi-cpufreq, so the CPU 
stays at 2.4GHz all the time, but I really want to use powersaving with 
the machine....

I'm willing to provide all necessary infos If you tell me what to to.


Thanks in advance, Michael

-- 
Michael Reinelt <michael@reinelt.co.at>
http://home.pages.at/reinelt
GPG-Key 0xDF13BA50
ICQ #288386781
