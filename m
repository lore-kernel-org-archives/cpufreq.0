From: Andras.Horvath@cern.ch
Subject: Re: Intel Clovertown vs. frequency scaling
Date: Fri, 12 Oct 2007 17:01:26 +0200
Message-ID: <20071012150126.GY6058@cern.ch>
References: <20071011150633.GL6058@cern.ch>
	<653FFBB4508B9042B5D43DC9E18836F5017D897B@scsmsx415.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <653FFBB4508B9042B5D43DC9E18836F5017D897B@scsmsx415.amr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

> With latest kernels (2.6.22 and beyond) you should use acpi-cpufreq and
> not speedstep-centrino.

ah, thanks. :-) I found that that too was compiled in (and in fact
that's what's driving the Woodcrest box as well).

> The frequencies supported depends on bus speed and voltages supported by
> the CPU. I think the thing here is you have a low voltage part which is
> already running at lowest possible voltage and does not support any more
> frequency/voltage reduction.

Hm. So there are no P* states available (always running at top speed)
but the CPU just goes to some C* state when it's idle?

This looks right (even if I find it strange) as the specs
(http://download.intel.com/design/Xeon/datashts/31556903.pdf ) say that
"Note: Not all Quad-Core Intel=AE Xeon=AE Processor 5300 Series are capable
of supporting Enhanced Intel SpeedStep Technology. More details on which
processor frequencies will support this feature will be provided in
future releases of the Quad-Core Intel=AE Xeon=AE Processor 5300 Series NDA
Specification Update when available."

Nevertheless http://processorfinder.intel.com/details.aspx?sSpec=3DSLAEN
says the L5335 has Enhanced Intel Speedstep support.

> You mentioned that cpufreq works fine on Woodcrest, Intel L5160.
> What are the freqs supported and what is the max freq for this part?

As I said I was mistaken and it's using acpi-cpufreq. However, this:

model name      : Intel(R) Xeon(R) CPU            5160  @ 3.00GHz

supports the following frequencies (2.6.23):

# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies =

2997000 2664000 2331000 1998000 =



Also, I have found myself another Clovertown:
model name      : Intel(R) Xeon(R) CPU           E5345  @ 2.33GHz

and this seems not to support no frequency scaling, no C-states, only
thermal throttling. Can this be true? From the specs mentioned above I'd
have expected at least some sort of halt state.
http://processorfinder.intel.com/details.aspx?sSpec=3DSL9YL says 'enhanced
intel speedstep' and C1E support, same as Mr. L5335 above.

I'm getting more and more confused about this :)

Andras
