From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: userspace not supported for longrun?
Date: Wed, 2 Jun 2004 14:19:17 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040602121916.GA8781@dominikbrodowski.de>
References: <6BE4F22C-B37D-11D8-B4AF-003065EE23A0@connact.com>
	<20040601093110.GE7926@poupinou.org>
	<005701c44833$71e8ca30$6900a8c0@DEVELOPER>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <005701c44833$71e8ca30$6900a8c0@DEVELOPER>
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
To: Wayne Wylupski <wayne@connact.com>
Cc: Bruno Ducrot <ducrot@poupinou.org>, cpufreq@www.linux.org.uk

On Tue, Jun 01, 2004 at 07:52:05PM -0400, Wayne Wylupski wrote:
> Thank you.  The issue is that Fedora Core 2 ships with 'cpuspeed' as a
> service, which fails on machines with Crusoe chips because it assumes
> there's a userspace governor without first checking whether there it is
> available.
> 
> Would it really violate patents if the userspace governor were allowed
> to work along the existing policies ("powersave" and "performance")?

No, that's a purely technical issue: The Crusoe chip can only be set to a
_frequency range_, and the chip itself (actually, the Code Morphing
Software) decides which actual frequency is best for the current workload.

So, cpufreq governors do not work on such "frequency range" systems. It is
an API mis-design [by me, I have to admit] that the file where the longrun
policy is set is named the same: what you select there is the in-chip
priority, which influences the in-chip decision on what frequency to run.

> because I'm going to try to recommend how FC2 should support Crusoe and
> processors with longrun support.

FC2 should not try to run cpuspeed on crusoe processors, but

select "powersave" as policy [a.k.a scaling_governor] when on battery, and
select "performance" as policy [a.k.a scaling_governor] when on AC. 

That's all.

> If there's an existing e-mail, memo, or document which explains this, I
> would be
> read and work with it.  The existing documentation does not cover this.

Section 2 of Documentation/cpu-freq/user-guide.txt at least has some hints.

	Dominik
