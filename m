From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: power measurement
Date: Thu, 23 Oct 2003 21:12:18 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031023211218.C32278@flint.arm.linux.org.uk>
References: <F760B14C9561B941B89469F59BA3A8470255EF6D@orsmsx401.jf.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <F760B14C9561B941B89469F59BA3A8470255EF6D@orsmsx401.jf.intel.com>;
	from andrew.grover@intel.com on Thu, Oct 23, 2003 at 12:48:23PM -0700
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
To: "Grover, Andrew" <andrew.grover@intel.com>
Cc: arjanv@redhat.com, linux-acpilinux-acpi@intel.com, cpufreq@www.linux.org.uk, "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>

On Thu, Oct 23, 2003 at 12:48:23PM -0700, Grover, Andrew wrote:
> > [mailto:cpufreq-bounces@www.linux.org.uk] On Behalf Of Todd Poynor
> > Amps consumed should be a good predictor of expected battery life, 
> > independent of the vagaries of any particular battery.  The expensive 
> > scopemeter used for the attached measurements isn't really 
> > necessary, by 
> > the way; a $130 multimeter that averages DC amps, placed in series 
> > between the DC transformer and the notebook, should do fine.  In case 
> > this helps,
> 
> Can we all get into the habit of reporting power numbers in Watts? Just
> take the amps and multiply by the voltage. This lets one better compare
> platforms with differing supply voltages.
> 
> Please also make sure you have enabled ACPI processor C states. This
> will help to lower idle CPU power in whatever performance state you are
> in.

Also note that the battery charger state should be defined when measuring
the power supplied to a laptop from its AC adapter.  If one laptop is
charging the battery when you make a measurement and another isn't,
you won't be comparing like with like.

I'd also suggest that there will be a fair variability between the
battery chargers in laptops, so this type of measurement will only
make sense if the charger isn't running.

(Note that certainly IBM thinkpads switch to charge mode for a short
time, even if the battery is 100% when the AC adapter is connected.)

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
