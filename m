From: Simon Detheridge <simon@symdata.com>
Subject: Re: 2G P4M won't go above 1.2 - cpuinfo_max_freq too low
Date: Thu, 4 Dec 2003 16:21:53 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200312041621.54171.simon@symdata.com>
References: <200311261702.56907.simon@highlyillogical.org>
	<3FCF542B.9040703@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <3FCF542B.9040703@suse.de>
Content-Disposition: inline
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
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@www.linux.org.uk

I wrote:

> 2G P4M won't go above 1.2 - cpuinfo_max_freq too low

Thomas Renninger wrote:

> I have the same problem, cpuinfo shows the wrong value!!!
> I get 1200MHz even I set it up to 1800MHz.
> (posted prog calculates the right value, (procspeed))

Odd. My CPU was definitely running at the slower speed. It wasn't just being 
misreported by /proc/cpuinfo

I fixed the problem by compiling all the cpufreq stuff as modules (I had 
everything compiled into the kernel before) and loading them one-by-one. It 
turns out that my kernel was choosing p4-clockmod by default, which was not 
behaving correctly. Manually loading speedstep_ich fixed the problem.

Simon
