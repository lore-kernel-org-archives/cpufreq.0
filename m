From: Dominik Brodowski <linux@brodo.de>
Subject: Re: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPIP-state
	driver
Date: Tue, 21 Oct 2003 22:39:00 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031021203900.GG26971@brodo.de>
References: <7F740D512C7C1046AB53446D3720017304B031@scsmsx402.sc.intel.com>
	<1066766155.a66ff46274f08@carlthompson.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1066766155.a66ff46274f08@carlthompson.net>
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
Content-Transfer-Encoding: 7bit
To: Carl Thompson <cet@carlthompson.net>
Cc: cpufreq@www.linux.org.uk, "Nakajima, Jun" <jun.nakajima@intel.com>, "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>, "Mallick,
	Asit K" <asit.k.mallick@intel.com>, arjanv@redhat.com, linux-acpi <linux-acpi@intel.com>

On Tue, Oct 21, 2003 at 12:55:55PM -0700, Carl Thompson wrote:
> Quoting "Nakajima, Jun" <jun.nakajima@intel.com>:
> 
> > ...
> 
> > It's about the frequency of the feedback loop. As we have much lower
> > latency with P-state transitions, the sampling time can be order of
> > millisecond (or shorter if meaningful). A userland daemon can have a
> > high-level policy (preferences, or set of parameters), but it cannot be
> > part of the real feedback loop. If we combine P-state transitions and
> > deeper C-state transitions, the situation is worse with a userland
> > daemon.
> 
> You are making the assumption that a higher polling frequency (we'll say
> 1ms) is in general better than a lower frequency (we'll say 1s).  I submit
> that it is not.
> 
> If I hit a key on my keyboard and your high frequency loop increases CPU
> speed so that my word processor displays the letter 0.01s faster, is that
> really beneficial?  If a window renders in 0.2s seconds instead of 0.3s is
> that a difference I am going to notice?
> 
> On the other hand, if I do a kernel compile and it is done 0.999s faster
> with the higher frequency loop, am I going to miss that second over such a
> long duration?  (In reality, the compile with the high-frequency loop would
> probably take longer unless it has near zero overhead).
> 
> In my opinion it is wasteful to increase CPU speed unless there is a longer
> term need for it.

Different needs, different opinions, different governors...

	Dominik
