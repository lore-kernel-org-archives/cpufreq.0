From: Dave Jones <davej@redhat.com>
Subject: Re: post-OLS pending cpufreq patches
Date: Mon, 2 Aug 2004 20:33:50 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040802193350.GA15740@redhat.com>
References: <20040727205126.GB9438@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040727205126.GB9438@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

On Tue, Jul 27, 2004 at 10:51:26PM +0200, Dominik Brodowski wrote:

 > - [core] HT fix before CPU group support is merged
 > 	fixes bug #3012: blind de-referencing of CPUdata independent of
 > 	whether this CPU is actually registered with the CPUfreq core is 
 > 	bad. The small fix proposed is really straightforward, the proper
 > 	solution will be to merge the cpufreq-SMT patchkit, but that's much
 > 	more invasive and not yet completely ready. A "must" for 2.6.8.

couldnt find this in my inbox/cpufreq folder. can you bounce this please?

 > - [speedstep-smi] get_frequencies SMM call causes failures 
 > 	fixes bug reported by Pierre Maziere. Also really straightforward.

ditto (unless this is the 0xffff patch I just merged ?)

 > - [speedstep-centrino] reduce Jeremey's mail [Jeremey Fitzhardinge]
 > 	latest version looks good, I'm just not yet 100% sure whether
 > 	initialization of table is according to new/2.6. coding stlye.
 > 	Please consider for merging for 2.6.8, too.

merged.

 > - [speedstep-centrino] SMP support [Venkatesh Pallipadi]
 > 	looks good, IMO, but needs to be adapted to Jeremey's patch which
 > 	should go in first, IMO.

merged.

 > - [pmac] scaling_availbale_frequencies, #define cleanup [John Clemens]
 > x [pmac] does it keep frequency across suspend? If not, remove "equal" check
 > 		in target and/or set_speed
 > 	Don't really know about pmac's side of things, just wanted to
 > 	mention	it again.

pmac bits I'd rather go via benh, as he has a far better handle
on whats going on in that world, along with hardware with which
to test these changes.
 
 > - [core] SMT patchkit
 > 	needs a bit of work, will re-submit for 2.6.9

Hmm.

Subject: Re: [PATCH 2.6.8-rc2] speedstep SMT support
...
DB> Patch looks good, so: Dave, could you please merge it?

Merged.

 > x [gx-suspmod] trouble
 > 	gx-suspmod seems to be quite sick right now. Even reverting the
 > 	latest changes leads to strange behaviour. Investigating...
 > - [acpi-core] disable SMM access to SpeedStep using ACPI-FADT pstate_cnt
 > 	prepared an updated version, will submit for 2.6.9.

Ok.

Thanks for the summary 8-)

		Dave
