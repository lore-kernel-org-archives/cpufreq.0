From: ml1050 <ezerotven@gmail.com>
Subject: kernel panic during suspend
Date: Tue, 30 May 2006 11:01:18 +0200
Message-ID: <1350e0a90605300201h7db60b82qaa2dcdbd78b1f4aa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Hi,

Sometimes my kernel dies during suspend. Unfortunately it is not deterministic,
I would say it happens after 20-25 suspend/resume cycles. I made some notes
about the screen dump, please tell me if you need more details. Here
is what I see:

Process dash....
Stack: <0> c0286fe0 c011e797 00000001 df065300 c01eeae5 c01eecc8 00000000 ....
Call trace:
 notifier_call_chain + 0x15/0x2e
 cpufreq_cpu_put +0x8/0x2a
 cpufreq_suspend +0xd3/0xde
 sysdev_suspend + 0x5a/0x1b0
 swsusp_save + 0x15/0x235
...

Code: 84 00 2e c0 89 44 2e 20 9c 8f 44 24 24 ....

I'm using linux 2.6.16.2 with suspend2 2.2.4 on a HP nc8000 laptop, but I've
seen this crash before with earlier versions too. I also have "pci=noapci",
because there seems to be problems with the network driver(tg3) and the sound
card(snd_intel8x0) without it.

My cpufreq related modules:
cpufreq_ondemand,speedstep_centrino,freq_table.

Thanks,Laszlo
