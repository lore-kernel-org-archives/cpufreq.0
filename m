From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: post-OLS pending cpufreq patches
Date: Wed, 28 Jul 2004 19:25:29 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040728172529.GC8678@dominikbrodowski.de>
References: <20040727205126.GB9438@dominikbrodowski.de>
	<20040728135916.GA6308@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040728135916.GA6308@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Wed, Jul 28, 2004 at 02:59:16PM +0100, Dave Jones wrote:
> On Tue, Jul 27, 2004 at 10:51:26PM +0200, Dominik Brodowski wrote:
> 
>  > As KS and OLS are over, here's a status update on what patches and/or what
>  > issues (in the world outside of KS and OLS) are at what state at the moment.
>  > Also, I'm looking forward to read Paul's paper in the OLS proceedings, and
>  > to see what Dave has added to his TODO list :)
> 
> I fly back today (should have been last night, but thats a long
> story for another time), and expect to spend a few days doing
> nothing work related at all when I get back 8-)

Enjoy that time!

> Notes I scribbled in my TODO during OLS include..
> - check permissons on cpufreq sysfs files
> Someone mentioned that have these root r-- is a bit
> pointless as they aren't really security sensitive.

-r--------  1 root root 4096 28. Jul 18:43 cpuinfo_cur_freq
-r--r--r--  1 root root 4096 28. Jul 18:43 cpuinfo_max_freq
-r--r--r--  1 root root 4096 28. Jul 18:43 cpuinfo_min_freq
-r--r--r--  1 root root 4096 28. Jul 18:43 scaling_available_frequencies
-r--r--r--  1 root root 4096 28. Jul 18:43 scaling_available_governors
-r--r--r--  1 root root 4096 28. Jul 18:43 scaling_cur_freq
-r--r--r--  1 root root 4096 28. Jul 18:43 scaling_driver
-rw-r--r--  1 root root 4096 28. Jul 18:43 scaling_governor
-rw-r--r--  1 root root 4096 28. Jul 18:43 scaling_max_freq
-rw-r--r--  1 root root 4096 28. Jul 18:43 scaling_min_freq
-rw-r--r--  1 root root 4096 28. Jul 18:43 scaling_setspeed

The only file r-- is "cpuinfo_cur_freq", and that may involve calls to
hardware which may take a bit of time... so it's less a security issue, but
a "local DoS" issue because the system might get unresponsive [though I'd
doubt any current cpufreq driver actually might be "exploitable" this
way...]

> Thanks for scooping up the patches, I'll take a look at merging
> them a few days after I get back, possibly the weekend, Monday
> at the latest.

Thanks,
	Dominik
