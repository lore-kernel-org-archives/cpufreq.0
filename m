From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: Speedstep on centrino
Date: Thu, 22 Apr 2004 20:18:38 +1000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1082629118.5672.15.camel@localhost.localdomain>
References: <87n05aoxpa.fsf@dorker.boxed.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <87n05aoxpa.fsf@dorker.boxed.no>
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
To: Alexander Hoogerhuis <alexh@boxed.no>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, cpufreq list <cpufreq@www.linux.org.uk>

On Sun, 2004-04-18 at 11:56, Alexander Hoogerhuis wrote:
> I've been twaddling with getting SpeedStep right on my laptop (HP
> nc6000, 1.6GHz P-M) and noticed a few odd things:
> 
> Using regular SpeedStep is says to use speedstep-centrino due to
> voltage regultion, etc.

Yep, that's reasonable.

> 
> Using SpeedStep for Centrino og gived me this line on boot:
> speedstep-centrino: found "Intel(R) Pentium(R) M processor 1600MHz": max frequency: 1600000kHz

Looks normal.

> This seems to work and make the battery last an useful amount of time.

Good.

> Using SpeedStep for Centrino with decoding the speeds and voltages
> (CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI) will not yield any output during
> boot regarding cpufreq at all and the battery useage is heavy. ACPI is
> enabled. 

I've never managed to get ACPI working on my laptop, so I haven't tested
this.  I'm not sure what's going on here - maybe someone on the cpufreq
list can help.

	J
