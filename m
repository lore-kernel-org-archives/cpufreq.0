From: Arik Raffael Funke <arik.funke@gmx.de>
Subject: Re: Sempron 2800+
Date: Tue, 12 Sep 2006 22:31:15 +0200
Message-ID: <45071913.7080708@gmx.de>
References: <B3870AD84389624BAF87A3C7B831499303FB29AD@SAUSEXMB2.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <B3870AD84389624BAF87A3C7B831499303FB29AD@SAUSEXMB2.amd.com>
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

shin, jacob wrote:
 > On Tuesday, September 12, 2006 11:03 AM Arik Raffael Funke wrote:
 >
 >> dmesg | grep powern reports nothing at all... Is that supposed to be a
 >> good or bad thing? I fear for the latter. ;-)
 >>
 >> Is there anything else I could provide to help with diagnosis?
 >
 > It is very possible that your Sempron does not support frequency
 > scaling.  Easy way to check is with cpuid instruction.
 >
 > Could you compile and run the following and copy us on the output?

Hi Shin,
the code you provided gives:

[root@funke ~]# ./cputest
00000009
[root@funke ~]#

Regards,
Arik
