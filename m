From: Andi Kleen <ak@suse.de>
Subject: Re: [discuss] Re: [PATCH] Allow all Opteron processors to change
	pstate at same time
Date: Wed, 26 Jul 2006 18:54:20 +0200
Message-ID: <200607261854.20670.ak@suse.de>
References: <84EA05E2CA77634C82730353CBE3A84303218F04@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84303218F04@SAUSEXMB1.amd.com>
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
Content-Type: text/plain; charset="us-ascii"
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: discuss@x86-64.org, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org, "Gulam, Nagib" <nagib.gulam@amd.com>


> AMD Opteron(tm) Processor 838 stepping 01
> CPU 3: Syncing TSC to CPU 0.
> CPU 3: synchronized TSC with CPU 0 (last diff -109 cycles, maxerr 1024

Hmm, indeed  - i would have expected higher max errors too.
It should have worked in theory. No explanation currently.

> cycles)
> powernow-k8:    0 : fid 0xe (2200 MHz), vid 0x6
> powernow-k8:    1 : fid 0xc (2000 MHz), vid 0x8
> powernow-k8:    2 : fid 0xa (1800 MHz), vid 0xa
> powernow-k8:    3 : fid 0x2 (1000 MHz), vid 0x12
> 
> Is there a better test we can be using?

I don't know of any. Ok I guess it would be possible to write
something in user space, but it would likely look similar to
the algorithm the kernel uses.

-Andi
