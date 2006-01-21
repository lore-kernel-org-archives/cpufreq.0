From: Mattia Dongili <malattia@linux.it>
Subject: Re: ondemand and p3-m
Date: Sat, 21 Jan 2006 09:09:56 +0100
Message-ID: <20060121080956.GD4457@inferi.kami.home>
References: <1137795365.28411.30.camel@littledragon>
	<43D16EF8.3070502@tremplin-utc.net>
	<1137802814.9837.6.camel@spitfire>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1137802814.9837.6.camel@spitfire>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Niko Ehrenfeuchter <ehrenfeu@informatik.uni-freiburg.de>
Cc: cpufreq@lists.linux.org.uk

Hello!

On Sat, Jan 21, 2006 at 01:20:14AM +0100, Niko Ehrenfeuchter wrote:
> Hi,
> 
> On Sat, 2006-01-21 at 00:15 +0100, Eric Piel wrote:
[...]
> > If so, it's now available 
> > in vanilla kernel since... 2.6.16-rc1, slightly too bleding edge for 
> > common mortals but it means it's coming soon!
> 
> ah, that sounds nice. Missed it only very tight...
> 
> > If you don't want to wait, you can just apply the 2 patches of Mattia 
> > Dongili on a 2.6.15. ("Move PMBASE..." and "Measure transition latency 
> > at driver initialization" _updated_)
> 
> where can I fetch them? The ml-archives?

Move PMBASE away is here
http://lists.linux.org.uk/mailman/private/cpufreq/2005-November/005466.html

and transition latency measurement here
http://lists.linux.org.uk/mailman/private/cpufreq/2005-December/005490.html

or take them from gitweb:
1: <url>http://www.kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff_plain;h=1a10760c91c394dfe4adfefeeaf85cd8098c4894;hp=fc457fa7c0cdbfe96812ba377e508880d600298f</url>
2: <url>http://www.kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff_plain;h=9a7d82a89a8bf55b112f2a5c3b3f405eb95a4303;hp=1a10760c91c394dfe4adfefeeaf85cd8098c4894</url>

hth
-- 
mattia
:wq!
