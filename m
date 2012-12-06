From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH RFC 0/1] cpufreq/x86: Add P-state driver for sandy bridge.
Date: Thu, 06 Dec 2012 08:35:28 -0800
Message-ID: <50C0C950.2070007@gmail.com>
References: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com> <50BFAE5A.1010809@verisign.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=ZMvqg/kqgLUJklgMSM/qHpv3mM7Yy9tcd8nkAcjGR5U=;
        b=thO5+YUB0VEzygPD5a02qtpc9FsjEqk+DJCBiFLvhO7Rr2OhEAQVHp1wb9CfDn2+nr
         9nfpeqPhZnNdnt2Snt9WN4iiM8IOqZTs1csygQXdTv8svot8JuA0xRWUlw0qf4NmFPgB
         FXd3geFWwuM0hgOCcEcJ8UmuBz8rf0+kiujsGhwb8Ue7PozIsalSus7GazKuYHhDWtCe
         AVgJ5lW4NwNhMXmOCNNrixsVyh5Km0NYLycNC8kJvwGoFu/MFq0nFLaXXNAbLfcDXknw
         wNthUyP7i3e/QNWMeVvYBy9exrnIDfSeEcLzlZDR+98tcLg0WGiFjHTWHeppu+L2AqMk
         9piQ==
In-Reply-To: <50BFAE5A.1010809@verisign.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David C Niemi <dniemi@verisign.com>
Cc: dirk.brandewie@gmail.com, cpufreq@vger.kernel.org, rjw@sisk.pl, deneen.t.dock@intel.com, arjan@linux.intel.com

On 12/05/2012 12:28 PM, David C Niemi wrote:
 >
 > Dirk,
 >
 > I applaud the work you are doing.

Thanks :-)

 > In general I believe it is important to
 > separate policy (governor and its settings) from the driver,
 > particularly so as different end-users have very different goals for
 > power management.

I agree as a general rule separating mechanism from policy is the
correct thing to do.  As Arajan pointed out in his replies the
"correct" policy decisions are processor architecture /
micro-architecture dependent.

For example in Sandybridge and later processors the requested
frequency during idle has no affect on power consumption the processor
will go to a minimum power state while the core is idle.  So it is
unless to worry about setting the idle frequency and adds a fair
amount of processing and complexity for no benefit in power or
performance.

An generic governor has no hope of getting this type of decision right
to take advantage of the power features of the processor whether is an
IA processor or some other architecture.

 > Not everyone is trying to maximize performance per
 > watt per se (in fact probably rather few end users are doing so
 > literally).  In server applications, for example, the first priority
 > is typically maximum performance when under heavy load, and the second
 > priority is minimum power consumption at idle.  There may not ever be
 > a benefit for choosing one of the middle clock states.

I disagree the server/data center user cares deeply about performance
per watt.  The are selling performance and watts are a cost.  Power
consumption and required cooling are big issues for the data center.

The data center does not want to leave a lot of performance on the
table so they do not need to under provision a servers to satisfy
their SLAs.

I believe that server spend most of their time somewhere between idle
and max performance where selecting an appropriate intermediate
operating frequency will have significant benefit.

The laptop/mobile user cares about performance/watt as well, maybe not
explicitly but they want their shiny new device to show the
performance they paid for with the greatest battery life possible.

The desktop user is likely the most immune to thinking/caring about
performance/watt since most users don't care about (or have a way
measure) the power consumption of the system.


 > would be nice if the new driver can be compatible with the existing
 > governor by exposing an ability to set and report current frequencies.
 > But if this is impractical or pointless for Sandy Bridge, so be it.

I agree that reporting the current frequency is important to some
utilities.  To make this work with the current cpufreq subsystem will
take some amount of refactoring of cpufreq.  I did not take on this
work yet and was hoping to to get some advice from the list on the
correct way to do this.

 > So outside of a research kernel, I don't think having a "cpufreq/snb"
 > directory is a good place to expose tuning parameters,

I agree most of the tunables should NOT be exposed to the user. The
place for the tunables was chosen to make obvious to people that
snb had replaced ondemand.

 > In the long run both integrators and
 > maintainers of Linux distributions are going to insist on a generic
 > interface that can work across the vast majority of modern hardware,
 > rather than cater to a special case that only works on one or CPU
 > families, even if those families are particularly important ones.

How this driver gets integrated in to a system is still an open
question. I can think of more than a few "reasonable" ways to
integrate this into a system.  Before I launched into creating a
solution I wanted feedback/guidance from the list.

--Dirk

