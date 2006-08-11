From: Mark Lord <lkml@rtr.ca>
Subject: Re: cpufreq stops working after a while
Date: Fri, 11 Aug 2006 15:01:37 -0400
Message-ID: <44DCD411.1020403@rtr.ca>
References: <44DCCB96.5080801@rtr.ca> <20060811114631.4a699667.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060811114631.4a699667.akpm@osdl.org>
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
To: Andrew Morton <akpm@osdl.org>
Cc: davej@redhat.com, Linux Kernel <linux-kernel@vger.kernel.org>, cpufreq@www.linux.org.uk

Andrew Morton wrote:
> Mark Lord <lkml@rtr.ca> wrote:
..
>> I use speedstep-centrino with it, and after boot all is usually okay.
>> But after a few hours of operation, it stops shifting to the highest frequency
>> even under continuous 100% load (or not).  Eventually it gets stuck at 600Mhz
>> and stays there until I reboot.
..
>> WHY?
> 
> cpufreq seems to have relatively frequent problems.
> 
>>  And how can I fix it?
> 
> You could start by telling us which kernel versions are affected ;)

Heh.  2.6.17.6 and 2.6.18-rc3-git4 are the two kernels I have for it,
and both exhibit the problem.

Dave Jones wrote:
>boot with cpufreq.debug=7, and capture dmesg output after it fails

I'll reboot with the debug options and see..

Cheers
