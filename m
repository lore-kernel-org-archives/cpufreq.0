From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: userspace not supported for longrun?
Date: Wed, 2 Jun 2004 15:28:04 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040602132804.GC13782@poupinou.org>
References: <6BE4F22C-B37D-11D8-B4AF-003065EE23A0@connact.com>
	<20040601093110.GE7926@poupinou.org>
	<005701c44833$71e8ca30$6900a8c0@DEVELOPER>
	<20040602121916.GA8781@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040602121916.GA8781@dominikbrodowski.de>
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
To: Wayne Wylupski <wayne@connact.com>, cpufreq@www.linux.org.uk

On Wed, Jun 02, 2004 at 02:19:17PM +0200, Dominik Brodowski wrote:
> On Tue, Jun 01, 2004 at 07:52:05PM -0400, Wayne Wylupski wrote:
> > Thank you.  The issue is that Fedora Core 2 ships with 'cpuspeed' as a
> > service, which fails on machines with Crusoe chips because it assumes
> > there's a userspace governor without first checking whether there it is
> > available.
> > 
> > Would it really violate patents if the userspace governor were allowed
> > to work along the existing policies ("powersave" and "performance")?
> 
> No, that's a purely technical issue: The Crusoe chip can only be set to a
> _frequency range_, and the chip itself (actually, the Code Morphing
> Software) decides which actual frequency is best for the current workload.

You can run a crusoe chip on a fixed frequency.

Some people also think that on some situation, the longrun will consume
more power than their algorithm (search for "vertigo OSDI2002", I don't
remmeber the exact link) for an example.

Of course the userspace stuff is completely useless anyway.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
