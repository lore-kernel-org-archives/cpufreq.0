From: Georg Sauthoff <g_sauthoff@web.de>
Subject: Pentium M and 2.4. kernel: does not work
Date: Sat, 16 Aug 2003 00:43:30 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200308160043.30649.g_sauthoff@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hi,

I am just testing the 2.4.22-pre6 patch from Dominik Brodowski. I applied it 
to 2.4.22-rc2 (without failures) and selected following options:
[*] CPU Frequency scaling
[*]  CPU frequency table helpers
[*]  "userspace" for userspace frequency scaling
<*>  Intel Pentium-M Enhanced SpeedStep

So I have /proc/sys/cpu/0/, but "cat speed speed-max speed-min" prints only 0 
to the console.

A dmesg | grep -i cpu prints this:
Initializing CPU#0
Intel machine check reporting enabled on CPU#0.
CPU:     After generic, caps: a7e9f9bf 00000000 00000000 00000000
CPU:             Common caps: a7e9f9bf 00000000 00000000 00000000
CPU: Intel(R) Pentium(R) M processor 1300MHz stepping 05

Ok, perhaps I oversee something ... 

Regards
Georg Sauthoff
