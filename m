From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k8 problem
Date: Mon, 14 Mar 2005 13:10:57 +0100
Message-ID: <20050314121057.GF2298@poupinou.org>
References: <84EA05E2CA77634C82730353CBE3A843021DDD8D@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A843021DDD8D@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Devriendt, Paul" <paul.devriendt@amd.com>
Cc: cpufreq@ZenII.linux.org.uk

On Thu, Mar 10, 2005 at 02:07:48PM -0600, Devriendt, Paul wrote:
> AMD64 systems do not have a FSB. With K7 systems, there was
> a separate northbridge (memory controller/system interface),
> and a bus that connected the processor(s) to the northbridge.
> This was the FSB - Front Side Bus.

You know as me that people delibarately write 'FSB' for system
bus clock.  Ok, I will write now system bus clock.

> With K8 systems, the processors are directly linked with
> HyperTransport, which is a point-to-point link, not a bus.
> 
> I do not understand what the BIOS setting labeled as FSB is
> doing. Incidentally, Hypertransport link speeds are going to
> be 200MHz/400Mhz/600Mhz/800MHz/1GHz only. 

You meant HT is not clocked by the system bus?

> The powernow-k8 driver does not touch link speed.
> 
> PLL Lock Time is not related to link speed. It is the time
> required for the processor to lock to a new frequency. It
> is specified in the processor data sheets and should not
> be messed with. You could increase it if you really wanted 
> to, but all you are doing is adding extra waits on a 
> frequency transition that ought not be needed. See chapter
> 9 in the BIOS and Kernel Developer's Guide (available on
> AMD's web site) for description of the individual variables
> used in frequency changes for K8.

There are BIOS that allow to change the system bus clock. And

<quote>
Reading #26094, 12.2.7.1 FIDVID_CTL Register, Field Description:
Stop Grant Time-Out Count (StpGntTOCnt) -- Bits 51-32.  This
field carries a count of system clock (5 ns) that must elapse
from the time a new FID is applied until the time that the
PLL is stable at the new FID.
</quote>

... field carries a count of system clock (5 ns) that must elapse...
                             ^^^^^^^^^^^^  ^
                            system clock | 5 ns if system clock run
                            is system    | at 200MHz.
                            bus clock    |


And we known there are BIOS that allow a different system bus clock
(which is mispelled FSB) to different values (in general a little
higher than 200MHz), even though the system would run out of AMD specs.

I don't say (and never said) that its a good idea to increase or
decrease the system bus clock to values which are not supported by
AMD.  But there are BIOS (for cheap motherboard, that's strange...),
thats allow it.  Its indeed a marketing argument for gamers most likely.
And those people will increase the system bus clock.

By virtue of robutness, I think powernow-k8 should be updated to
reflect this practice.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
