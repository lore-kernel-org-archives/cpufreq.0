From: Arik Raffael Funke <arik.funke@gmx.de>
Subject: Re: Sempron 2800+
Date: Tue, 12 Sep 2006 18:03:19 +0200
Message-ID: <4506DA47.2040000@gmx.de>
References: <ee6f7d$7hc$1@sea.gmane.org>
	<84EA05E2CA77634C82730353CBE3A8430321907D@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <84EA05E2CA77634C82730353CBE3A8430321907D@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Langsdorf, Mark wrote:
 >> I am using kernel version 2.6.17.11 with built-in cpufreq
 >> support on a AMD Sempron 2800+. However, I do not have the
 >> directory /sys/devices/system/cpu/cpu0/cpufreq/
 >>
 >> Can anybody tell me why? Does my cpu not support cpufreq or
 >> have i forgotten to select some kernel modules/configuration?
 >
 > What does `dmesg | grep powern` report?
 >
 > I suspect that your Sempron doesn't have the bit enabled
 > that tells the driver it supports PowerNow!.  Thus, the
 > driver doesn't load.  I haven't had a chance to determine
 > if there's a large batch of Sempron 2800s that don't
 > support PN!, or if they just use a different bit to
 > indicate that support.

dmesg | grep powern reports nothing at all... Is that supposed to be a 
good or bad thing? I fear for the latter. ;-)

Is there anything else I could provide to help with diagnosis?

Regards,
Arik
