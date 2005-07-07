From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: enhanced intel speedstep feature was Re: speedstep-centrino on
	dothan
Date: Thu, 7 Jul 2005 23:10:33 +0200
Message-ID: <20050707211033.GB24774@isilmar.linta.de>
References: <20050706112202.33d63d4d@horst.morte.male>
	<42CC37FD.5040708@tmr.com> <20050706211159.GF27630@redhat.com>
	<20050706235557.0c122d33@horst.morte.male>
	<20050707220027.413343d4@horst.morte.male>
	<20050707200648.GA29142@redhat.com>
	<20050707222225.5b3113e0@horst.morte.male>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050707222225.5b3113e0@horst.morte.male>
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
To: st3@riseup.net
Cc: Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

On Thu, Jul 07, 2005 at 10:22:25PM +0200, st3@riseup.net wrote:
> > This hasn't been seen to save any power whatsoever that I've seen.
> 
> It drops down power rating by 1500-1800mW on my Toshiba Satellite A50
> while idling at 400MHz.

Do you use ACPI-based idling? If so, in which state is the CPU in (cat
/proc/acpi/processor/*/power ? I suspect that you do not use ACPI (else 
you wouldn't need the table-based approach) or that the ACPI-based idling is
broken on your notebook; as then the Linux idle handler  only makes use of 
"hlt" (IIRC), that is ACPI C1, while throttling "forces" ACPI C2 (again
 IIRC).

	Dominik
