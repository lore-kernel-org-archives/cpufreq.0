From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: userspace not supported for longrun?
Date: Wed, 2 Jun 2004 11:30:35 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040602093035.GA13782@poupinou.org>
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
Cc: cpufreq@www.linux.org.uk

On Tue, Jun 01, 2004 at 07:52:05PM -0400, Wayne Wylupski wrote:
> > It's by choice.  Even though there exist some algo. for which it's seems
> > there are better choice over the longrun facilities in order to switch
> > automatically the frequency of the processor, it's hard to get those
> > algo. to mainline mostly due to some kind of patent issues
> > apparently.  So for now the longrun driver do not have the facilities to
> > make what you request.  Would be fine perhaps to add that, but I'm
> > not sure it's in a high priority item for now.
> 
> Thank you.  The issue is that Fedora Core 2 ships with 'cpuspeed' as a
> service, which fails on machines with Crusoe chips because it assumes
> there's a userspace governor without first checking whether there it is
> available.

Well, I assume it's for a laptop, and I assume you can detect more or
less if the AC is plugged or not.  Then all you have to do is to change
between 'powersave' and 'performance' via a little shell script.  For
example, if you have ACPI, it's should be easy to do so with acpid.


> Would it really violate patents if the userspace governor were allowed
> to work along the existing policies ("powersave" and "performance")?  Or is
> it that
> the use of 'cpuspeed' might violate the patent?  Please help me understand
> this,
> because I'm going to try to recommend how FC2 should support Crusoe and
> processors with longrun support.

cpuspeed might violate a patent but I am not sure at 100% (changing
frequency in a feedback loop is more or less patented IIRC).
But that not exactly the trouble.  I doubt that cpuspeed
is better than longrun in order to save more power anyway.

The stuff I'm thinking about have to be done in-kernel as another
governor, not userspace stuff.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
